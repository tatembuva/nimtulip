# Indicator List 
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
  Indicator(
    name: "hma",
    full_name: "Hull Moving Average",
    i_type: "overlay",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["hma"],
  ),
    Indicator(
    name: "atan",
    full_name: "Vector Arctangent",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["atan"],
  ),
    Indicator(
    name: "ao",
    full_name: "Awesome Oscillator",
    i_type: "indicator",
    inputs: 2,
    input_names: @["high", "nlow"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["ao"],
  ),
    Indicator(
    name: "asin",
    full_name: "Vector Arcsine",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["asin"],
  ),
    Indicator(
    name: "cvi",
    full_name: "Chaikins Volatility",
    i_type: "indicator",
    inputs: 2,
    input_names: @["high", "nlow"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["cvi"],
  ),
    Indicator(
    name: "ultosc",
    full_name: "Ultimate Oscillator",
    i_type: "indicator",
    inputs: 3,
    input_names: @["high", "nlow", "close"],
    options: 3,
    option_names: @["short_period", " medium_period", " long_period"],
    outputs: 1,
    output_names: @["ultosc"],
  ),
    Indicator(
    name: "min",
    full_name: "Minimum In Period",
    i_type: "math",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["min"],
  ),
    Indicator(
    name: "ln",
    full_name: "Vector Natural Log",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["ln"],
  ),
    Indicator(
    name: "aroonosc",
    full_name: "Aroon Oscillator",
    i_type: "indicator",
    inputs: 2,
    input_names: @["high", "nlow"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["aroonosc"],
  ),
    Indicator(
    name: "trix",
    full_name: "Trix",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["trix"],
  ),
    Indicator(
    name: "avgprice",
    full_name: "Average Price",
    i_type: "overlay",
    inputs: 4,
    input_names: @["open", "high", "nlow", "close"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["avgprice"],
  ),
    Indicator(
    name: "wad",
    full_name: "Williams Accumulation/Distribution",
    i_type: "indicator",
    inputs: 3,
    input_names: @["high", "nlow", "close"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["wad"],
  ),
    Indicator(
    name: "cmo",
    full_name: "Chande Momentum Oscillator",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["cmo"],
  ),
    Indicator(
    name: "cci",
    full_name: "Commodity Channel Index",
    i_type: "indicator",
    inputs: 3,
    input_names: @["high", "nlow", "close"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["cci"],
  ),
    Indicator(
    name: "obv",
    full_name: "On Balance Volume",
    i_type: "indicator",
    inputs: 2,
    input_names: @["close", "volume"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["obv"],
  ),
    Indicator(
    name: "wma",
    full_name: "Weighted Moving Average",
    i_type: "overlay",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["wma"],
  ),
    Indicator(
    name: "willr",
    full_name: "Williams %R",
    i_type: "indicator",
    inputs: 3,
    input_names: @["high", "nlow", "close"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["willr"],
  ),
    Indicator(
    name: "abs",
    full_name: "Vector Absolute Value",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["abs"],
  ),
    Indicator(
    name: "macd",
    full_name: "Moving Average Convergence/Divergence",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 3,
    option_names: @["short_period", " long_period", " signal_period"],
    outputs: 3,
    output_names: @["macd", "macd_signal", "macd_histogram"],
  ),
    Indicator(
    name: "tema",
    full_name: "Triple Exponential Moving Average",
    i_type: "overlay",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["tema"],
  ),
    Indicator(
    name: "log10",
    full_name: "Vector Base-10 Log",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["log10"],
  ),
    Indicator(
    name: "linregslope",
    full_name: "Linear Regression Slope",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["linregslope"],
  ),
    Indicator(
    name: "ema",
    full_name: "Exponential Moving Average",
    i_type: "overlay",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["ema"],
  ),
    Indicator(
    name: "stderr",
    full_name: "Standard Error Over Period",
    i_type: "math",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["stderr"],
  ),
    Indicator(
    name: "trunc",
    full_name: "Vector Truncate",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["trunc"],
  ),
    Indicator(
    name: "sqrt",
    full_name: "Vector Square Root",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["sqrt"],
  ),
    Indicator(
    name: "pvi",
    full_name: "Positive Volume Index",
    i_type: "indicator",
    inputs: 2,
    input_names: @["close", "volume"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["pvi"],
  ),
    Indicator(
    name: "dpo",
    full_name: "Detrended Price Oscillator",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["dpo"],
  ),
    Indicator(
    name: "linregintercept",
    full_name: "Linear Regression Intercept",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["linregintercept"],
  ),
    Indicator(
    name: "stochrsi",
    full_name: "Stochastic RSI",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["stochrsi"],
  ),
    Indicator(
    name: "ndiv",
    full_name: "Vector Division",
    i_type: "simple",
    inputs: 2,
    input_names: @["data1", "data2"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["ndiv"],
  ),
    Indicator(
    name: "md",
    full_name: "Mean Deviation Over Period",
    i_type: "math",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["md"],
  ),
    Indicator(
    name: "natr",
    full_name: "Normalized Average True Range",
    i_type: "indicator",
    inputs: 3,
    input_names: @["high", "nlow", "close"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["natr"],
  ),
    Indicator(
    name: "kama",
    full_name: "Kaufman Adaptive Moving Average",
    i_type: "overlay",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["kama"],
  ),
    Indicator(
    name: "mul",
    full_name: "Vector Multiplication",
    i_type: "simple",
    inputs: 2,
    input_names: @["data1", "data2"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["mul"],
  ),
    Indicator(
    name: "add",
    full_name: "Vector Addition",
    i_type: "simple",
    inputs: 2,
    input_names: @["data1", "data2"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["add"],
  ),
    Indicator(
    name: "sma",
    full_name: "Simple Moving Average",
    i_type: "overlay",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["sma"],
  ),
    Indicator(
    name: "nvar",
    full_name: "Variance Over Period",
    i_type: "math",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["nvar"],
  ),
    Indicator(
    name: "crossany",
    full_name: "Crossany",
    i_type: "math",
    inputs: 2,
    input_names: @["data1", "data2"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["crossany"],
  ),
    Indicator(
    name: "rsi",
    full_name: "Relative Strength Index",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["rsi"],
  ),
    Indicator(
    name: "di",
    full_name: "Directional Indicator",
    i_type: "indicator",
    inputs: 3,
    input_names: @["high", "nlow", "close"],
    options: 1,
    option_names: @["period"],
    outputs: 2,
    output_names: @["plus_di", "minus_di"],
  ),
    Indicator(
    name: "cosh",
    full_name: "Vector Hyperbolic Cosine",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["cosh"],
  ),
    Indicator(
    name: "dx",
    full_name: "Directional Movement Index",
    i_type: "indicator",
    inputs: 2,
    input_names: @["high", "nlow"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["dx"],
  ),
    Indicator(
    name: "medprice",
    full_name: "Median Price",
    i_type: "overlay",
    inputs: 2,
    input_names: @["high", "nlow"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["medprice"],
  ),
    Indicator(
    name: "decay",
    full_name: "Linear Decay",
    i_type: "math",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["decay"],
  ),
    Indicator(
    name: "sub",
    full_name: "Vector Subtraction",
    i_type: "simple",
    inputs: 2,
    input_names: @["data1", "data2"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["sub"],
  ),
    Indicator(
    name: "mass",
    full_name: "Mass Index",
    i_type: "indicator",
    inputs: 2,
    input_names: @["high", "nlow"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["mass"],
  ),
    Indicator(
    name: "tanh",
    full_name: "Vector Hyperbolic Tangent",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["tanh"],
  ),
    Indicator(
    name: "vosc",
    full_name: "Volume Oscillator",
    i_type: "indicator",
    inputs: 1,
    input_names: @["volume"],
    options: 2,
    option_names: @["short_period", " long_period"],
    outputs: 1,
    output_names: @["vosc"],
  ),
    Indicator(
    name: "adx",
    full_name: "Average Directional Movement Index",
    i_type: "indicator",
    inputs: 2,
    input_names: @["high", "nlow"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["adx"],
  ),
    Indicator(
    name: "todeg",
    full_name: "Vector Degree Conversion",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["degrees"],
  ),
    Indicator(
    name: "roc",
    full_name: "Rate of Change",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["roc"],
  ),
    Indicator(
    name: "ad",
    full_name: "Accumulation/Distribution Line",
    i_type: "indicator",
    inputs: 4,
    input_names: @["high", "nlow", "close", "volume"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["ad"],
  ),
    Indicator(
    name: "sum",
    full_name: "Sum Over Period",
    i_type: "math",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["sum"],
  ),
    Indicator(
    name: "qstick",
    full_name: "Qstick",
    i_type: "indicator",
    inputs: 2,
    input_names: @["open", "close"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["qstick"],
  ),
    Indicator(
    name: "floor",
    full_name: "Vector Floor",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["floor"],
  ),
    Indicator(
    name: "trima",
    full_name: "Triangular Moving Average",
    i_type: "overlay",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["trima"],
  ),
    Indicator(
    name: "apo",
    full_name: "Absolute Price Oscillator",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 2,
    option_names: @["short_period", " long_period"],
    outputs: 1,
    output_names: @["apo"],
  ),
    Indicator(
    name: "wilders",
    full_name: "Wilders Smoothing",
    i_type: "overlay",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["wilders"],
  ),
    Indicator(
    name: "round",
    full_name: "Vector Round",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["round"],
  ),
    Indicator(
    name: "tan",
    full_name: "Vector Tangent",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["tan"],
  ),
    Indicator(
    name: "atr",
    full_name: "Average True Range",
    i_type: "indicator",
    inputs: 3,
    input_names: @["high", "nlow", "close"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["atr"],
  ),
    Indicator(
    name: "volatility",
    full_name: "Annualized Historical Volatility",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["volatility"],
  ),
    Indicator(
    name: "sin",
    full_name: "Vector Sine",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["sin"],
  ),
    Indicator(
    name: "vwma",
    full_name: "Volume Weighted Moving Average",
    i_type: "overlay",
    inputs: 2,
    input_names: @["close", "volume"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["vwma"],
  ),
    Indicator(
    name: "dm",
    full_name: "Directional Movement",
    i_type: "indicator",
    inputs: 2,
    input_names: @["high", "nlow"],
    options: 1,
    option_names: @["period"],
    outputs: 2,
    output_names: @["plus_dm", "minus_dm"],
  ),
    Indicator(
    name: "tr",
    full_name: "True Range",
    i_type: "indicator",
    inputs: 3,
    input_names: @["high", "nlow", "close"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["tr"],
  ),
    Indicator(
    name: "mfi",
    full_name: "Money Flow Index",
    i_type: "indicator",
    inputs: 4,
    input_names: @["high", "nlow", "close", "volume"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["mfi"],
  ),
    Indicator(
    name: "psar",
    full_name: "Parabolic SAR",
    i_type: "overlay",
    inputs: 2,
    input_names: @["high", "nlow"],
    options: 2,
    option_names: @["acceleration_factor_step", " acceleration_factor_maximum"],
    outputs: 1,
    output_names: @["psar"],
  ),
    Indicator(
    name: "wcprice",
    full_name: "Weighted Close Price",
    i_type: "overlay",
    inputs: 3,
    input_names: @["high", "nlow", "close"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["wcprice"],
  ),
    Indicator(
    name: "bop",
    full_name: "Balance of Power",
    i_type: "indicator",
    inputs: 4,
    input_names: @["open", "high", "nlow", "close"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["bop"],
  ),
    Indicator(
    name: "adxr",
    full_name: "Average Directional Movement Rating",
    i_type: "indicator",
    inputs: 2,
    input_names: @["high", "nlow"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["adxr"],
  ),
    Indicator(
    name: "max",
    full_name: "Maximum In Period",
    i_type: "math",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["max"],
  ),
    Indicator(
    name: "fosc",
    full_name: "Forecast Oscillator",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["fosc"],
  ),
    Indicator(
    name: "tsf",
    full_name: "Time Series Forecast",
    i_type: "overlay",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["tsf"],
  ),
    Indicator(
    name: "stoch",
    full_name: "Stochastic Oscillator",
    i_type: "indicator",
    inputs: 3,
    input_names: @["high", "nlow", "close"],
    options: 3,
    option_names: @["k_period", " k_slowing_period", " d_period"],
    outputs: 2,
    output_names: @["stoch_k", "stoch_d"],
  ),
    Indicator(
    name: "fisher",
    full_name: "Fisher Transform",
    i_type: "indicator",
    inputs: 2,
    input_names: @["high", "nlow"],
    options: 1,
    option_names: @["period"],
    outputs: 2,
    output_names: @["fisher", "fisher_signal"],
  ),
    Indicator(
    name: "sinh",
    full_name: "Vector Hyperbolic Sine",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["sinh"],
  ),
    Indicator(
    name: "rocr",
    full_name: "Rate of Change Ratio",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["rocr"],
  ),
    Indicator(
    name: "lag",
    full_name: "Lag",
    i_type: "math",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["lag"],
  ),
    Indicator(
    name: "msw",
    full_name: "Mesa Sine Wave",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 2,
    output_names: @["msw_sine", "msw_lead"],
  ),
    Indicator(
    name: "torad",
    full_name: "Vector Radian Conversion",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["radians"],
  ),
    Indicator(
    name: "ceil",
    full_name: "Vector Ceiling",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["ceil"],
  ),
    Indicator(
    name: "mom",
    full_name: "Momentum",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["mom"],
  ),
    Indicator(
    name: "nvi",
    full_name: "Negative Volume Index",
    i_type: "indicator",
    inputs: 2,
    input_names: @["close", "volume"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["nvi"],
  ),
    Indicator(
    name: "emv",
    full_name: "Ease of Movement",
    i_type: "indicator",
    inputs: 3,
    input_names: @["high", "nlow", "volume"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["emv"],
  ),
    Indicator(
    name: "bbands",
    full_name: "Bollinger Bands",
    i_type: "overlay",
    inputs: 1,
    input_names: @["data"],
    options: 2,
    option_names: @["period", " stddev"],
    outputs: 3,
    output_names: @["bbands_lower", "bbands_middle", "bbands_upper"],
  ),
    Indicator(
    name: "vidya",
    full_name: "Variable Index Dynamic Average",
    i_type: "overlay",
    inputs: 1,
    input_names: @["data"],
    options: 3,
    option_names: @["short_period", " long_period", " alpha"],
    outputs: 1,
    output_names: @["vidya"],
  ),
    Indicator(
    name: "aroon",
    full_name: "Aroon",
    i_type: "indicator",
    inputs: 2,
    input_names: @["high", "nlow"],
    options: 1,
    option_names: @["period"],
    outputs: 2,
    output_names: @["aroon_down", "aroon_up"],
  ),
    Indicator(
    name: "vhf",
    full_name: "Vertical Horizontal Filter",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["vhf"],
  ),
    Indicator(
    name: "edecay",
    full_name: "Exponential Decay",
    i_type: "math",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["edecay"],
  ),
    Indicator(
    name: "kvo",
    full_name: "Klinger Volume Oscillator",
    i_type: "indicator",
    inputs: 4,
    input_names: @["high", "nlow", "close", "volume"],
    options: 2,
    option_names: @["short_period", " long_period"],
    outputs: 1,
    output_names: @["kvo"],
  ),
    Indicator(
    name: "acos",
    full_name: "Vector Arccosine",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["acos"],
  ),
    Indicator(
    name: "ppo",
    full_name: "Percentage Price Oscillator",
    i_type: "indicator",
    inputs: 1,
    input_names: @["data"],
    options: 2,
    option_names: @["short_period", " long_period"],
    outputs: 1,
    output_names: @["ppo"],
  ),
    Indicator(
    name: "typprice",
    full_name: "Typical Price",
    i_type: "overlay",
    inputs: 3,
    input_names: @["high", "nlow", "close"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["typprice"],
  ),
    Indicator(
    name: "cos",
    full_name: "Vector Cosine",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["cos"],
  ),
    Indicator(
    name: "exp",
    full_name: "Vector Exponential",
    i_type: "simple",
    inputs: 1,
    input_names: @["data"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["exp"],
  ),
    Indicator(
    name: "dema",
    full_name: "Double Exponential Moving Average",
    i_type: "overlay",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["dema"],
  ),
    Indicator(
    name: "linreg",
    full_name: "Linear Regression",
    i_type: "overlay",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["linreg"],
  ),
    Indicator(
    name: "crossover",
    full_name: "Crossover",
    i_type: "math",
    inputs: 2,
    input_names: @["data1", "data2"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["crossover"],
  ),
    Indicator(
    name: "zlema",
    full_name: "Zero-Lag Exponential Moving Average",
    i_type: "overlay",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["zlema"],
  ),
    Indicator(
    name: "stddev",
    full_name: "Standard Deviation Over Period",
    i_type: "math",
    inputs: 1,
    input_names: @["data"],
    options: 1,
    option_names: @["period"],
    outputs: 1,
    output_names: @["stddev"],
  ),
    Indicator(
    name: "marketfi",
    full_name: "Market Facilitation Index",
    i_type: "indicator",
    inputs: 3,
    input_names: @["high", "nlow", "volume"],
    options: 0,
    option_names: @["none"],
    outputs: 1,
    output_names: @["marketfi"],
  ),
    Indicator(
    name: "adosc",
    full_name: "Accumulation/Distribution Oscillator",
    i_type: "indicator",
    inputs: 4,
    input_names: @["high", "nlow", "close", "volume"],
    options: 2,
    option_names: @["short_period", " long_period"],
    outputs: 1,
    output_names: @["adosc"],
  ),
    ]