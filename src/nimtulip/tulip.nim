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

{.passL: "-L/home/tatembuva/code/nimtulip/thirdparty/tulip".}
{.passL: "-lindicators".}

{.pragma: hl,
importc,
header: "/home/tatembuva/code/nimtulip/thirdparty/tulip/indicators.h".}

from math import round


# Hull Moving Average
# ---------------------------------------------------------------------------
proc ti_hma_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_hma(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc hma*(data: seq[float],period: float): tuple[hma: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_hma_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # hma --------------------------------------------------------------------------------
  var hma_d = newSeq[cdouble](output_size)
  var hma_p = cast[ptr UncheckedArray[cdouble]](hma_d[0].addr)
  var o_data = @[hma_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_hma(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var hma_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      hma_seq[i] = round(output_data[0][i].float, 2)
    result = (hma: hma_seq, )

# Vector Arctangent
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_atan_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_atan(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc atan*(data: seq[float],): tuple[atan: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # atan --------------------------------------------------------------------------------
  var atan_d = newSeq[cdouble](output_size)
  var atan_p = cast[ptr UncheckedArray[cdouble]](atan_d[0].addr)
  var o_data = @[atan_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_atan(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var atan_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      atan_seq[i] = round(output_data[0][i].float, 2)
    result = (atan: atan_seq, )

# Awesome Oscillator
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_ao_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_ao(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc ao*(high: seq[float],nlow: seq[float],): tuple[ao: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = high.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # ao --------------------------------------------------------------------------------
  var ao_d = newSeq[cdouble](output_size)
  var ao_p = cast[ptr UncheckedArray[cdouble]](ao_d[0].addr)
  var o_data = @[ao_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_ao(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var ao_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      ao_seq[i] = round(output_data[0][i].float, 2)
    result = (ao: ao_seq, )

# Vector Arcsine
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_asin_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_asin(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc asin*(data: seq[float],): tuple[asin: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # asin --------------------------------------------------------------------------------
  var asin_d = newSeq[cdouble](output_size)
  var asin_p = cast[ptr UncheckedArray[cdouble]](asin_d[0].addr)
  var o_data = @[asin_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_asin(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var asin_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      asin_seq[i] = round(output_data[0][i].float, 2)
    result = (asin: asin_seq, )

# Chaikins Volatility
# ---------------------------------------------------------------------------
proc ti_cvi_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_cvi(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc cvi*(high: seq[float],nlow: seq[float],period: float): tuple[cvi: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_cvi_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # cvi --------------------------------------------------------------------------------
  var cvi_d = newSeq[cdouble](output_size)
  var cvi_p = cast[ptr UncheckedArray[cdouble]](cvi_d[0].addr)
  var o_data = @[cvi_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_cvi(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var cvi_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      cvi_seq[i] = round(output_data[0][i].float, 2)
    result = (cvi: cvi_seq, )

# Ultimate Oscillator
# ---------------------------------------------------------------------------
proc ti_ultosc_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_ultosc(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc ultosc*(high: seq[float],nlow: seq[float],close: seq[float],short_period: float, medium_period: float, long_period: float,): tuple[ultosc: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float]
  i_opts.add(short_period)
  i_opts.add( medium_period)
  i_opts.add( long_period)
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_ultosc_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # ultosc --------------------------------------------------------------------------------
  var ultosc_d = newSeq[cdouble](output_size)
  var ultosc_p = cast[ptr UncheckedArray[cdouble]](ultosc_d[0].addr)
  var o_data = @[ultosc_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_ultosc(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var ultosc_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      ultosc_seq[i] = round(output_data[0][i].float, 2)
    result = (ultosc: ultosc_seq, )

# Minimum In Period
# ---------------------------------------------------------------------------
proc ti_min_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_min(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc min*(data: seq[float],period: float): tuple[min: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_min_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # min --------------------------------------------------------------------------------
  var min_d = newSeq[cdouble](output_size)
  var min_p = cast[ptr UncheckedArray[cdouble]](min_d[0].addr)
  var o_data = @[min_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_min(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var min_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      min_seq[i] = round(output_data[0][i].float, 2)
    result = (min: min_seq, )

# Vector Natural Log
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_ln_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_ln(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc ln*(data: seq[float],): tuple[ln: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # ln --------------------------------------------------------------------------------
  var ln_d = newSeq[cdouble](output_size)
  var ln_p = cast[ptr UncheckedArray[cdouble]](ln_d[0].addr)
  var o_data = @[ln_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_ln(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var ln_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      ln_seq[i] = round(output_data[0][i].float, 2)
    result = (ln: ln_seq, )

# Aroon Oscillator
# ---------------------------------------------------------------------------
proc ti_aroonosc_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_aroonosc(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc aroonosc*(high: seq[float],nlow: seq[float],period: float): tuple[aroonosc: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_aroonosc_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # aroonosc --------------------------------------------------------------------------------
  var aroonosc_d = newSeq[cdouble](output_size)
  var aroonosc_p = cast[ptr UncheckedArray[cdouble]](aroonosc_d[0].addr)
  var o_data = @[aroonosc_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_aroonosc(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var aroonosc_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      aroonosc_seq[i] = round(output_data[0][i].float, 2)
    result = (aroonosc: aroonosc_seq, )

# Trix
# ---------------------------------------------------------------------------
proc ti_trix_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_trix(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc trix*(data: seq[float],period: float): tuple[trix: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_trix_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # trix --------------------------------------------------------------------------------
  var trix_d = newSeq[cdouble](output_size)
  var trix_p = cast[ptr UncheckedArray[cdouble]](trix_d[0].addr)
  var o_data = @[trix_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_trix(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var trix_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      trix_seq[i] = round(output_data[0][i].float, 2)
    result = (trix: trix_seq, )

# Average Price
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_avgprice_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_avgprice(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc avgprice*(open: seq[float],high: seq[float],nlow: seq[float],close: seq[float],): tuple[avgprice: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = open.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # open --------------------------------------------------------------------------------
  var open_p = cast[ptr UncheckedArray[cdouble]](open[0].addr)
  i_data.add(open_p)
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # avgprice --------------------------------------------------------------------------------
  var avgprice_d = newSeq[cdouble](output_size)
  var avgprice_p = cast[ptr UncheckedArray[cdouble]](avgprice_d[0].addr)
  var o_data = @[avgprice_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_avgprice(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var avgprice_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      avgprice_seq[i] = round(output_data[0][i].float, 2)
    result = (avgprice: avgprice_seq, )

# Williams Accumulation/Distribution
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_wad_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_wad(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc wad*(high: seq[float],nlow: seq[float],close: seq[float],): tuple[wad: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = high.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # wad --------------------------------------------------------------------------------
  var wad_d = newSeq[cdouble](output_size)
  var wad_p = cast[ptr UncheckedArray[cdouble]](wad_d[0].addr)
  var o_data = @[wad_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_wad(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var wad_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      wad_seq[i] = round(output_data[0][i].float, 2)
    result = (wad: wad_seq, )

# Chande Momentum Oscillator
# ---------------------------------------------------------------------------
proc ti_cmo_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_cmo(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc cmo*(data: seq[float],period: float): tuple[cmo: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_cmo_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # cmo --------------------------------------------------------------------------------
  var cmo_d = newSeq[cdouble](output_size)
  var cmo_p = cast[ptr UncheckedArray[cdouble]](cmo_d[0].addr)
  var o_data = @[cmo_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_cmo(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var cmo_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      cmo_seq[i] = round(output_data[0][i].float, 2)
    result = (cmo: cmo_seq, )

# Commodity Channel Index
# ---------------------------------------------------------------------------
proc ti_cci_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_cci(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc cci*(high: seq[float],nlow: seq[float],close: seq[float],period: float): tuple[cci: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_cci_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # cci --------------------------------------------------------------------------------
  var cci_d = newSeq[cdouble](output_size)
  var cci_p = cast[ptr UncheckedArray[cdouble]](cci_d[0].addr)
  var o_data = @[cci_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_cci(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var cci_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      cci_seq[i] = round(output_data[0][i].float, 2)
    result = (cci: cci_seq, )

# On Balance Volume
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_obv_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_obv(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc obv*(close: seq[float],volume: seq[float],): tuple[obv: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = close.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  # volume --------------------------------------------------------------------------------
  var volume_p = cast[ptr UncheckedArray[cdouble]](volume[0].addr)
  i_data.add(volume_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # obv --------------------------------------------------------------------------------
  var obv_d = newSeq[cdouble](output_size)
  var obv_p = cast[ptr UncheckedArray[cdouble]](obv_d[0].addr)
  var o_data = @[obv_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_obv(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var obv_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      obv_seq[i] = round(output_data[0][i].float, 2)
    result = (obv: obv_seq, )

# Weighted Moving Average
# ---------------------------------------------------------------------------
proc ti_wma_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_wma(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc wma*(data: seq[float],period: float): tuple[wma: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_wma_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # wma --------------------------------------------------------------------------------
  var wma_d = newSeq[cdouble](output_size)
  var wma_p = cast[ptr UncheckedArray[cdouble]](wma_d[0].addr)
  var o_data = @[wma_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_wma(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var wma_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      wma_seq[i] = round(output_data[0][i].float, 2)
    result = (wma: wma_seq, )

# Williams %R
# ---------------------------------------------------------------------------
proc ti_willr_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_willr(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc willr*(high: seq[float],nlow: seq[float],close: seq[float],period: float): tuple[willr: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_willr_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # willr --------------------------------------------------------------------------------
  var willr_d = newSeq[cdouble](output_size)
  var willr_p = cast[ptr UncheckedArray[cdouble]](willr_d[0].addr)
  var o_data = @[willr_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_willr(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var willr_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      willr_seq[i] = round(output_data[0][i].float, 2)
    result = (willr: willr_seq, )

# Vector Absolute Value
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_abs_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_abs(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc abs*(data: seq[float],): tuple[abs: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # abs --------------------------------------------------------------------------------
  var abs_d = newSeq[cdouble](output_size)
  var abs_p = cast[ptr UncheckedArray[cdouble]](abs_d[0].addr)
  var o_data = @[abs_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_abs(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var abs_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      abs_seq[i] = round(output_data[0][i].float, 2)
    result = (abs: abs_seq, )

# Moving Average Convergence/Divergence
# ---------------------------------------------------------------------------
proc ti_macd_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_macd(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc macd*(data: seq[float],short_period: float, long_period: float, signal_period: float,): tuple[macd: seq[float],macd_signal: seq[float],macd_histogram: seq[float],] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float]
  i_opts.add(short_period)
  i_opts.add( long_period)
  i_opts.add( signal_period)
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_macd_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  var o_data: seq[ptr UncheckedArray[cdouble]]

  # macd --------------------------------------------------------------------------------
  var macd = newSeq[cdouble](output_size)
  var macd_p = cast[ptr UncheckedArray[cdouble]](macd[0].addr)
  o_data.add(macd_p)

  # macd_signal --------------------------------------------------------------------------------
  var macd_signal = newSeq[cdouble](output_size)
  var macd_signal_p = cast[ptr UncheckedArray[cdouble]](macd_signal[0].addr)
  o_data.add(macd_signal_p)

  # macd_histogram --------------------------------------------------------------------------------
  var macd_histogram = newSeq[cdouble](output_size)
  var macd_histogram_p = cast[ptr UncheckedArray[cdouble]](macd_histogram[0].addr)
  o_data.add(macd_histogram_p)

  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)
  # ------------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_macd(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var macd_seq = newSeq[float](output_size)
    var macd_signal_seq = newSeq[float](output_size)
    var macd_histogram_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      macd_seq[i] = round(output_data[0][i].float, 2)
      macd_signal_seq[i] = round(output_data[1][i].float, 2)
      macd_histogram_seq[i] = round(output_data[2][i].float, 2)
    result = (macd: macd_seq, macd_signal: macd_signal_seq, macd_histogram: macd_histogram_seq, )

# Triple Exponential Moving Average
# ---------------------------------------------------------------------------
proc ti_tema_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_tema(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc tema*(data: seq[float],period: float): tuple[tema: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_tema_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # tema --------------------------------------------------------------------------------
  var tema_d = newSeq[cdouble](output_size)
  var tema_p = cast[ptr UncheckedArray[cdouble]](tema_d[0].addr)
  var o_data = @[tema_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_tema(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var tema_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      tema_seq[i] = round(output_data[0][i].float, 2)
    result = (tema: tema_seq, )

# Vector Base-10 Log
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_log10_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_log10(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc log10*(data: seq[float],): tuple[log10: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # log10 --------------------------------------------------------------------------------
  var log10_d = newSeq[cdouble](output_size)
  var log10_p = cast[ptr UncheckedArray[cdouble]](log10_d[0].addr)
  var o_data = @[log10_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_log10(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var log10_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      log10_seq[i] = round(output_data[0][i].float, 2)
    result = (log10: log10_seq, )

# Linear Regression Slope
# ---------------------------------------------------------------------------
proc ti_linregslope_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_linregslope(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc linregslope*(data: seq[float],period: float): tuple[linregslope: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_linregslope_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # linregslope --------------------------------------------------------------------------------
  var linregslope_d = newSeq[cdouble](output_size)
  var linregslope_p = cast[ptr UncheckedArray[cdouble]](linregslope_d[0].addr)
  var o_data = @[linregslope_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_linregslope(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var linregslope_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      linregslope_seq[i] = round(output_data[0][i].float, 2)
    result = (linregslope: linregslope_seq, )

# Exponential Moving Average
# ---------------------------------------------------------------------------
proc ti_ema_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_ema(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc ema*(data: seq[float],period: float): tuple[ema: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_ema_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # ema --------------------------------------------------------------------------------
  var ema_d = newSeq[cdouble](output_size)
  var ema_p = cast[ptr UncheckedArray[cdouble]](ema_d[0].addr)
  var o_data = @[ema_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_ema(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var ema_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      ema_seq[i] = round(output_data[0][i].float, 2)
    result = (ema: ema_seq, )

# Standard Error Over Period
# ---------------------------------------------------------------------------
proc ti_stderr_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_stderr(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc stderr*(data: seq[float],period: float): tuple[stderr: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_stderr_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # stderr --------------------------------------------------------------------------------
  var stderr_d = newSeq[cdouble](output_size)
  var stderr_p = cast[ptr UncheckedArray[cdouble]](stderr_d[0].addr)
  var o_data = @[stderr_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_stderr(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var stderr_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      stderr_seq[i] = round(output_data[0][i].float, 2)
    result = (stderr: stderr_seq, )

# Vector Truncate
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_trunc_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_trunc(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc trunc*(data: seq[float],): tuple[trunc: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # trunc --------------------------------------------------------------------------------
  var trunc_d = newSeq[cdouble](output_size)
  var trunc_p = cast[ptr UncheckedArray[cdouble]](trunc_d[0].addr)
  var o_data = @[trunc_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_trunc(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var trunc_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      trunc_seq[i] = round(output_data[0][i].float, 2)
    result = (trunc: trunc_seq, )

# Vector Square Root
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_sqrt_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_sqrt(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc sqrt*(data: seq[float],): tuple[sqrt: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # sqrt --------------------------------------------------------------------------------
  var sqrt_d = newSeq[cdouble](output_size)
  var sqrt_p = cast[ptr UncheckedArray[cdouble]](sqrt_d[0].addr)
  var o_data = @[sqrt_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_sqrt(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var sqrt_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      sqrt_seq[i] = round(output_data[0][i].float, 2)
    result = (sqrt: sqrt_seq, )

# Positive Volume Index
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_pvi_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_pvi(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc pvi*(close: seq[float],volume: seq[float],): tuple[pvi: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = close.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  # volume --------------------------------------------------------------------------------
  var volume_p = cast[ptr UncheckedArray[cdouble]](volume[0].addr)
  i_data.add(volume_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # pvi --------------------------------------------------------------------------------
  var pvi_d = newSeq[cdouble](output_size)
  var pvi_p = cast[ptr UncheckedArray[cdouble]](pvi_d[0].addr)
  var o_data = @[pvi_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_pvi(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var pvi_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      pvi_seq[i] = round(output_data[0][i].float, 2)
    result = (pvi: pvi_seq, )

# Detrended Price Oscillator
# ---------------------------------------------------------------------------
proc ti_dpo_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_dpo(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc dpo*(data: seq[float],period: float): tuple[dpo: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_dpo_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # dpo --------------------------------------------------------------------------------
  var dpo_d = newSeq[cdouble](output_size)
  var dpo_p = cast[ptr UncheckedArray[cdouble]](dpo_d[0].addr)
  var o_data = @[dpo_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_dpo(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var dpo_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      dpo_seq[i] = round(output_data[0][i].float, 2)
    result = (dpo: dpo_seq, )

# Linear Regression Intercept
# ---------------------------------------------------------------------------
proc ti_linregintercept_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_linregintercept(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc linregintercept*(data: seq[float],period: float): tuple[linregintercept: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_linregintercept_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # linregintercept --------------------------------------------------------------------------------
  var linregintercept_d = newSeq[cdouble](output_size)
  var linregintercept_p = cast[ptr UncheckedArray[cdouble]](linregintercept_d[0].addr)
  var o_data = @[linregintercept_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_linregintercept(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var linregintercept_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      linregintercept_seq[i] = round(output_data[0][i].float, 2)
    result = (linregintercept: linregintercept_seq, )

# Stochastic RSI
# ---------------------------------------------------------------------------
proc ti_stochrsi_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_stochrsi(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc stochrsi*(data: seq[float],period: float): tuple[stochrsi: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_stochrsi_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # stochrsi --------------------------------------------------------------------------------
  var stochrsi_d = newSeq[cdouble](output_size)
  var stochrsi_p = cast[ptr UncheckedArray[cdouble]](stochrsi_d[0].addr)
  var o_data = @[stochrsi_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_stochrsi(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var stochrsi_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      stochrsi_seq[i] = round(output_data[0][i].float, 2)
    result = (stochrsi: stochrsi_seq, )

# Vector Division
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_div_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_div(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc ndiv*(data1: seq[float],data2: seq[float],): tuple[ndiv: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data1.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # data1 --------------------------------------------------------------------------------
  var data1_p = cast[ptr UncheckedArray[cdouble]](data1[0].addr)
  i_data.add(data1_p)
  # data2 --------------------------------------------------------------------------------
  var data2_p = cast[ptr UncheckedArray[cdouble]](data2[0].addr)
  i_data.add(data2_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # ndiv --------------------------------------------------------------------------------
  var ndiv_d = newSeq[cdouble](output_size)
  var ndiv_p = cast[ptr UncheckedArray[cdouble]](ndiv_d[0].addr)
  var o_data = @[ndiv_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_div(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var ndiv_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      ndiv_seq[i] = round(output_data[0][i].float, 2)
    result = (ndiv: ndiv_seq, )

# Mean Deviation Over Period
# ---------------------------------------------------------------------------
proc ti_md_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_md(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc md*(data: seq[float],period: float): tuple[md: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_md_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # md --------------------------------------------------------------------------------
  var md_d = newSeq[cdouble](output_size)
  var md_p = cast[ptr UncheckedArray[cdouble]](md_d[0].addr)
  var o_data = @[md_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_md(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var md_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      md_seq[i] = round(output_data[0][i].float, 2)
    result = (md: md_seq, )

# Normalized Average True Range
# ---------------------------------------------------------------------------
proc ti_natr_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_natr(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc natr*(high: seq[float],nlow: seq[float],close: seq[float],period: float): tuple[natr: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_natr_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # natr --------------------------------------------------------------------------------
  var natr_d = newSeq[cdouble](output_size)
  var natr_p = cast[ptr UncheckedArray[cdouble]](natr_d[0].addr)
  var o_data = @[natr_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_natr(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var natr_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      natr_seq[i] = round(output_data[0][i].float, 2)
    result = (natr: natr_seq, )

# Kaufman Adaptive Moving Average
# ---------------------------------------------------------------------------
proc ti_kama_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_kama(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc kama*(data: seq[float],period: float): tuple[kama: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_kama_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # kama --------------------------------------------------------------------------------
  var kama_d = newSeq[cdouble](output_size)
  var kama_p = cast[ptr UncheckedArray[cdouble]](kama_d[0].addr)
  var o_data = @[kama_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_kama(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var kama_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      kama_seq[i] = round(output_data[0][i].float, 2)
    result = (kama: kama_seq, )

# Vector Multiplication
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_mul_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_mul(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc mul*(data1: seq[float],data2: seq[float],): tuple[mul: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data1.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # data1 --------------------------------------------------------------------------------
  var data1_p = cast[ptr UncheckedArray[cdouble]](data1[0].addr)
  i_data.add(data1_p)
  # data2 --------------------------------------------------------------------------------
  var data2_p = cast[ptr UncheckedArray[cdouble]](data2[0].addr)
  i_data.add(data2_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # mul --------------------------------------------------------------------------------
  var mul_d = newSeq[cdouble](output_size)
  var mul_p = cast[ptr UncheckedArray[cdouble]](mul_d[0].addr)
  var o_data = @[mul_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_mul(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var mul_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      mul_seq[i] = round(output_data[0][i].float, 2)
    result = (mul: mul_seq, )

# Vector Addition
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_add_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_add(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc add*(data1: seq[float],data2: seq[float],): tuple[add: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data1.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # data1 --------------------------------------------------------------------------------
  var data1_p = cast[ptr UncheckedArray[cdouble]](data1[0].addr)
  i_data.add(data1_p)
  # data2 --------------------------------------------------------------------------------
  var data2_p = cast[ptr UncheckedArray[cdouble]](data2[0].addr)
  i_data.add(data2_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # add --------------------------------------------------------------------------------
  var add_d = newSeq[cdouble](output_size)
  var add_p = cast[ptr UncheckedArray[cdouble]](add_d[0].addr)
  var o_data = @[add_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_add(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var add_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      add_seq[i] = round(output_data[0][i].float, 2)
    result = (add: add_seq, )

# Simple Moving Average
# ---------------------------------------------------------------------------
proc ti_sma_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_sma(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc sma*(data: seq[float],period: float): tuple[sma: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_sma_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # sma --------------------------------------------------------------------------------
  var sma_d = newSeq[cdouble](output_size)
  var sma_p = cast[ptr UncheckedArray[cdouble]](sma_d[0].addr)
  var o_data = @[sma_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_sma(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var sma_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      sma_seq[i] = round(output_data[0][i].float, 2)
    result = (sma: sma_seq, )

# Variance Over Period
# ---------------------------------------------------------------------------
proc ti_var_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_var(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc nvar*(data: seq[float],period: float): tuple[nvar: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_var_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # nvar --------------------------------------------------------------------------------
  var nvar_d = newSeq[cdouble](output_size)
  var nvar_p = cast[ptr UncheckedArray[cdouble]](nvar_d[0].addr)
  var o_data = @[nvar_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_var(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var nvar_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      nvar_seq[i] = round(output_data[0][i].float, 2)
    result = (nvar: nvar_seq, )

# Crossany
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_crossany_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_crossany(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc crossany*(data1: seq[float],data2: seq[float],): tuple[crossany: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data1.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # data1 --------------------------------------------------------------------------------
  var data1_p = cast[ptr UncheckedArray[cdouble]](data1[0].addr)
  i_data.add(data1_p)
  # data2 --------------------------------------------------------------------------------
  var data2_p = cast[ptr UncheckedArray[cdouble]](data2[0].addr)
  i_data.add(data2_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # crossany --------------------------------------------------------------------------------
  var crossany_d = newSeq[cdouble](output_size)
  var crossany_p = cast[ptr UncheckedArray[cdouble]](crossany_d[0].addr)
  var o_data = @[crossany_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_crossany(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var crossany_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      crossany_seq[i] = round(output_data[0][i].float, 2)
    result = (crossany: crossany_seq, )

# Relative Strength Index
# ---------------------------------------------------------------------------
proc ti_rsi_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_rsi(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc rsi*(data: seq[float],period: float): tuple[rsi: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_rsi_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # rsi --------------------------------------------------------------------------------
  var rsi_d = newSeq[cdouble](output_size)
  var rsi_p = cast[ptr UncheckedArray[cdouble]](rsi_d[0].addr)
  var o_data = @[rsi_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_rsi(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var rsi_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      rsi_seq[i] = round(output_data[0][i].float, 2)
    result = (rsi: rsi_seq, )

# Directional Indicator
# ---------------------------------------------------------------------------
proc ti_di_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_di(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc di*(high: seq[float],nlow: seq[float],close: seq[float],period: float): tuple[plus_di: seq[float],minus_di: seq[float],] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_di_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  var o_data: seq[ptr UncheckedArray[cdouble]]

  # plus_di --------------------------------------------------------------------------------
  var plus_di = newSeq[cdouble](output_size)
  var plus_di_p = cast[ptr UncheckedArray[cdouble]](plus_di[0].addr)
  o_data.add(plus_di_p)

  # minus_di --------------------------------------------------------------------------------
  var minus_di = newSeq[cdouble](output_size)
  var minus_di_p = cast[ptr UncheckedArray[cdouble]](minus_di[0].addr)
  o_data.add(minus_di_p)

  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)
  # ------------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_di(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var plus_di_seq = newSeq[float](output_size)
    var minus_di_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      plus_di_seq[i] = round(output_data[0][i].float, 2)
      minus_di_seq[i] = round(output_data[1][i].float, 2)
    result = (plus_di: plus_di_seq, minus_di: minus_di_seq, )

# Vector Hyperbolic Cosine
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_cosh_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_cosh(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc cosh*(data: seq[float],): tuple[cosh: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # cosh --------------------------------------------------------------------------------
  var cosh_d = newSeq[cdouble](output_size)
  var cosh_p = cast[ptr UncheckedArray[cdouble]](cosh_d[0].addr)
  var o_data = @[cosh_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_cosh(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var cosh_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      cosh_seq[i] = round(output_data[0][i].float, 2)
    result = (cosh: cosh_seq, )

# Directional Movement Index
# ---------------------------------------------------------------------------
proc ti_dx_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_dx(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc dx*(high: seq[float],nlow: seq[float],period: float): tuple[dx: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_dx_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # dx --------------------------------------------------------------------------------
  var dx_d = newSeq[cdouble](output_size)
  var dx_p = cast[ptr UncheckedArray[cdouble]](dx_d[0].addr)
  var o_data = @[dx_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_dx(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var dx_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      dx_seq[i] = round(output_data[0][i].float, 2)
    result = (dx: dx_seq, )

# Median Price
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_medprice_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_medprice(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc medprice*(high: seq[float],nlow: seq[float],): tuple[medprice: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = high.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # medprice --------------------------------------------------------------------------------
  var medprice_d = newSeq[cdouble](output_size)
  var medprice_p = cast[ptr UncheckedArray[cdouble]](medprice_d[0].addr)
  var o_data = @[medprice_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_medprice(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var medprice_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      medprice_seq[i] = round(output_data[0][i].float, 2)
    result = (medprice: medprice_seq, )

# Linear Decay
# ---------------------------------------------------------------------------
proc ti_decay_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_decay(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc decay*(data: seq[float],period: float): tuple[decay: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_decay_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # decay --------------------------------------------------------------------------------
  var decay_d = newSeq[cdouble](output_size)
  var decay_p = cast[ptr UncheckedArray[cdouble]](decay_d[0].addr)
  var o_data = @[decay_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_decay(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var decay_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      decay_seq[i] = round(output_data[0][i].float, 2)
    result = (decay: decay_seq, )

# Vector Subtraction
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_sub_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_sub(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc sub*(data1: seq[float],data2: seq[float],): tuple[sub: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data1.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # data1 --------------------------------------------------------------------------------
  var data1_p = cast[ptr UncheckedArray[cdouble]](data1[0].addr)
  i_data.add(data1_p)
  # data2 --------------------------------------------------------------------------------
  var data2_p = cast[ptr UncheckedArray[cdouble]](data2[0].addr)
  i_data.add(data2_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # sub --------------------------------------------------------------------------------
  var sub_d = newSeq[cdouble](output_size)
  var sub_p = cast[ptr UncheckedArray[cdouble]](sub_d[0].addr)
  var o_data = @[sub_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_sub(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var sub_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      sub_seq[i] = round(output_data[0][i].float, 2)
    result = (sub: sub_seq, )

# Mass Index
# ---------------------------------------------------------------------------
proc ti_mass_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_mass(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc mass*(high: seq[float],nlow: seq[float],period: float): tuple[mass: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_mass_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # mass --------------------------------------------------------------------------------
  var mass_d = newSeq[cdouble](output_size)
  var mass_p = cast[ptr UncheckedArray[cdouble]](mass_d[0].addr)
  var o_data = @[mass_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_mass(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var mass_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      mass_seq[i] = round(output_data[0][i].float, 2)
    result = (mass: mass_seq, )

# Vector Hyperbolic Tangent
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_tanh_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_tanh(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc tanh*(data: seq[float],): tuple[tanh: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # tanh --------------------------------------------------------------------------------
  var tanh_d = newSeq[cdouble](output_size)
  var tanh_p = cast[ptr UncheckedArray[cdouble]](tanh_d[0].addr)
  var o_data = @[tanh_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_tanh(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var tanh_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      tanh_seq[i] = round(output_data[0][i].float, 2)
    result = (tanh: tanh_seq, )

# Volume Oscillator
# ---------------------------------------------------------------------------
proc ti_vosc_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_vosc(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc vosc*(volume: seq[float],short_period: float, long_period: float,): tuple[vosc: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float]
  i_opts.add(short_period)
  i_opts.add( long_period)
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_vosc_start(opts)
  var input_size = volume.len 
  var output_size = input_size - start
  var volume_p = cast[ptr UncheckedArray[cdouble]](volume[0].addr)
  var i_data = @[volume_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # vosc --------------------------------------------------------------------------------
  var vosc_d = newSeq[cdouble](output_size)
  var vosc_p = cast[ptr UncheckedArray[cdouble]](vosc_d[0].addr)
  var o_data = @[vosc_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_vosc(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var vosc_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      vosc_seq[i] = round(output_data[0][i].float, 2)
    result = (vosc: vosc_seq, )

# Average Directional Movement Index
# ---------------------------------------------------------------------------
proc ti_adx_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_adx(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc adx*(high: seq[float],nlow: seq[float],period: float): tuple[adx: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_adx_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # adx --------------------------------------------------------------------------------
  var adx_d = newSeq[cdouble](output_size)
  var adx_p = cast[ptr UncheckedArray[cdouble]](adx_d[0].addr)
  var o_data = @[adx_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_adx(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var adx_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      adx_seq[i] = round(output_data[0][i].float, 2)
    result = (adx: adx_seq, )

# Vector Degree Conversion
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_todeg_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_todeg(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc todeg*(data: seq[float],): tuple[degrees: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # degrees --------------------------------------------------------------------------------
  var degrees_d = newSeq[cdouble](output_size)
  var degrees_p = cast[ptr UncheckedArray[cdouble]](degrees_d[0].addr)
  var o_data = @[degrees_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_todeg(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var degrees_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      degrees_seq[i] = round(output_data[0][i].float, 2)
    result = (degrees: degrees_seq, )

# Rate of Change
# ---------------------------------------------------------------------------
proc ti_roc_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_roc(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc roc*(data: seq[float],period: float): tuple[roc: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_roc_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # roc --------------------------------------------------------------------------------
  var roc_d = newSeq[cdouble](output_size)
  var roc_p = cast[ptr UncheckedArray[cdouble]](roc_d[0].addr)
  var o_data = @[roc_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_roc(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var roc_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      roc_seq[i] = round(output_data[0][i].float, 2)
    result = (roc: roc_seq, )

# Accumulation/Distribution Line
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_ad_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_ad(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc ad*(high: seq[float],nlow: seq[float],close: seq[float],volume: seq[float],): tuple[ad: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = high.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  # volume --------------------------------------------------------------------------------
  var volume_p = cast[ptr UncheckedArray[cdouble]](volume[0].addr)
  i_data.add(volume_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # ad --------------------------------------------------------------------------------
  var ad_d = newSeq[cdouble](output_size)
  var ad_p = cast[ptr UncheckedArray[cdouble]](ad_d[0].addr)
  var o_data = @[ad_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_ad(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var ad_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      ad_seq[i] = round(output_data[0][i].float, 2)
    result = (ad: ad_seq, )

# Sum Over Period
# ---------------------------------------------------------------------------
proc ti_sum_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_sum(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc sum*(data: seq[float],period: float): tuple[sum: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_sum_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # sum --------------------------------------------------------------------------------
  var sum_d = newSeq[cdouble](output_size)
  var sum_p = cast[ptr UncheckedArray[cdouble]](sum_d[0].addr)
  var o_data = @[sum_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_sum(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var sum_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      sum_seq[i] = round(output_data[0][i].float, 2)
    result = (sum: sum_seq, )

# Qstick
# ---------------------------------------------------------------------------
proc ti_qstick_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_qstick(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc qstick*(open: seq[float],close: seq[float],period: float): tuple[qstick: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_qstick_start(opts)
  var input_size = open.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # open --------------------------------------------------------------------------------
  var open_p = cast[ptr UncheckedArray[cdouble]](open[0].addr)
  i_data.add(open_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # qstick --------------------------------------------------------------------------------
  var qstick_d = newSeq[cdouble](output_size)
  var qstick_p = cast[ptr UncheckedArray[cdouble]](qstick_d[0].addr)
  var o_data = @[qstick_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_qstick(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var qstick_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      qstick_seq[i] = round(output_data[0][i].float, 2)
    result = (qstick: qstick_seq, )

# Vector Floor
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_floor_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_floor(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc floor*(data: seq[float],): tuple[floor: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # floor --------------------------------------------------------------------------------
  var floor_d = newSeq[cdouble](output_size)
  var floor_p = cast[ptr UncheckedArray[cdouble]](floor_d[0].addr)
  var o_data = @[floor_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_floor(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var floor_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      floor_seq[i] = round(output_data[0][i].float, 2)
    result = (floor: floor_seq, )

# Triangular Moving Average
# ---------------------------------------------------------------------------
proc ti_trima_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_trima(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc trima*(data: seq[float],period: float): tuple[trima: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_trima_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # trima --------------------------------------------------------------------------------
  var trima_d = newSeq[cdouble](output_size)
  var trima_p = cast[ptr UncheckedArray[cdouble]](trima_d[0].addr)
  var o_data = @[trima_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_trima(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var trima_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      trima_seq[i] = round(output_data[0][i].float, 2)
    result = (trima: trima_seq, )

# Absolute Price Oscillator
# ---------------------------------------------------------------------------
proc ti_apo_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_apo(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc apo*(data: seq[float],short_period: float, long_period: float,): tuple[apo: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float]
  i_opts.add(short_period)
  i_opts.add( long_period)
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_apo_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # apo --------------------------------------------------------------------------------
  var apo_d = newSeq[cdouble](output_size)
  var apo_p = cast[ptr UncheckedArray[cdouble]](apo_d[0].addr)
  var o_data = @[apo_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_apo(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var apo_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      apo_seq[i] = round(output_data[0][i].float, 2)
    result = (apo: apo_seq, )

# Wilders Smoothing
# ---------------------------------------------------------------------------
proc ti_wilders_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_wilders(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc wilders*(data: seq[float],period: float): tuple[wilders: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_wilders_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # wilders --------------------------------------------------------------------------------
  var wilders_d = newSeq[cdouble](output_size)
  var wilders_p = cast[ptr UncheckedArray[cdouble]](wilders_d[0].addr)
  var o_data = @[wilders_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_wilders(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var wilders_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      wilders_seq[i] = round(output_data[0][i].float, 2)
    result = (wilders: wilders_seq, )

# Vector Round
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_round_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_round(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc round*(data: seq[float],): tuple[round: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # round --------------------------------------------------------------------------------
  var round_d = newSeq[cdouble](output_size)
  var round_p = cast[ptr UncheckedArray[cdouble]](round_d[0].addr)
  var o_data = @[round_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_round(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var round_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      round_seq[i] = round(output_data[0][i].float, 2)
    result = (round: round_seq, )

# Vector Tangent
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_tan_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_tan(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc tan*(data: seq[float],): tuple[tan: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # tan --------------------------------------------------------------------------------
  var tan_d = newSeq[cdouble](output_size)
  var tan_p = cast[ptr UncheckedArray[cdouble]](tan_d[0].addr)
  var o_data = @[tan_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_tan(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var tan_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      tan_seq[i] = round(output_data[0][i].float, 2)
    result = (tan: tan_seq, )

# Average True Range
# ---------------------------------------------------------------------------
proc ti_atr_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_atr(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc atr*(high: seq[float],nlow: seq[float],close: seq[float],period: float): tuple[atr: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_atr_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # atr --------------------------------------------------------------------------------
  var atr_d = newSeq[cdouble](output_size)
  var atr_p = cast[ptr UncheckedArray[cdouble]](atr_d[0].addr)
  var o_data = @[atr_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_atr(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var atr_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      atr_seq[i] = round(output_data[0][i].float, 2)
    result = (atr: atr_seq, )

# Annualized Historical Volatility
# ---------------------------------------------------------------------------
proc ti_volatility_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_volatility(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc volatility*(data: seq[float],period: float): tuple[volatility: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_volatility_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # volatility --------------------------------------------------------------------------------
  var volatility_d = newSeq[cdouble](output_size)
  var volatility_p = cast[ptr UncheckedArray[cdouble]](volatility_d[0].addr)
  var o_data = @[volatility_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_volatility(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var volatility_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      volatility_seq[i] = round(output_data[0][i].float, 2)
    result = (volatility: volatility_seq, )

# Vector Sine
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_sin_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_sin(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc sin*(data: seq[float],): tuple[sin: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # sin --------------------------------------------------------------------------------
  var sin_d = newSeq[cdouble](output_size)
  var sin_p = cast[ptr UncheckedArray[cdouble]](sin_d[0].addr)
  var o_data = @[sin_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_sin(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var sin_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      sin_seq[i] = round(output_data[0][i].float, 2)
    result = (sin: sin_seq, )

# Volume Weighted Moving Average
# ---------------------------------------------------------------------------
proc ti_vwma_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_vwma(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc vwma*(close: seq[float],volume: seq[float],period: float): tuple[vwma: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_vwma_start(opts)
  var input_size = close.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  # volume --------------------------------------------------------------------------------
  var volume_p = cast[ptr UncheckedArray[cdouble]](volume[0].addr)
  i_data.add(volume_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # vwma --------------------------------------------------------------------------------
  var vwma_d = newSeq[cdouble](output_size)
  var vwma_p = cast[ptr UncheckedArray[cdouble]](vwma_d[0].addr)
  var o_data = @[vwma_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_vwma(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var vwma_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      vwma_seq[i] = round(output_data[0][i].float, 2)
    result = (vwma: vwma_seq, )

# Directional Movement
# ---------------------------------------------------------------------------
proc ti_dm_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_dm(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc dm*(high: seq[float],nlow: seq[float],period: float): tuple[plus_dm: seq[float],minus_dm: seq[float],] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_dm_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  var o_data: seq[ptr UncheckedArray[cdouble]]

  # plus_dm --------------------------------------------------------------------------------
  var plus_dm = newSeq[cdouble](output_size)
  var plus_dm_p = cast[ptr UncheckedArray[cdouble]](plus_dm[0].addr)
  o_data.add(plus_dm_p)

  # minus_dm --------------------------------------------------------------------------------
  var minus_dm = newSeq[cdouble](output_size)
  var minus_dm_p = cast[ptr UncheckedArray[cdouble]](minus_dm[0].addr)
  o_data.add(minus_dm_p)

  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)
  # ------------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_dm(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var plus_dm_seq = newSeq[float](output_size)
    var minus_dm_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      plus_dm_seq[i] = round(output_data[0][i].float, 2)
      minus_dm_seq[i] = round(output_data[1][i].float, 2)
    result = (plus_dm: plus_dm_seq, minus_dm: minus_dm_seq, )

# True Range
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_tr_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_tr(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc tr*(high: seq[float],nlow: seq[float],close: seq[float],): tuple[tr: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = high.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # tr --------------------------------------------------------------------------------
  var tr_d = newSeq[cdouble](output_size)
  var tr_p = cast[ptr UncheckedArray[cdouble]](tr_d[0].addr)
  var o_data = @[tr_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_tr(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var tr_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      tr_seq[i] = round(output_data[0][i].float, 2)
    result = (tr: tr_seq, )

# Money Flow Index
# ---------------------------------------------------------------------------
proc ti_mfi_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_mfi(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc mfi*(high: seq[float],nlow: seq[float],close: seq[float],volume: seq[float],period: float): tuple[mfi: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_mfi_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  # volume --------------------------------------------------------------------------------
  var volume_p = cast[ptr UncheckedArray[cdouble]](volume[0].addr)
  i_data.add(volume_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # mfi --------------------------------------------------------------------------------
  var mfi_d = newSeq[cdouble](output_size)
  var mfi_p = cast[ptr UncheckedArray[cdouble]](mfi_d[0].addr)
  var o_data = @[mfi_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_mfi(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var mfi_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      mfi_seq[i] = round(output_data[0][i].float, 2)
    result = (mfi: mfi_seq, )

# Parabolic SAR
# ---------------------------------------------------------------------------
proc ti_psar_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_psar(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc psar*(high: seq[float],nlow: seq[float],acceleration_factor_step: float, acceleration_factor_maximum: float,): tuple[psar: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float]
  i_opts.add(acceleration_factor_step)
  i_opts.add( acceleration_factor_maximum)
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_psar_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # psar --------------------------------------------------------------------------------
  var psar_d = newSeq[cdouble](output_size)
  var psar_p = cast[ptr UncheckedArray[cdouble]](psar_d[0].addr)
  var o_data = @[psar_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_psar(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var psar_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      psar_seq[i] = round(output_data[0][i].float, 2)
    result = (psar: psar_seq, )

# Weighted Close Price
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_wcprice_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_wcprice(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc wcprice*(high: seq[float],nlow: seq[float],close: seq[float],): tuple[wcprice: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = high.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # wcprice --------------------------------------------------------------------------------
  var wcprice_d = newSeq[cdouble](output_size)
  var wcprice_p = cast[ptr UncheckedArray[cdouble]](wcprice_d[0].addr)
  var o_data = @[wcprice_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_wcprice(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var wcprice_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      wcprice_seq[i] = round(output_data[0][i].float, 2)
    result = (wcprice: wcprice_seq, )

# Balance of Power
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_bop_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_bop(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc bop*(open: seq[float],high: seq[float],nlow: seq[float],close: seq[float],): tuple[bop: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = open.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # open --------------------------------------------------------------------------------
  var open_p = cast[ptr UncheckedArray[cdouble]](open[0].addr)
  i_data.add(open_p)
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # bop --------------------------------------------------------------------------------
  var bop_d = newSeq[cdouble](output_size)
  var bop_p = cast[ptr UncheckedArray[cdouble]](bop_d[0].addr)
  var o_data = @[bop_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_bop(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var bop_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      bop_seq[i] = round(output_data[0][i].float, 2)
    result = (bop: bop_seq, )

# Average Directional Movement Rating
# ---------------------------------------------------------------------------
proc ti_adxr_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_adxr(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc adxr*(high: seq[float],nlow: seq[float],period: float): tuple[adxr: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_adxr_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # adxr --------------------------------------------------------------------------------
  var adxr_d = newSeq[cdouble](output_size)
  var adxr_p = cast[ptr UncheckedArray[cdouble]](adxr_d[0].addr)
  var o_data = @[adxr_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_adxr(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var adxr_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      adxr_seq[i] = round(output_data[0][i].float, 2)
    result = (adxr: adxr_seq, )

# Maximum In Period
# ---------------------------------------------------------------------------
proc ti_max_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_max(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc max*(data: seq[float],period: float): tuple[max: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_max_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # max --------------------------------------------------------------------------------
  var max_d = newSeq[cdouble](output_size)
  var max_p = cast[ptr UncheckedArray[cdouble]](max_d[0].addr)
  var o_data = @[max_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_max(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var max_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      max_seq[i] = round(output_data[0][i].float, 2)
    result = (max: max_seq, )

# Forecast Oscillator
# ---------------------------------------------------------------------------
proc ti_fosc_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_fosc(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc fosc*(data: seq[float],period: float): tuple[fosc: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_fosc_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # fosc --------------------------------------------------------------------------------
  var fosc_d = newSeq[cdouble](output_size)
  var fosc_p = cast[ptr UncheckedArray[cdouble]](fosc_d[0].addr)
  var o_data = @[fosc_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_fosc(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var fosc_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      fosc_seq[i] = round(output_data[0][i].float, 2)
    result = (fosc: fosc_seq, )

# Time Series Forecast
# ---------------------------------------------------------------------------
proc ti_tsf_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_tsf(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc tsf*(data: seq[float],period: float): tuple[tsf: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_tsf_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # tsf --------------------------------------------------------------------------------
  var tsf_d = newSeq[cdouble](output_size)
  var tsf_p = cast[ptr UncheckedArray[cdouble]](tsf_d[0].addr)
  var o_data = @[tsf_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_tsf(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var tsf_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      tsf_seq[i] = round(output_data[0][i].float, 2)
    result = (tsf: tsf_seq, )

# Stochastic Oscillator
# ---------------------------------------------------------------------------
proc ti_stoch_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_stoch(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc stoch*(high: seq[float],nlow: seq[float],close: seq[float],k_period: float, k_slowing_period: float, d_period: float,): tuple[stoch_k: seq[float],stoch_d: seq[float],] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float]
  i_opts.add(k_period)
  i_opts.add( k_slowing_period)
  i_opts.add( d_period)
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_stoch_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  var o_data: seq[ptr UncheckedArray[cdouble]]

  # stoch_k --------------------------------------------------------------------------------
  var stoch_k = newSeq[cdouble](output_size)
  var stoch_k_p = cast[ptr UncheckedArray[cdouble]](stoch_k[0].addr)
  o_data.add(stoch_k_p)

  # stoch_d --------------------------------------------------------------------------------
  var stoch_d = newSeq[cdouble](output_size)
  var stoch_d_p = cast[ptr UncheckedArray[cdouble]](stoch_d[0].addr)
  o_data.add(stoch_d_p)

  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)
  # ------------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_stoch(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var stoch_k_seq = newSeq[float](output_size)
    var stoch_d_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      stoch_k_seq[i] = round(output_data[0][i].float, 2)
      stoch_d_seq[i] = round(output_data[1][i].float, 2)
    result = (stoch_k: stoch_k_seq, stoch_d: stoch_d_seq, )

# Fisher Transform
# ---------------------------------------------------------------------------
proc ti_fisher_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_fisher(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc fisher*(high: seq[float],nlow: seq[float],period: float): tuple[fisher: seq[float],fisher_signal: seq[float],] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_fisher_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  var o_data: seq[ptr UncheckedArray[cdouble]]

  # fisher --------------------------------------------------------------------------------
  var fisher = newSeq[cdouble](output_size)
  var fisher_p = cast[ptr UncheckedArray[cdouble]](fisher[0].addr)
  o_data.add(fisher_p)

  # fisher_signal --------------------------------------------------------------------------------
  var fisher_signal = newSeq[cdouble](output_size)
  var fisher_signal_p = cast[ptr UncheckedArray[cdouble]](fisher_signal[0].addr)
  o_data.add(fisher_signal_p)

  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)
  # ------------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_fisher(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var fisher_seq = newSeq[float](output_size)
    var fisher_signal_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      fisher_seq[i] = round(output_data[0][i].float, 2)
      fisher_signal_seq[i] = round(output_data[1][i].float, 2)
    result = (fisher: fisher_seq, fisher_signal: fisher_signal_seq, )

# Vector Hyperbolic Sine
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_sinh_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_sinh(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc sinh*(data: seq[float],): tuple[sinh: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # sinh --------------------------------------------------------------------------------
  var sinh_d = newSeq[cdouble](output_size)
  var sinh_p = cast[ptr UncheckedArray[cdouble]](sinh_d[0].addr)
  var o_data = @[sinh_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_sinh(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var sinh_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      sinh_seq[i] = round(output_data[0][i].float, 2)
    result = (sinh: sinh_seq, )

# Rate of Change Ratio
# ---------------------------------------------------------------------------
proc ti_rocr_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_rocr(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc rocr*(data: seq[float],period: float): tuple[rocr: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_rocr_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # rocr --------------------------------------------------------------------------------
  var rocr_d = newSeq[cdouble](output_size)
  var rocr_p = cast[ptr UncheckedArray[cdouble]](rocr_d[0].addr)
  var o_data = @[rocr_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_rocr(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var rocr_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      rocr_seq[i] = round(output_data[0][i].float, 2)
    result = (rocr: rocr_seq, )

# Lag
# ---------------------------------------------------------------------------
proc ti_lag_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_lag(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc lag*(data: seq[float],period: float): tuple[lag: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_lag_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # lag --------------------------------------------------------------------------------
  var lag_d = newSeq[cdouble](output_size)
  var lag_p = cast[ptr UncheckedArray[cdouble]](lag_d[0].addr)
  var o_data = @[lag_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_lag(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var lag_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      lag_seq[i] = round(output_data[0][i].float, 2)
    result = (lag: lag_seq, )

# Mesa Sine Wave
# ---------------------------------------------------------------------------
proc ti_msw_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_msw(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc msw*(data: seq[float],period: float): tuple[msw_sine: seq[float],msw_lead: seq[float],] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_msw_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  var o_data: seq[ptr UncheckedArray[cdouble]]

  # msw_sine --------------------------------------------------------------------------------
  var msw_sine = newSeq[cdouble](output_size)
  var msw_sine_p = cast[ptr UncheckedArray[cdouble]](msw_sine[0].addr)
  o_data.add(msw_sine_p)

  # msw_lead --------------------------------------------------------------------------------
  var msw_lead = newSeq[cdouble](output_size)
  var msw_lead_p = cast[ptr UncheckedArray[cdouble]](msw_lead[0].addr)
  o_data.add(msw_lead_p)

  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)
  # ------------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_msw(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var msw_sine_seq = newSeq[float](output_size)
    var msw_lead_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      msw_sine_seq[i] = round(output_data[0][i].float, 2)
      msw_lead_seq[i] = round(output_data[1][i].float, 2)
    result = (msw_sine: msw_sine_seq, msw_lead: msw_lead_seq, )

# Vector Radian Conversion
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_torad_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_torad(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc torad*(data: seq[float],): tuple[radians: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # radians --------------------------------------------------------------------------------
  var radians_d = newSeq[cdouble](output_size)
  var radians_p = cast[ptr UncheckedArray[cdouble]](radians_d[0].addr)
  var o_data = @[radians_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_torad(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var radians_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      radians_seq[i] = round(output_data[0][i].float, 2)
    result = (radians: radians_seq, )

# Vector Ceiling
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_ceil_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_ceil(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc ceil*(data: seq[float],): tuple[ceil: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # ceil --------------------------------------------------------------------------------
  var ceil_d = newSeq[cdouble](output_size)
  var ceil_p = cast[ptr UncheckedArray[cdouble]](ceil_d[0].addr)
  var o_data = @[ceil_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_ceil(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var ceil_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      ceil_seq[i] = round(output_data[0][i].float, 2)
    result = (ceil: ceil_seq, )

# Momentum
# ---------------------------------------------------------------------------
proc ti_mom_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_mom(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc mom*(data: seq[float],period: float): tuple[mom: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_mom_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # mom --------------------------------------------------------------------------------
  var mom_d = newSeq[cdouble](output_size)
  var mom_p = cast[ptr UncheckedArray[cdouble]](mom_d[0].addr)
  var o_data = @[mom_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_mom(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var mom_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      mom_seq[i] = round(output_data[0][i].float, 2)
    result = (mom: mom_seq, )

# Negative Volume Index
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_nvi_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_nvi(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc nvi*(close: seq[float],volume: seq[float],): tuple[nvi: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = close.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  # volume --------------------------------------------------------------------------------
  var volume_p = cast[ptr UncheckedArray[cdouble]](volume[0].addr)
  i_data.add(volume_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # nvi --------------------------------------------------------------------------------
  var nvi_d = newSeq[cdouble](output_size)
  var nvi_p = cast[ptr UncheckedArray[cdouble]](nvi_d[0].addr)
  var o_data = @[nvi_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_nvi(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var nvi_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      nvi_seq[i] = round(output_data[0][i].float, 2)
    result = (nvi: nvi_seq, )

# Ease of Movement
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_emv_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_emv(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc emv*(high: seq[float],nlow: seq[float],volume: seq[float],): tuple[emv: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = high.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # volume --------------------------------------------------------------------------------
  var volume_p = cast[ptr UncheckedArray[cdouble]](volume[0].addr)
  i_data.add(volume_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # emv --------------------------------------------------------------------------------
  var emv_d = newSeq[cdouble](output_size)
  var emv_p = cast[ptr UncheckedArray[cdouble]](emv_d[0].addr)
  var o_data = @[emv_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_emv(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var emv_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      emv_seq[i] = round(output_data[0][i].float, 2)
    result = (emv: emv_seq, )

# Bollinger Bands
# ---------------------------------------------------------------------------
proc ti_bbands_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_bbands(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc bbands*(data: seq[float],period: float, stddev: float,): tuple[bbands_lower: seq[float],bbands_middle: seq[float],bbands_upper: seq[float],] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float]
  i_opts.add(period)
  i_opts.add( stddev)
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_bbands_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  var o_data: seq[ptr UncheckedArray[cdouble]]

  # bbands_lower --------------------------------------------------------------------------------
  var bbands_lower = newSeq[cdouble](output_size)
  var bbands_lower_p = cast[ptr UncheckedArray[cdouble]](bbands_lower[0].addr)
  o_data.add(bbands_lower_p)

  # bbands_middle --------------------------------------------------------------------------------
  var bbands_middle = newSeq[cdouble](output_size)
  var bbands_middle_p = cast[ptr UncheckedArray[cdouble]](bbands_middle[0].addr)
  o_data.add(bbands_middle_p)

  # bbands_upper --------------------------------------------------------------------------------
  var bbands_upper = newSeq[cdouble](output_size)
  var bbands_upper_p = cast[ptr UncheckedArray[cdouble]](bbands_upper[0].addr)
  o_data.add(bbands_upper_p)

  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)
  # ------------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_bbands(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var bbands_lower_seq = newSeq[float](output_size)
    var bbands_middle_seq = newSeq[float](output_size)
    var bbands_upper_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      bbands_lower_seq[i] = round(output_data[0][i].float, 2)
      bbands_middle_seq[i] = round(output_data[1][i].float, 2)
      bbands_upper_seq[i] = round(output_data[2][i].float, 2)
    result = (bbands_lower: bbands_lower_seq, bbands_middle: bbands_middle_seq, bbands_upper: bbands_upper_seq, )

# Variable Index Dynamic Average
# ---------------------------------------------------------------------------
proc ti_vidya_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_vidya(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc vidya*(data: seq[float],short_period: float, long_period: float, alpha: float,): tuple[vidya: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float]
  i_opts.add(short_period)
  i_opts.add( long_period)
  i_opts.add( alpha)
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_vidya_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # vidya --------------------------------------------------------------------------------
  var vidya_d = newSeq[cdouble](output_size)
  var vidya_p = cast[ptr UncheckedArray[cdouble]](vidya_d[0].addr)
  var o_data = @[vidya_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_vidya(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var vidya_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      vidya_seq[i] = round(output_data[0][i].float, 2)
    result = (vidya: vidya_seq, )

# Aroon
# ---------------------------------------------------------------------------
proc ti_aroon_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_aroon(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc aroon*(high: seq[float],nlow: seq[float],period: float): tuple[aroon_down: seq[float],aroon_up: seq[float],] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_aroon_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  var o_data: seq[ptr UncheckedArray[cdouble]]

  # aroon_down --------------------------------------------------------------------------------
  var aroon_down = newSeq[cdouble](output_size)
  var aroon_down_p = cast[ptr UncheckedArray[cdouble]](aroon_down[0].addr)
  o_data.add(aroon_down_p)

  # aroon_up --------------------------------------------------------------------------------
  var aroon_up = newSeq[cdouble](output_size)
  var aroon_up_p = cast[ptr UncheckedArray[cdouble]](aroon_up[0].addr)
  o_data.add(aroon_up_p)

  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)
  # ------------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_aroon(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var aroon_down_seq = newSeq[float](output_size)
    var aroon_up_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      aroon_down_seq[i] = round(output_data[0][i].float, 2)
      aroon_up_seq[i] = round(output_data[1][i].float, 2)
    result = (aroon_down: aroon_down_seq, aroon_up: aroon_up_seq, )

# Vertical Horizontal Filter
# ---------------------------------------------------------------------------
proc ti_vhf_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_vhf(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc vhf*(data: seq[float],period: float): tuple[vhf: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_vhf_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # vhf --------------------------------------------------------------------------------
  var vhf_d = newSeq[cdouble](output_size)
  var vhf_p = cast[ptr UncheckedArray[cdouble]](vhf_d[0].addr)
  var o_data = @[vhf_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_vhf(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var vhf_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      vhf_seq[i] = round(output_data[0][i].float, 2)
    result = (vhf: vhf_seq, )

# Exponential Decay
# ---------------------------------------------------------------------------
proc ti_edecay_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_edecay(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc edecay*(data: seq[float],period: float): tuple[edecay: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_edecay_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # edecay --------------------------------------------------------------------------------
  var edecay_d = newSeq[cdouble](output_size)
  var edecay_p = cast[ptr UncheckedArray[cdouble]](edecay_d[0].addr)
  var o_data = @[edecay_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_edecay(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var edecay_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      edecay_seq[i] = round(output_data[0][i].float, 2)
    result = (edecay: edecay_seq, )

# Klinger Volume Oscillator
# ---------------------------------------------------------------------------
proc ti_kvo_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_kvo(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc kvo*(high: seq[float],nlow: seq[float],close: seq[float],volume: seq[float],short_period: float, long_period: float,): tuple[kvo: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float]
  i_opts.add(short_period)
  i_opts.add( long_period)
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_kvo_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  # volume --------------------------------------------------------------------------------
  var volume_p = cast[ptr UncheckedArray[cdouble]](volume[0].addr)
  i_data.add(volume_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # kvo --------------------------------------------------------------------------------
  var kvo_d = newSeq[cdouble](output_size)
  var kvo_p = cast[ptr UncheckedArray[cdouble]](kvo_d[0].addr)
  var o_data = @[kvo_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_kvo(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var kvo_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      kvo_seq[i] = round(output_data[0][i].float, 2)
    result = (kvo: kvo_seq, )

# Vector Arccosine
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_acos_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_acos(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc acos*(data: seq[float],): tuple[acos: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # acos --------------------------------------------------------------------------------
  var acos_d = newSeq[cdouble](output_size)
  var acos_p = cast[ptr UncheckedArray[cdouble]](acos_d[0].addr)
  var o_data = @[acos_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_acos(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var acos_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      acos_seq[i] = round(output_data[0][i].float, 2)
    result = (acos: acos_seq, )

# Percentage Price Oscillator
# ---------------------------------------------------------------------------
proc ti_ppo_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_ppo(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc ppo*(data: seq[float],short_period: float, long_period: float,): tuple[ppo: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float]
  i_opts.add(short_period)
  i_opts.add( long_period)
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_ppo_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # ppo --------------------------------------------------------------------------------
  var ppo_d = newSeq[cdouble](output_size)
  var ppo_p = cast[ptr UncheckedArray[cdouble]](ppo_d[0].addr)
  var o_data = @[ppo_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_ppo(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var ppo_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      ppo_seq[i] = round(output_data[0][i].float, 2)
    result = (ppo: ppo_seq, )

# Typical Price
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_typprice_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_typprice(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc typprice*(high: seq[float],nlow: seq[float],close: seq[float],): tuple[typprice: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = high.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # typprice --------------------------------------------------------------------------------
  var typprice_d = newSeq[cdouble](output_size)
  var typprice_p = cast[ptr UncheckedArray[cdouble]](typprice_d[0].addr)
  var o_data = @[typprice_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_typprice(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var typprice_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      typprice_seq[i] = round(output_data[0][i].float, 2)
    result = (typprice: typprice_seq, )

# Vector Cosine
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_cos_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_cos(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc cos*(data: seq[float],): tuple[cos: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # cos --------------------------------------------------------------------------------
  var cos_d = newSeq[cdouble](output_size)
  var cos_p = cast[ptr UncheckedArray[cdouble]](cos_d[0].addr)
  var o_data = @[cos_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_cos(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var cos_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      cos_seq[i] = round(output_data[0][i].float, 2)
    result = (cos: cos_seq, )

# Vector Exponential
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_exp_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_exp(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc exp*(data: seq[float],): tuple[exp: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data.len 
  var output_size = input_size
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # exp --------------------------------------------------------------------------------
  var exp_d = newSeq[cdouble](output_size)
  var exp_p = cast[ptr UncheckedArray[cdouble]](exp_d[0].addr)
  var o_data = @[exp_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_exp(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var exp_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      exp_seq[i] = round(output_data[0][i].float, 2)
    result = (exp: exp_seq, )

# Double Exponential Moving Average
# ---------------------------------------------------------------------------
proc ti_dema_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_dema(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc dema*(data: seq[float],period: float): tuple[dema: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_dema_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # dema --------------------------------------------------------------------------------
  var dema_d = newSeq[cdouble](output_size)
  var dema_p = cast[ptr UncheckedArray[cdouble]](dema_d[0].addr)
  var o_data = @[dema_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_dema(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var dema_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      dema_seq[i] = round(output_data[0][i].float, 2)
    result = (dema: dema_seq, )

# Linear Regression
# ---------------------------------------------------------------------------
proc ti_linreg_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_linreg(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc linreg*(data: seq[float],period: float): tuple[linreg: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_linreg_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # linreg --------------------------------------------------------------------------------
  var linreg_d = newSeq[cdouble](output_size)
  var linreg_p = cast[ptr UncheckedArray[cdouble]](linreg_d[0].addr)
  var o_data = @[linreg_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_linreg(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var linreg_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      linreg_seq[i] = round(output_data[0][i].float, 2)
    result = (linreg: linreg_seq, )

# Crossover
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_crossover_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_crossover(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc crossover*(data1: seq[float],data2: seq[float],): tuple[crossover: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = data1.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # data1 --------------------------------------------------------------------------------
  var data1_p = cast[ptr UncheckedArray[cdouble]](data1[0].addr)
  i_data.add(data1_p)
  # data2 --------------------------------------------------------------------------------
  var data2_p = cast[ptr UncheckedArray[cdouble]](data2[0].addr)
  i_data.add(data2_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # crossover --------------------------------------------------------------------------------
  var crossover_d = newSeq[cdouble](output_size)
  var crossover_p = cast[ptr UncheckedArray[cdouble]](crossover_d[0].addr)
  var o_data = @[crossover_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_crossover(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var crossover_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      crossover_seq[i] = round(output_data[0][i].float, 2)
    result = (crossover: crossover_seq, )

# Zero-Lag Exponential Moving Average
# ---------------------------------------------------------------------------
proc ti_zlema_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_zlema(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc zlema*(data: seq[float],period: float): tuple[zlema: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_zlema_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # zlema --------------------------------------------------------------------------------
  var zlema_d = newSeq[cdouble](output_size)
  var zlema_p = cast[ptr UncheckedArray[cdouble]](zlema_d[0].addr)
  var o_data = @[zlema_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_zlema(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var zlema_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      zlema_seq[i] = round(output_data[0][i].float, 2)
    result = (zlema: zlema_seq, )

# Standard Deviation Over Period
# ---------------------------------------------------------------------------
proc ti_stddev_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_stddev(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc stddev*(data: seq[float],period: float): tuple[stddev: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[period]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_stddev_start(opts)
  var input_size = data.len 
  var output_size = input_size - start
  var data_p = cast[ptr UncheckedArray[cdouble]](data[0].addr)
  var i_data = @[data_p]
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # stddev --------------------------------------------------------------------------------
  var stddev_d = newSeq[cdouble](output_size)
  var stddev_p = cast[ptr UncheckedArray[cdouble]](stddev_d[0].addr)
  var o_data = @[stddev_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_stddev(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var stddev_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      stddev_seq[i] = round(output_data[0][i].float, 2)
    result = (stddev: stddev_seq, )

# Market Facilitation Index
# ---------------------------------------------------------------------------
# Start function is [Unused]
# proc ti_marketfi_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_marketfi(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc marketfi*(high: seq[float],nlow: seq[float],volume: seq[float],): tuple[marketfi: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float] = @[0.0]
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  var input_size = high.len 
  var output_size = input_size
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # volume --------------------------------------------------------------------------------
  var volume_p = cast[ptr UncheckedArray[cdouble]](volume[0].addr)
  i_data.add(volume_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # marketfi --------------------------------------------------------------------------------
  var marketfi_d = newSeq[cdouble](output_size)
  var marketfi_p = cast[ptr UncheckedArray[cdouble]](marketfi_d[0].addr)
  var o_data = @[marketfi_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_marketfi(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var marketfi_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      marketfi_seq[i] = round(output_data[0][i].float, 2)
    result = (marketfi: marketfi_seq, )

# Accumulation/Distribution Oscillator
# ---------------------------------------------------------------------------
proc ti_adosc_start(options: ptr UncheckedArray[cdouble]): cint {.hl, cdecl.}
proc ti_adosc(size: cint,
                    inputs: ptr UncheckedArray[ptr UncheckedArray[cdouble]],
                    options: ptr UncheckedArray[cdouble],
                    outputs: ptr UncheckedArray[ptr Uncheckedarray[cdouble]]): cint {.hl, cdecl.}
# Extern --------------------------------------------------------------------
# ---------------------------------------------------------------------------
proc adosc*(high: seq[float],nlow: seq[float],close: seq[float],volume: seq[float],short_period: float, long_period: float,): tuple[adosc: seq[float]] =
  # -----------------------------------------------------------------------------------
  # Prepare the options
  # -----------------------------------------------------------------------------------
  var i_opts: seq[float]
  i_opts.add(short_period)
  i_opts.add( long_period)
  var opts = cast[ptr UncheckedArray[cdouble]](i_opts[0].addr)
  # Find start size for given options.
  var start = ti_adosc_start(opts)
  var input_size = high.len 
  var output_size = input_size - start
  var i_data: seq[ptr UncheckedArray[cdouble]]
  # high --------------------------------------------------------------------------------
  var high_p = cast[ptr UncheckedArray[cdouble]](high[0].addr)
  i_data.add(high_p)
  # nlow --------------------------------------------------------------------------------
  var nlow_p = cast[ptr UncheckedArray[cdouble]](nlow[0].addr)
  i_data.add(nlow_p)
  # close --------------------------------------------------------------------------------
  var close_p = cast[ptr UncheckedArray[cdouble]](close[0].addr)
  i_data.add(close_p)
  # volume --------------------------------------------------------------------------------
  var volume_p = cast[ptr UncheckedArray[cdouble]](volume[0].addr)
  i_data.add(volume_p)
  var input_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](i_data[0].addr)
  # -----------------------------------------------------------------------------------

  # -----------------------------------------------------------------------------------
  # Prepare the outputs
  # -----------------------------------------------------------------------------------
 
  # adosc --------------------------------------------------------------------------------
  var adosc_d = newSeq[cdouble](output_size)
  var adosc_p = cast[ptr UncheckedArray[cdouble]](adosc_d[0].addr)
  var o_data = @[adosc_p]
  var output_data = cast[ptr UncheckedArray[ptr UncheckedArray[cdouble]]](o_data[0].addr)

  # -----------------------------------------------------------------------------------
  # Prepare function return 
  # -----------------------------------------------------------------------------------
  # Call Tulip lib func
  let ti_err: cint = ti_adosc(size=input_size.cint, inputs=input_data, options=opts, outputs=output_data)
  if(ti_err > 0):
    echo "Tulip Func Return : " & $ti_err
  else:

    var adosc_seq = newSeq[float](output_size)
    for i in 0..(output_size-1):
      adosc_seq[i] = round(output_data[0][i].float, 2)
    result = (adosc: adosc_seq, )
