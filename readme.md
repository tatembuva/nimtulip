# tulip-nim

Nim bindings for Tulip Indicators: An open-source library of technical analysis functions written in ANSI C.


## Installation

`nimble install https://github.com/tatembuva/tulip-nim`

WIP* `nimble install tulip-nim`

## Usage

```nim
import tulip-nim as tn

# get version 
echo tn.version(true)
# get indicator list
echo tn.indicators(true)
# get indicator info
echo tn.info(tn.sma, true)
echo tn.info("sma", true)

# call indicator 
var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
var period: float = 3.0 
var res = tn.sma(data, period)
echo res.sma

```

## Licence

This project is licensed under the MIT license. Read LICENSE file for details.

Copyright (c) 2020-2023 Obsidian Labs pvt(ltd).
