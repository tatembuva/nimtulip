## Tulip Indicators Library bindings for nim-lang.

# Imports
import parsecfg
import std/strformat
import std/sequtils
import std/terminal
import nimtulip/tulip as ti

include nimtulip/indicator_list

# Globals(local)
# var prj: Config = loadConfig("./nimtulip.nimble")
var prj_ver: string = "0.1.0" 


# Pretty printable [info] functions
# Get Lib Version
proc version*(pprint: bool = false): string =
  ## Returns current library version as a string.
  ## (pprint) arg pretty prints the lib header.
  var nti = prj_ver 
  nti = "v" & nti
  var tulip_indicators = "v0.9.2"
  if(pprint):
    styledEcho fgYellow, "\n  󰆥 nim", styleDim, fgDefault, " ﹢", resetStyle, fgGreen, "󰧱 tulip indicators\n"
    styledEcho resetStyle, fgGreen, &"""             $$\""", fgMagenta, &"""     $$\ """
    styledEcho resetStyle, fgGreen, &"""             $$ |""", fgMagenta,&"""    \__|"""
    styledEcho resetStyle, fgYellow, &"""  $$$$$$$\""", fgGreen, &""" $$$$$$\ """, fgMagenta, &"""  $$\ """ 
    styledEcho resetStyle, fgYellow, &"""  $$  __$$\""", fgGreen, &"""\_$$  _|""", fgMagenta, &"""  $$ |""" 
    styledEcho resetStyle, fgYellow, &"""  $$ |  $$ |""", fgGreen, &""" $$ |  """, fgMagenta, &"""  $$ |""" 
    styledEcho resetStyle, fgYellow, &"""  $$ |  $$ |""", fgGreen, &""" $$ |$$\""", fgMagenta, &""" $$ |""" 
    styledEcho resetStyle, fgYellow, &"""  $$ |  $$ |""", fgGreen, &""" \$$$$  |""", fgMagenta, &"""$$ |""" 
    styledEcho resetStyle, fgYellow, &"""  \__|  \__|""", fgGreen, &"""  \____/""", fgMagenta, &""" \__|""", styleDim, fgDefault, &""" 2023""", "\n"
    styledEcho resetStyle, fgDefault, "  repo    : ", resetstyle, styleUnderscore, fgblue, "https://github.com/tatembuva/nimtulip.git", resetStyle
    styledEcho fgDefault, "  version : ", resetStyle, fgCyan, $nti, resetStyle, styleDim, fgDefault, " [tulip indicators", " - ", $tulip_indicators, "]\n"
  return "0.1.0" 

proc indicators*(indicator: string = "", pprint: bool = false): seq[Indicator] =
  ## Returns list or single indicaor info
  ## (pprint) arg pretty prints the result.
  if(pprint):
    if indicator == "":
      echo indicators_list.repr
      return indicators_list
    else: 
      var ni = filter(indicators_list, proc(x: Indicator): bool = x.name == indicator)
      echo ni.repr
      return ni 
  else:
    if indicator == "":
      return indicators_list
    else: 
      return filter(indicators_list, proc(x: Indicator): bool = x.name == indicator)

include nimtulip/indicators
