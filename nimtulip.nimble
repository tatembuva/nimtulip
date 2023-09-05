# Package

version       = "0.1.0"
author        = "tatembuva"
description   = "Tulip Indicators library bindings for Nim 󰆥"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 2.0.0"


# Tasks

task gen ,"Run bindings generator [bgen.nim]":
  exec "nim c -r --hints:off ./src/nimtulip/bgen.nim"

task testBindings ,"Test bindings [tulip.nim]":
  exec "nim c -r --hints:off ./src/nimtulip/tulip.nim"
