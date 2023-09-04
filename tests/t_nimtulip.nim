# nim_tulip_indicators
# --------------------
# Unit Tests
#
#  To Run Tests : `nimble test --verbose`.
import unittest
import print

# Nim Tulip Indicators (nti)
import nimtulip as nti

# Misc Funcs
test "[nti.version] : gets lib version" :
  check nti.version() == "0.0.1"
  check nti.version(true) == "0.0.1"

# Indicator Functions

# Hull Moving Average
test "[nti.hma] : runs Hull Moving Average" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.hma(data=data, period=period, )

# Vector Arctangent
test "[nti.atan] : runs Vector Arctangent" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.atan(data=data, )

# Awesome Oscillator
test "[nti.ao] : runs Awesome Oscillator" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.ao(high=high, nlow=nlow, )

# Vector Arcsine
test "[nti.asin] : runs Vector Arcsine" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.asin(data=data, )

# Chaikins Volatility
test "[nti.cvi] : runs Chaikins Volatility" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.cvi(high=high, nlow=nlow, period=period, )

# Ultimate Oscillator
test "[nti.ultosc] : runs Ultimate Oscillator" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var short_period: float = 3.0 
  var  medium_period: float = 3.0 
  var  long_period: float = 3.0 
  discard nti.ultosc(high=high, nlow=nlow, close=close, short_period=short_period,  medium_period= medium_period,  long_period= long_period, )

# Minimum In Period
test "[nti.min] : runs Minimum In Period" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.min(data=data, period=period, )

# Vector Natural Log
test "[nti.ln] : runs Vector Natural Log" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.ln(data=data, )

# Aroon Oscillator
test "[nti.aroonosc] : runs Aroon Oscillator" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.aroonosc(high=high, nlow=nlow, period=period, )

# Trix
test "[nti.trix] : runs Trix" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.trix(data=data, period=period, )

# Average Price
test "[nti.avgprice] : runs Average Price" :
  var open = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.avgprice(open=open, high=high, nlow=nlow, close=close, )

# Williams Accumulation/Distribution
test "[nti.wad] : runs Williams Accumulation/Distribution" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.wad(high=high, nlow=nlow, close=close, )

# Chande Momentum Oscillator
test "[nti.cmo] : runs Chande Momentum Oscillator" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.cmo(data=data, period=period, )

# Commodity Channel Index
test "[nti.cci] : runs Commodity Channel Index" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.cci(high=high, nlow=nlow, close=close, period=period, )

# On Balance Volume
test "[nti.obv] : runs On Balance Volume" :
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var volume = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.obv(close=close, volume=volume, )

# Weighted Moving Average
test "[nti.wma] : runs Weighted Moving Average" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.wma(data=data, period=period, )

# Williams %R
test "[nti.willr] : runs Williams %R" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.willr(high=high, nlow=nlow, close=close, period=period, )

# Vector Absolute Value
test "[nti.abs] : runs Vector Absolute Value" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.abs(data=data, )

# Moving Average Convergence/Divergence
test "[nti.macd] : runs Moving Average Convergence/Divergence" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var short_period: float = 3.0 
  var  long_period: float = 3.0 
  var  signal_period: float = 3.0 
  discard nti.macd(data=data, short_period=short_period,  long_period= long_period,  signal_period= signal_period, )

# Triple Exponential Moving Average
test "[nti.tema] : runs Triple Exponential Moving Average" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.tema(data=data, period=period, )

# Vector Base-10 Log
test "[nti.log10] : runs Vector Base-10 Log" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.log10(data=data, )

# Linear Regression Slope
test "[nti.linregslope] : runs Linear Regression Slope" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.linregslope(data=data, period=period, )

# Exponential Moving Average
test "[nti.ema] : runs Exponential Moving Average" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.ema(data=data, period=period, )

# Standard Error Over Period
test "[nti.stderr] : runs Standard Error Over Period" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.stderr(data=data, period=period, )

# Vector Truncate
test "[nti.trunc] : runs Vector Truncate" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.trunc(data=data, )

# Vector Square Root
test "[nti.sqrt] : runs Vector Square Root" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.sqrt(data=data, )

# Positive Volume Index
test "[nti.pvi] : runs Positive Volume Index" :
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var volume = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.pvi(close=close, volume=volume, )

# Detrended Price Oscillator
test "[nti.dpo] : runs Detrended Price Oscillator" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.dpo(data=data, period=period, )

# Linear Regression Intercept
test "[nti.linregintercept] : runs Linear Regression Intercept" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.linregintercept(data=data, period=period, )

# Stochastic RSI
test "[nti.stochrsi] : runs Stochastic RSI" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.stochrsi(data=data, period=period, )

# Vector Division
test "[nti.ndiv] : runs Vector Division" :
  var data1 = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var data2 = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.ndiv(data1=data1, data2=data2, )

# Mean Deviation Over Period
test "[nti.md] : runs Mean Deviation Over Period" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.md(data=data, period=period, )

# Normalized Average True Range
test "[nti.natr] : runs Normalized Average True Range" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.natr(high=high, nlow=nlow, close=close, period=period, )

# Kaufman Adaptive Moving Average
test "[nti.kama] : runs Kaufman Adaptive Moving Average" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.kama(data=data, period=period, )

# Vector Multiplication
test "[nti.mul] : runs Vector Multiplication" :
  var data1 = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var data2 = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.mul(data1=data1, data2=data2, )

# Vector Addition
test "[nti.add] : runs Vector Addition" :
  var data1 = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var data2 = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.add(data1=data1, data2=data2, )

# Simple Moving Average
test "[nti.sma] : runs Simple Moving Average" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.sma(data=data, period=period, )

# Variance Over Period
test "[nti.nvar] : runs Variance Over Period" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.nvar(data=data, period=period, )

# Crossany
test "[nti.crossany] : runs Crossany" :
  var data1 = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var data2 = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.crossany(data1=data1, data2=data2, )

# Relative Strength Index
test "[nti.rsi] : runs Relative Strength Index" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.rsi(data=data, period=period, )

# Directional Indicator
test "[nti.di] : runs Directional Indicator" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.di(high=high, nlow=nlow, close=close, period=period, )

# Vector Hyperbolic Cosine
test "[nti.cosh] : runs Vector Hyperbolic Cosine" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.cosh(data=data, )

# Directional Movement Index
test "[nti.dx] : runs Directional Movement Index" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.dx(high=high, nlow=nlow, period=period, )

# Median Price
test "[nti.medprice] : runs Median Price" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.medprice(high=high, nlow=nlow, )

# Linear Decay
test "[nti.decay] : runs Linear Decay" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.decay(data=data, period=period, )

# Vector Subtraction
test "[nti.sub] : runs Vector Subtraction" :
  var data1 = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var data2 = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.sub(data1=data1, data2=data2, )

# Mass Index
# test "[nti.mass] : runs Mass Index" :
#   var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
#   var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
#   var period: float = 3.0 
#   discard nti.mass(high=high, nlow=nlow, period=period, )

# Vector Hyperbolic Tangent
test "[nti.tanh] : runs Vector Hyperbolic Tangent" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.tanh(data=data, )

# Volume Oscillator
test "[nti.vosc] : runs Volume Oscillator" :
  var volume = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var short_period: float = 3.0 
  var  long_period: float = 3.0 
  discard nti.vosc(volume=volume, short_period=short_period,  long_period= long_period, )

# Average Directional Movement Index
test "[nti.adx] : runs Average Directional Movement Index" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.adx(high=high, nlow=nlow, period=period, )

# Vector Degree Conversion
test "[nti.todeg] : runs Vector Degree Conversion" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.todeg(data=data, )

# Rate of Change
test "[nti.roc] : runs Rate of Change" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.roc(data=data, period=period, )

# Accumulation/Distribution Line
test "[nti.ad] : runs Accumulation/Distribution Line" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var volume = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.ad(high=high, nlow=nlow, close=close, volume=volume, )

# Sum Over Period
test "[nti.sum] : runs Sum Over Period" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.sum(data=data, period=period, )

# Qstick
test "[nti.qstick] : runs Qstick" :
  var open = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.qstick(open=open, close=close, period=period, )

# Vector Floor
test "[nti.floor] : runs Vector Floor" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.floor(data=data, )

# Triangular Moving Average
test "[nti.trima] : runs Triangular Moving Average" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.trima(data=data, period=period, )

# Absolute Price Oscillator
test "[nti.apo] : runs Absolute Price Oscillator" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var short_period: float = 3.0 
  var  long_period: float = 3.0 
  discard nti.apo(data=data, short_period=short_period,  long_period= long_period, )

# Wilders Smoothing
test "[nti.wilders] : runs Wilders Smoothing" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.wilders(data=data, period=period, )

# Vector Round
test "[nti.round] : runs Vector Round" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.round(data=data, )

# Vector Tangent
test "[nti.tan] : runs Vector Tangent" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.tan(data=data, )

# Average True Range
test "[nti.atr] : runs Average True Range" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.atr(high=high, nlow=nlow, close=close, period=period, )

# Annualized Historical Volatility
test "[nti.volatility] : runs Annualized Historical Volatility" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.volatility(data=data, period=period, )

# Vector Sine
test "[nti.sin] : runs Vector Sine" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.sin(data=data, )

# Volume Weighted Moving Average
test "[nti.vwma] : runs Volume Weighted Moving Average" :
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var volume = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.vwma(close=close, volume=volume, period=period, )

# Directional Movement
test "[nti.dm] : runs Directional Movement" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.dm(high=high, nlow=nlow, period=period, )

# True Range
test "[nti.tr] : runs True Range" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.tr(high=high, nlow=nlow, close=close, )

# Money Flow Index
test "[nti.mfi] : runs Money Flow Index" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var volume = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.mfi(high=high, nlow=nlow, close=close, volume=volume, period=period, )

# Parabolic SAR
test "[nti.psar] : runs Parabolic SAR" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var acceleration_factor_step: float = 3.0 
  var  acceleration_factor_maximum: float = 3.0 
  discard nti.psar(high=high, nlow=nlow, acceleration_factor_step=acceleration_factor_step,  acceleration_factor_maximum= acceleration_factor_maximum, )

# Weighted Close Price
test "[nti.wcprice] : runs Weighted Close Price" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.wcprice(high=high, nlow=nlow, close=close, )

# Balance of Power
test "[nti.bop] : runs Balance of Power" :
  var open = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.bop(open=open, high=high, nlow=nlow, close=close, )

# Average Directional Movement Rating
test "[nti.adxr] : runs Average Directional Movement Rating" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.adxr(high=high, nlow=nlow, period=period, )

# Maximum In Period
test "[nti.max] : runs Maximum In Period" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.max(data=data, period=period, )

# Forecast Oscillator
test "[nti.fosc] : runs Forecast Oscillator" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.fosc(data=data, period=period, )

# Time Series Forecast
test "[nti.tsf] : runs Time Series Forecast" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.tsf(data=data, period=period, )

# Stochastic Oscillator
test "[nti.stoch] : runs Stochastic Oscillator" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var k_period: float = 3.0 
  var  k_slowing_period: float = 3.0 
  var  d_period: float = 3.0 
  discard nti.stoch(high=high, nlow=nlow, close=close, k_period=k_period,  k_slowing_period= k_slowing_period,  d_period= d_period, )

# Fisher Transform
test "[nti.fisher] : runs Fisher Transform" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.fisher(high=high, nlow=nlow, period=period, )

# Vector Hyperbolic Sine
test "[nti.sinh] : runs Vector Hyperbolic Sine" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.sinh(data=data, )

# Rate of Change Ratio
test "[nti.rocr] : runs Rate of Change Ratio" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.rocr(data=data, period=period, )

# Lag
test "[nti.lag] : runs Lag" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.lag(data=data, period=period, )

# Mesa Sine Wave
test "[nti.msw] : runs Mesa Sine Wave" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.msw(data=data, period=period, )

# Vector Radian Conversion
test "[nti.torad] : runs Vector Radian Conversion" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.torad(data=data, )

# Vector Ceiling
test "[nti.ceil] : runs Vector Ceiling" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.ceil(data=data, )

# Momentum
test "[nti.mom] : runs Momentum" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.mom(data=data, period=period, )

# Negative Volume Index
test "[nti.nvi] : runs Negative Volume Index" :
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var volume = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.nvi(close=close, volume=volume, )

# Ease of Movement
test "[nti.emv] : runs Ease of Movement" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var volume = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.emv(high=high, nlow=nlow, volume=volume, )

# Bollinger Bands
test "[nti.bbands] : runs Bollinger Bands" :
  var input: seq[float] = @[81.59,81.06,82.87,83.00,83.61,83.15,82.84,83.99,84.55,84.36,85.53,86.54,86.89,87.77,87.29]
  var period : float = 5.0
  var stdev : float = 2.0 
  discard nti.bbands(data=input, period=period,  stddev= stdev, )

# Variable Index Dynamic Average
test "[nti.vidya] : runs Variable Index Dynamic Average" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var short_period: float = 3.0 
  var  long_period: float = 3.0 
  var  alpha: float = 3.0 
  discard nti.vidya(data=data, short_period=short_period,  long_period= long_period,  alpha= alpha, )

# Aroon
test "[nti.aroon] : runs Aroon" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.aroon(high=high, nlow=nlow, period=period, )

# Vertical Horizontal Filter
test "[nti.vhf] : runs Vertical Horizontal Filter" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.vhf(data=data, period=period, )

# Exponential Decay
test "[nti.edecay] : runs Exponential Decay" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.edecay(data=data, period=period, )

# Klinger Volume Oscillator
test "[nti.kvo] : runs Klinger Volume Oscillator" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var volume = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var short_period: float = 3.0 
  var  long_period: float = 3.0 
  discard nti.kvo(high=high, nlow=nlow, close=close, volume=volume, short_period=short_period,  long_period= long_period, )

# Vector Arccosine
test "[nti.acos] : runs Vector Arccosine" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.acos(data=data, )

# Percentage Price Oscillator
test "[nti.ppo] : runs Percentage Price Oscillator" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var short_period: float = 3.0 
  var  long_period: float = 3.0 
  discard nti.ppo(data=data, short_period=short_period,  long_period= long_period, )

# Typical Price
test "[nti.typprice] : runs Typical Price" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.typprice(high=high, nlow=nlow, close=close, )

# Vector Cosine
test "[nti.cos] : runs Vector Cosine" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.cos(data=data, )

# Vector Exponential
test "[nti.exp] : runs Vector Exponential" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.exp(data=data, )

# Double Exponential Moving Average
test "[nti.dema] : runs Double Exponential Moving Average" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.dema(data=data, period=period, )

# Linear Regression
test "[nti.linreg] : runs Linear Regression" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.linreg(data=data, period=period, )

# Crossover
test "[nti.crossover] : runs Crossover" :
  var data1 = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var data2 = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.crossover(data1=data1, data2=data2, )

# Zero-Lag Exponential Moving Average
test "[nti.zlema] : runs Zero-Lag Exponential Moving Average" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.zlema(data=data, period=period, )

# Standard Deviation Over Period
test "[nti.stddev] : runs Standard Deviation Over Period" :
  var data = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var period: float = 3.0 
  discard nti.stddev(data=data, period=period, )

# Market Facilitation Index
test "[nti.marketfi] : runs Market Facilitation Index" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var volume = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  discard nti.marketfi(high=high, nlow=nlow, volume=volume, )

# Accumulation/Distribution Oscillator
test "[nti.adosc] : runs Accumulation/Distribution Oscillator" :
  var high = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var nlow = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var close = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var volume = @[12.0, 4.8, 78.0, 23.0, 45.7, 90.4, 100.0, 92.2, 39.8, 10.0, 20.4]
  var short_period: float = 3.0 
  var  long_period: float = 3.0 
  discard nti.adosc(high=high, nlow=nlow, close=close, volume=volume, short_period=short_period,  long_period= long_period, )
