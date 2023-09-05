#  or just use [std/parseutils] to get function names and parameters 
# from the raw header file  

import std/os as os
import std/tables
import std/parseutils as pu
import std/strutils
import std/strformat
import print

# Indicator object
type
  Indicator = object
    name: string
    full_name: string
    i_type: string
    inputs: int
    input_names: seq[string]
    options: int
    option_names: seq[string]
    outputs: int
    output_names: seq[string]
    start_func: string
    start_func_name: string
    run_func: string
    run_func_name: string
    lines: seq[int]

# Print Header
echo("[bgen.nim]")


# Parse out Indicator object from entry line
proc parseIndicator(i: int, lines: Table):Indicator =
  # fullName: string
  var full_name = captureBetween(lines[i-1], '*' , '*').strip()
  # i_type: string
  var i_type = captureBetween(lines[i], ':', '*').strip()
  # inputs: int
  var inputs = captureBetween(lines[i+1], ':' , 'O', start=0).strip()
  # input_names: seq[string]
  var input_names1 = captureBetween(lines[i+2], ':' ,'*').strip().split(",")
  var input_names = newSeq[string](input_names1.len)
  var d_num: int = 1
  for i, n in input_names1:
    if(n.strip() == "real"):
      if(input_names1.len > 1):
        input_names[i] = "data" & $d_num 
        d_num += 1
      elif(input_names1.len == 1):
        input_names[i] = "data"
      else:
        input_names[i] = n.strip()
    elif(n.strip() == "low"):
      input_names[i] = "nlow"
    else:
      input_names[i] = n.strip()

  # options: int
  var options = captureBetween(lines[i+1], ':', 'O', start=23).strip()
  # option_names: seq[string]
  var option_names = captureBetween(lines[i+3], ':', '*').strip().split(",")
  # outputs: int
  var outputs = captureBetween(lines[i+1], ':', '*', start=44).strip()
  # output_names: seq[string]
  var output_names1 = captureBetween(lines[i+4], ':', '*').strip().split(",")
  var output_names = newSeq[string](output_names1.len)
  for i, n in output_names1:
    if(n.strip() == "div" or n.strip() == "var"):
      output_names[i] = "n" & n.strip()
    else:
      output_names[i] = n.strip()
  # start_func: string
  var start_func = lines[i+6]
  var start_func_name = captureBetween(start_func, 't', '(', start=0).strip()
  # run_func: string
  var run_func = lines[i+7]
  var run_func_name = captureBetween(run_func, 't', '(', start=0).strip()
  # name: string
  var name = captureBetween(start_func, '_', '_', start=0).strip()

  if(name == "div"):
    name = "ndiv"

  if(name == "var"):
    name = "nvar"

  # Create Indicator object
  var ind = Indicator(
    name: name,
    full_name: full_name,
    i_type: i_type,
    inputs: parseInt(inputs),
    input_names: input_names,
    options: parseInt(options),
    option_names: option_names,
    outputs: parseInt(outputs),
    output_names: output_names,
    start_func: start_func,
    start_func_name: start_func_name,
    run_func: run_func,
    run_func_name: run_func_name,
    lines: @[i-1, i+4, i+6, i+7]
  )
  result = ind

# Parse raw header file
proc parseHeaderFile(p: string):seq[Indicator] =
  let f = open(p)
  # defer: f.close()
  # Extract a indicator object for each c func decl
  # The lib is very descriptively commented...
  # Keeping it simple; Parse Indicator obj from func comment decoration
  # Keep lines in a Table with an index and do all parsing from that data structure
  var lines = initTable[int, string]()
  var line: string
  var indys: seq[Indicator]
  var i: int = 1
  # Create table
  while f.readLine(line):
    lines[i] = line
    i += 1
  # We can close the file here we don't need it anymore
  f.close()
  echo " "
  print "- LOC[indicators.h] : ", lines.len
  for i, l in lines.pairs:
    # Start by finding comment lines that have [/* Type:]
    if l.contains("/* Type:") :
      var indy = parseIndicator(i, lines)
      indys.add(indy)
  print "- # of Indicator functions to parse : ", indys.len
  result = indys

# Generate API Functions
proc genApiFunc(i: Indicator): string =
  var func_start: string
  func_start = "proc " & i.name & "*("

  var inputs = ""
  var opts = ""
  var outputs = ""
  var func_end = ""

  # Outputs (named)
  if(i.outputs == 1):
      func_end = "): tuple[" & i.output_names[0] & ": seq[float]] =" & "\n"
  elif(i.outputs > 1):
    for n in i.output_names:
      outputs = outputs & n & ": seq[float],"
    func_end = "): tuple[" & outputs & "] =" & "\n"
  else:
    func_end = ") =" & "\n"

  # Inputs (named)
  if(i.inputs > 0): 
    for n in i.input_names:
        inputs = inputs & n & ": seq[float],"
  # Options (named)
  if(i.options > 0):
    if(i.options == 1):
      opts = opts & i.option_names[0] & ": float"
    else:
      for n in i.option_names:
          opts = opts & n & ": float,"
  # Function Definition
  var func_def = func_start & inputs & opts & func_end
  # Function Body
  var func_body = &"""
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
"""
  var body_options = ""
  if(i.options == 1):
    body_options = &"""
  var i_opts: seq[float] = @[{i.option_names[0]}]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = {i.start_func_name}(opts)
  var input_size = {i.input_names[0]}.len 
  var output_size = input_size - start
"""
  elif(i.options == 0):
    body_options = &"""
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = {i.input_names[0]}.len 
  var output_size = input_size
"""
  else:
    body_options = &"""
  var i_opts: seq[float]
"""
    for n in i.option_names:
      body_options = body_options & &"""
  i_opts.add({n})
"""
    body_options = body_options & &"""
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_{i.name}_start(opts)
  var input_size = {i.input_names[0]}.len 
  var output_size = input_size - start
"""

  var body_inputs = &"""
  # -----------------------------------------------------------------------------------
  # Prepare the inputs
  # -----------------------------------------------------------------------------------
"""
  if(i.inputs == 1):
    body_inputs = &"""
  var {i.input_names[0]}_p = cast[ptr UncheckedArray[cdouble]]({i.input_names[0]}[0].addr)
  var i_data = @[{i.input_names[0]}_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
"""
  elif(i.inputs == 0):
    body_inputs = "PANIC!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  else:
    var in_b = &"""
  var i_data: seq[ptr UncheckedArray[cdouble]]
"""
    for n in i.input_names:
      in_b = in_b & &"""
  # {n} --------------------------------------------------------------------------------
  var {n}_p = cast[ptr UncheckedArray[cdouble]]({n}[0].addr)
  i_data.add({n}_p)
""" 
    var in_b_end = &"""
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

"""
    body_inputs = in_b & in_b_end
    
  var body_outputs = &"""
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
"""
  if(i.outputs == 1):
    body_outputs = body_outputs & &"""
  # {i.output_names[0]} --------------------------------------------------------------------------------
  var {i.output_names[0]}_d = newSeq[cdouble](output_size)
  var {i.output_names[0]}_p = cast[ptr UncheckedArray[cdouble]]({i.output_names[0]}_d[0].addr)
  var o_data = @[{i.output_names[0]}_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

"""
  elif(i.outputs == 0):
    print "PANIC!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  else:
    body_outputs = body_outputs & &"""
  var o_data: seq[ptr UncheckedArray[cdouble]]

"""
    var o_n = ""
    for n in i.output_names:
      o_n = o_n & &"""
  # {n} --------------------------------------------------------------------------------
  var {n} = newSeq[cdouble](output_size)
  var {n}_p = cast[ptr UncheckedArray[cdouble]]({n}[0].addr)
  o_data.add({n}_p)

"""
    body_outputs = body_outputs & o_n & &"""
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)
  # ------------------------------------------------------------------------------------

"""
  var func_return = &"""
  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = {i.run_func_name}(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err == 1):
    echo "TI_INVALID_OPTION : " & $ti_err
  elif(ti_err == 2):
    echo "TI_OUT_OF_MEMORY : " & $ti_err
  else:

"""
  var fr_n = ""
  var fr_n2 = "    for i in 0..(output_size-1):\n"
  var fr_n3 = ""
  var fr_n4 = ""
  var r_count: int = 0

  for n in i.output_names:
    fr_n = fr_n & &"""
    var {n}_seq = newSeq[float](output_size)
""" 
    fr_n3 = fr_n3 & &"""
      {n}_seq[i] = round(output_data[{r_count}][i].float, 2)
"""
    if n == "div":
      fr_n4 = fr_n4 & "vdiv" & ": " & n & "_seq, "
    elif n == "var":
      fr_n4 = fr_n4 & "vvar" & ": " & n & "_seq, "
    else:
      fr_n4 = fr_n4 & n & ": " & n & "_seq, "
    r_count += 1

  var fr_n5 = &"""
    result = ({fr_n4})
"""
  func_return = func_return & fr_n & fr_n2 & fr_n3 & fr_n5


  # Concat function body
  func_body = func_body & body_options & body_inputs & body_outputs & func_return



  result = func_def & func_body 

# Generate Nim Bindings
proc genBindings(arr: seq[Indicator], bindings_path: string, header_path: string, link_path: string) =
  var b_path = bindings_path
  var header_path = header_path
  var link_path = link_path
  print "- Generating bindings..."
  print "- Bindings File : ", b_path
  print "nvim " & b_path
  var output = ""
  var file_header = &"""
# nim_tulip_indicators
# --------------------
#
#           $$\     $$\ 
#           $$ |    \__|
#$$$$$$$\ $$$$$$\   $$\ 
#$$  __$$\\_$$  _|  $$ |
#$$ |  $$ | $$ |    $$ |
#$$ |  $$ | $$ |$$\ $$ |
#$$ |  $$ | \$$$$  |$$ |
#\__|  \__|  \____/ \__|
# 
# "󰆥 nim language bindings for the Tulip Indicators library."
# author: @tatembuva <oblabs/2023>

{"\{."}passL: {"\""}-L{os.getCurrentDir()}/thirdparty/tulip{"\".\}"}
{"\{."}passL: {"\""}-lindicators{"\".\}"}

{"\{."}pragma: hl,
importc,
header: {"\""}{header_path}{"\""}{".\}"}

from math import round

"""
  output = output & file_header
  # Write out func declarations in nim
  var func_decls = ""
  for ind in arr:
    if(ind.options == 0):
      func_decls = &"""

# {ind.full_name}
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc {ind.start_func_name}(options: ptr UncheckedArray[cdouble]): cint {"\{."}hl, cdecl{".\}"}
proc {ind.run_func_name}(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {"\{."}hl, cdecl{".\}"}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
"""
    else:
      func_decls = &"""

# {ind.full_name}
# ---------------------------------------------------------------------------
proc {ind.start_func_name}(options: ptr UncheckedArray[cdouble]): cint {"\{."}hl, cdecl{".\}"}
proc {ind.run_func_name}(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {"\{."}hl, cdecl{".\}"}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
"""
    # Write out func implemenations (lib api) in nim
    output = output & func_decls & gen_api_func(ind)
  # Write to File
  writeFile(b_path, output)

proc genApi(arr: seq[Indicator], a_path: string) =
  # write out test functions for each of the indicators
  var output = ""
  var file_header = &"""
#Indicator Functions
"""
  var api_decls = ""
  for j, i in arr:
    var api_func_args = ""
    var api_func_args_call = ""
    for input in i.input_names:
      api_func_args = api_func_args & input & ": seq[float]" & ", "
      api_func_args_call = api_func_args_call & input & "=" & input & ", "
    for option in i.option_names:
      if option != "none":
        api_func_args = api_func_args & option & ": float" &  ", "
        api_func_args_call = api_func_args_call & option & "=" & option & ", "
    # Outputs (named)
    var func_end = ""
    if(i.outputs == 1):
        func_end = "): tuple[" & i.output_names[0] & ": seq[float]] ="
    elif(i.outputs > 1):
      var outputs = "" 
      for n in i.output_names:
        outputs = outputs & n & ": seq[float],"
      func_end = "): tuple[" & outputs & "] =" 
    else:
      func_end = ") ="
    var api_func_call = &"""
# {i.full_name}
proc {i.name}*({api_func_args}{func_end}
  result = ti.{i.name}({api_func_args_call})
"""
    api_decls = api_decls & api_func_call
        

      
  output = file_header & api_decls
  writeFile(a_path, output)

# Generate tests for the entire lib in one file...
proc genTests(arr: seq[Indicator], t_path: string) =
  # write out test functions for each of the 
  # indicators and also do some bench marking 
  # test against [python implimentation]
  var output = ""
  print t_path

  var file_header = &"""
# nim_tulip_indicators
# --------------------
# Unit Tests
#
#  To Run Tests : `nimble test --verbose`.
import unittest

# Nim Tulip Indicators (nti)
import nimtulip as nti

# Misc Funcs
test "[nti.version] : gets lib version" :
  check nti.version() == "0.0.1"
  check nti.version(true) == "0.0.1"
test "[nti.indicators] : get all indicators":
  discard nti.indicators()
test "[nti.indicators(indicator)] : get indicator info":
  discard nti.indicators("sma")

# Indicator Functions
"""
  var test_decls = ""

  for j, i in arr:
    test_decls = test_decls & &"""

# {i.full_name}
test "[nti.{i.name}] : runs {i.full_name}" :
"""
    var ins = ""
    var api_func_args = ""
    for input in i.input_names:
      ins = ins & &"""
  var {input} = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
"""
      api_func_args = api_func_args & input & "=" & input & ", "

    var opts = ""
    for option in i.option_names:
      if option != "none":
        opts = opts & &"""
  var {option}: float = 3.0 
"""
        api_func_args = api_func_args & option & "=" & option & ", "

    var api_func_call = ""
    if i.name == "mass":
      api_func_call = &"""
#  discard nti.{i.name}({api_func_args})
#  Tulip Indicator Library func error...
"""
    else:
      api_func_call = &"""
  discard nti.{i.name}({api_func_args})
"""
    test_decls = test_decls & ins & opts & api_func_call

      
  output = file_header & test_decls
  writeFile(t_path, output)

# gen Indicator list
proc genList(il: seq[Indicator], ip: string) =
  var output = ""
  output = output & "# Indicator List \n"
  output = output & &"""
# Indicator object
type
  Indicator = object
    name: string
    full_name: string
    i_type: string
    inputs: int
    input_names: seq[string]
    options: int
    option_names: seq[string]
    outputs: int
    output_names: seq[string]

var indicators_list: seq[Indicator] = @[
  """
  for j, n in il:
    output = output & &"""
Indicator(
    name: "{n.name}",
    full_name: "{n.full_name}",
    i_type: "{n.i_type}",
    inputs: {n.inputs},
    input_names: {n.input_names},
    options: {n.options},
    option_names: {n.option_names},
    outputs: {n.outputs},
    output_names: {n.output_names},
  ),
    """
  output = output & "]"
  writeFile(ip, output)



proc main() =

  var header_path: string = os.getCurrentDir() & "/thirdparty/tulip/indicators.h"
  var link_path = os.getCurrentDir() & "/thirdparty/tulip/indicators.a"
  var bindings_path: string = os.getCurrentDir() & "/src/nimtulip/tulip.nim"
  var bindings_api_path: string = os.getCurrentDir() &  "/src/nimtulip/indicators.nim"
  var indicator_list_path: string = os.getCurrentDir() & "/src/nimtulip/indicator_list.nim"
  var bindings_tests_path: string = os.getCurrentDir() & "/tests/t_nimtulip.nim"

  var ind_arr = parseHeaderFile(header_path)
  genList(ind_arr, indicator_list_path)

  genBindings(ind_arr, bindings_path, header_path, link_path)
  genTests(ind_arr, bindings_tests_path)
  genApi(ind_arr, bindings_api_path)
main()
