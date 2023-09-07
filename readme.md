# nimtulip

Nim bindings for Tulip Indicators : an open-source library of technical analysis functions written in ANSI C.


## Installation

`nimble install https://github.com/tatembuva/nimtulip`

## Usage

```nim
import nimtulip as nti

# get version 
echo nti.version(true)

# get indicator list
echo nti.indicators(true)

# get indicator info
echo nti.indicators("sma", true)

# call indicator 
var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
var period: float = 3.0 
var res = nti.sma(data, period)
echo res.sma

```

## Licence

This project is licensed under the MIT license. Read LICENSE file for details.

Copyright (c) 2020-2023 Obsidian Labs pvt(ltd).
