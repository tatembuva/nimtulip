## Tulip Indicators Library bindings for nim-lang.

# Imports
import print
import parsecfg
import std/strformat
import std/terminal
import nimtulip/tulip as ti

# Globals(local)
var prj: Config = loadConfig("./nimtulip.nimble")

# Get Lib Version
proc version*(pprint: bool = false): string =
  ## Returns current library version as a string.
  ## (pprint) arg pretty prints the lib header.
  var nti = prj.getSectionValue("", "version") 
  nti = "v" & nti
  var tulip_indicators = "v0.9.2"
  if(pprint):
    var header = &"""

             $$\     $$\ 
             $$ |    \__|
  $$$$$$$\ $$$$$$\   $$\ 
  $$  __$$\\_$$  _|  $$ |
  $$ |  $$ | $$ |    $$ |
  $$ |  $$ | $$ |$$\ $$ |
  $$ |  $$ | \$$$$  |$$ |
  \__|  \__|  \____/ \__|
"""
    var subheader = &"""
 󰆥 Nim Language bindings for the 󰧱 Tulip Indicators library.
 author: @tatembuva <oblabs/2023>
 version: [nti] - {nti}, [tulip indicators] - {tulip_indicators}

"""
    styledEcho fgGreen, header
    styledEcho fgDefault, subheader
  return "0.0.1" 

#Indicator Functions
# Hull Moving Average
proc hma*(data: seq[float], period: float, ): tuple[hma: seq[float]] =
  result = ti.hma(data=data, period=period, )
# Vector Arctangent
proc atan*(data: seq[float], ): tuple[atan: seq[float]] =
  result = ti.atan(data=data, )
# Awesome Oscillator
proc ao*(high: seq[float], nlow: seq[float], ): tuple[ao: seq[float]] =
  result = ti.ao(high=high, nlow=nlow, )
# Vector Arcsine
proc asin*(data: seq[float], ): tuple[asin: seq[float]] =
  result = ti.asin(data=data, )
# Chaikins Volatility
proc cvi*(high: seq[float], nlow: seq[float], period: float, ): tuple[cvi: seq[float]] =
  result = ti.cvi(high=high, nlow=nlow, period=period, )
# Ultimate Oscillator
proc ultosc*(high: seq[float], nlow: seq[float], close: seq[float], short_period: float,  medium_period: float,  long_period: float, ): tuple[ultosc: seq[float]] =
  result = ti.ultosc(high=high, nlow=nlow, close=close, short_period=short_period,  medium_period= medium_period,  long_period= long_period, )
# Minimum In Period
proc min*(data: seq[float], period: float, ): tuple[min: seq[float]] =
  result = ti.min(data=data, period=period, )
# Vector Natural Log
proc ln*(data: seq[float], ): tuple[ln: seq[float]] =
  result = ti.ln(data=data, )
# Aroon Oscillator
proc aroonosc*(high: seq[float], nlow: seq[float], period: float, ): tuple[aroonosc: seq[float]] =
  result = ti.aroonosc(high=high, nlow=nlow, period=period, )
# Trix
proc trix*(data: seq[float], period: float, ): tuple[trix: seq[float]] =
  result = ti.trix(data=data, period=period, )
# Average Price
proc avgprice*(open: seq[float], high: seq[float], nlow: seq[float], close: seq[float], ): tuple[avgprice: seq[float]] =
  result = ti.avgprice(open=open, high=high, nlow=nlow, close=close, )
# Williams Accumulation/Distribution
proc wad*(high: seq[float], nlow: seq[float], close: seq[float], ): tuple[wad: seq[float]] =
  result = ti.wad(high=high, nlow=nlow, close=close, )
# Chande Momentum Oscillator
proc cmo*(data: seq[float], period: float, ): tuple[cmo: seq[float]] =
  result = ti.cmo(data=data, period=period, )
# Commodity Channel Index
proc cci*(high: seq[float], nlow: seq[float], close: seq[float], period: float, ): tuple[cci: seq[float]] =
  result = ti.cci(high=high, nlow=nlow, close=close, period=period, )
# On Balance Volume
proc obv*(close: seq[float], volume: seq[float], ): tuple[obv: seq[float]] =
  result = ti.obv(close=close, volume=volume, )
# Weighted Moving Average
proc wma*(data: seq[float], period: float, ): tuple[wma: seq[float]] =
  result = ti.wma(data=data, period=period, )
# Williams %R
proc willr*(high: seq[float], nlow: seq[float], close: seq[float], period: float, ): tuple[willr: seq[float]] =
  result = ti.willr(high=high, nlow=nlow, close=close, period=period, )
# Vector Absolute Value
proc abs*(data: seq[float], ): tuple[abs: seq[float]] =
  result = ti.abs(data=data, )
# Moving Average Convergence/Divergence
proc macd*(data: seq[float], short_period: float,  long_period: float,  signal_period: float, ): tuple[macd: seq[float],macd_signal: seq[float],macd_histogram: seq[float],] =
  result = ti.macd(data=data, short_period=short_period,  long_period= long_period,  signal_period= signal_period, )
# Triple Exponential Moving Average
proc tema*(data: seq[float], period: float, ): tuple[tema: seq[float]] =
  result = ti.tema(data=data, period=period, )
# Vector Base-10 Log
proc log10*(data: seq[float], ): tuple[log10: seq[float]] =
  result = ti.log10(data=data, )
# Linear Regression Slope
proc linregslope*(data: seq[float], period: float, ): tuple[linregslope: seq[float]] =
  result = ti.linregslope(data=data, period=period, )
# Exponential Moving Average
proc ema*(data: seq[float], period: float, ): tuple[ema: seq[float]] =
  result = ti.ema(data=data, period=period, )
# Standard Error Over Period
proc stderr*(data: seq[float], period: float, ): tuple[stderr: seq[float]] =
  result = ti.stderr(data=data, period=period, )
# Vector Truncate
proc trunc*(data: seq[float], ): tuple[trunc: seq[float]] =
  result = ti.trunc(data=data, )
# Vector Square Root
proc sqrt*(data: seq[float], ): tuple[sqrt: seq[float]] =
  result = ti.sqrt(data=data, )
# Positive Volume Index
proc pvi*(close: seq[float], volume: seq[float], ): tuple[pvi: seq[float]] =
  result = ti.pvi(close=close, volume=volume, )
# Detrended Price Oscillator
proc dpo*(data: seq[float], period: float, ): tuple[dpo: seq[float]] =
  result = ti.dpo(data=data, period=period, )
# Linear Regression Intercept
proc linregintercept*(data: seq[float], period: float, ): tuple[linregintercept: seq[float]] =
  result = ti.linregintercept(data=data, period=period, )
# Stochastic RSI
proc stochrsi*(data: seq[float], period: float, ): tuple[stochrsi: seq[float]] =
  result = ti.stochrsi(data=data, period=period, )
# Vector Division
proc ndiv*(data1: seq[float], data2: seq[float], ): tuple[ndiv: seq[float]] =
  result = ti.ndiv(data1=data1, data2=data2, )
# Mean Deviation Over Period
proc md*(data: seq[float], period: float, ): tuple[md: seq[float]] =
  result = ti.md(data=data, period=period, )
# Normalized Average True Range
proc natr*(high: seq[float], nlow: seq[float], close: seq[float], period: float, ): tuple[natr: seq[float]] =
  result = ti.natr(high=high, nlow=nlow, close=close, period=period, )
# Kaufman Adaptive Moving Average
proc kama*(data: seq[float], period: float, ): tuple[kama: seq[float]] =
  result = ti.kama(data=data, period=period, )
# Vector Multiplication
proc mul*(data1: seq[float], data2: seq[float], ): tuple[mul: seq[float]] =
  result = ti.mul(data1=data1, data2=data2, )
# Vector Addition
proc add*(data1: seq[float], data2: seq[float], ): tuple[add: seq[float]] =
  result = ti.add(data1=data1, data2=data2, )
# Simple Moving Average
proc sma*(data: seq[float], period: float, ): tuple[sma: seq[float]] =
  result = ti.sma(data=data, period=period, )
# Variance Over Period
proc nvar*(data: seq[float], period: float, ): tuple[nvar: seq[float]] =
  result = ti.nvar(data=data, period=period, )
# Crossany
proc crossany*(data1: seq[float], data2: seq[float], ): tuple[crossany: seq[float]] =
  result = ti.crossany(data1=data1, data2=data2, )
# Relative Strength Index
proc rsi*(data: seq[float], period: float, ): tuple[rsi: seq[float]] =
  result = ti.rsi(data=data, period=period, )
# Directional Indicator
proc di*(high: seq[float], nlow: seq[float], close: seq[float], period: float, ): tuple[plus_di: seq[float],minus_di: seq[float],] =
  result = ti.di(high=high, nlow=nlow, close=close, period=period, )
# Vector Hyperbolic Cosine
proc cosh*(data: seq[float], ): tuple[cosh: seq[float]] =
  result = ti.cosh(data=data, )
# Directional Movement Index
proc dx*(high: seq[float], nlow: seq[float], period: float, ): tuple[dx: seq[float]] =
  result = ti.dx(high=high, nlow=nlow, period=period, )
# Median Price
proc medprice*(high: seq[float], nlow: seq[float], ): tuple[medprice: seq[float]] =
  result = ti.medprice(high=high, nlow=nlow, )
# Linear Decay
proc decay*(data: seq[float], period: float, ): tuple[decay: seq[float]] =
  result = ti.decay(data=data, period=period, )
# Vector Subtraction
proc sub*(data1: seq[float], data2: seq[float], ): tuple[sub: seq[float]] =
  result = ti.sub(data1=data1, data2=data2, )
# Mass Index
proc mass*(high: seq[float], nlow: seq[float], period: float, ): tuple[mass: seq[float]] =
  result = ti.mass(high=high, nlow=nlow, period=period, )
# Vector Hyperbolic Tangent
proc tanh*(data: seq[float], ): tuple[tanh: seq[float]] =
  result = ti.tanh(data=data, )
# Volume Oscillator
proc vosc*(volume: seq[float], short_period: float,  long_period: float, ): tuple[vosc: seq[float]] =
  result = ti.vosc(volume=volume, short_period=short_period,  long_period= long_period, )
# Average Directional Movement Index
proc adx*(high: seq[float], nlow: seq[float], period: float, ): tuple[adx: seq[float]] =
  result = ti.adx(high=high, nlow=nlow, period=period, )
# Vector Degree Conversion
proc todeg*(data: seq[float], ): tuple[degrees: seq[float]] =
  result = ti.todeg(data=data, )
# Rate of Change
proc roc*(data: seq[float], period: float, ): tuple[roc: seq[float]] =
  result = ti.roc(data=data, period=period, )
# Accumulation/Distribution Line
proc ad*(high: seq[float], nlow: seq[float], close: seq[float], volume: seq[float], ): tuple[ad: seq[float]] =
  result = ti.ad(high=high, nlow=nlow, close=close, volume=volume, )
# Sum Over Period
proc sum*(data: seq[float], period: float, ): tuple[sum: seq[float]] =
  result = ti.sum(data=data, period=period, )
# Qstick
proc qstick*(open: seq[float], close: seq[float], period: float, ): tuple[qstick: seq[float]] =
  result = ti.qstick(open=open, close=close, period=period, )
# Vector Floor
proc floor*(data: seq[float], ): tuple[floor: seq[float]] =
  result = ti.floor(data=data, )
# Triangular Moving Average
proc trima*(data: seq[float], period: float, ): tuple[trima: seq[float]] =
  result = ti.trima(data=data, period=period, )
# Absolute Price Oscillator
proc apo*(data: seq[float], short_period: float,  long_period: float, ): tuple[apo: seq[float]] =
  result = ti.apo(data=data, short_period=short_period,  long_period= long_period, )
# Wilders Smoothing
proc wilders*(data: seq[float], period: float, ): tuple[wilders: seq[float]] =
  result = ti.wilders(data=data, period=period, )
# Vector Round
proc round*(data: seq[float], ): tuple[round: seq[float]] =
  result = ti.round(data=data, )
# Vector Tangent
proc tan*(data: seq[float], ): tuple[tan: seq[float]] =
  result = ti.tan(data=data, )
# Average True Range
proc atr*(high: seq[float], nlow: seq[float], close: seq[float], period: float, ): tuple[atr: seq[float]] =
  result = ti.atr(high=high, nlow=nlow, close=close, period=period, )
# Annualized Historical Volatility
proc volatility*(data: seq[float], period: float, ): tuple[volatility: seq[float]] =
  result = ti.volatility(data=data, period=period, )
# Vector Sine
proc sin*(data: seq[float], ): tuple[sin: seq[float]] =
  result = ti.sin(data=data, )
# Volume Weighted Moving Average
proc vwma*(close: seq[float], volume: seq[float], period: float, ): tuple[vwma: seq[float]] =
  result = ti.vwma(close=close, volume=volume, period=period, )
# Directional Movement
proc dm*(high: seq[float], nlow: seq[float], period: float, ): tuple[plus_dm: seq[float],minus_dm: seq[float],] =
  result = ti.dm(high=high, nlow=nlow, period=period, )
# True Range
proc tr*(high: seq[float], nlow: seq[float], close: seq[float], ): tuple[tr: seq[float]] =
  result = ti.tr(high=high, nlow=nlow, close=close, )
# Money Flow Index
proc mfi*(high: seq[float], nlow: seq[float], close: seq[float], volume: seq[float], period: float, ): tuple[mfi: seq[float]] =
  result = ti.mfi(high=high, nlow=nlow, close=close, volume=volume, period=period, )
# Parabolic SAR
proc psar*(high: seq[float], nlow: seq[float], acceleration_factor_step: float,  acceleration_factor_maximum: float, ): tuple[psar: seq[float]] =
  result = ti.psar(high=high, nlow=nlow, acceleration_factor_step=acceleration_factor_step,  acceleration_factor_maximum= acceleration_factor_maximum, )
# Weighted Close Price
proc wcprice*(high: seq[float], nlow: seq[float], close: seq[float], ): tuple[wcprice: seq[float]] =
  result = ti.wcprice(high=high, nlow=nlow, close=close, )
# Balance of Power
proc bop*(open: seq[float], high: seq[float], nlow: seq[float], close: seq[float], ): tuple[bop: seq[float]] =
  result = ti.bop(open=open, high=high, nlow=nlow, close=close, )
# Average Directional Movement Rating
proc adxr*(high: seq[float], nlow: seq[float], period: float, ): tuple[adxr: seq[float]] =
  result = ti.adxr(high=high, nlow=nlow, period=period, )
# Maximum In Period
proc max*(data: seq[float], period: float, ): tuple[max: seq[float]] =
  result = ti.max(data=data, period=period, )
# Forecast Oscillator
proc fosc*(data: seq[float], period: float, ): tuple[fosc: seq[float]] =
  result = ti.fosc(data=data, period=period, )
# Time Series Forecast
proc tsf*(data: seq[float], period: float, ): tuple[tsf: seq[float]] =
  result = ti.tsf(data=data, period=period, )
# Stochastic Oscillator
proc stoch*(high: seq[float], nlow: seq[float], close: seq[float], k_period: float,  k_slowing_period: float,  d_period: float, ): tuple[stoch_k: seq[float],stoch_d: seq[float],] =
  result = ti.stoch(high=high, nlow=nlow, close=close, k_period=k_period,  k_slowing_period= k_slowing_period,  d_period= d_period, )
# Fisher Transform
proc fisher*(high: seq[float], nlow: seq[float], period: float, ): tuple[fisher: seq[float],fisher_signal: seq[float],] =
  result = ti.fisher(high=high, nlow=nlow, period=period, )
# Vector Hyperbolic Sine
proc sinh*(data: seq[float], ): tuple[sinh: seq[float]] =
  result = ti.sinh(data=data, )
# Rate of Change Ratio
proc rocr*(data: seq[float], period: float, ): tuple[rocr: seq[float]] =
  result = ti.rocr(data=data, period=period, )
# Lag
proc lag*(data: seq[float], period: float, ): tuple[lag: seq[float]] =
  result = ti.lag(data=data, period=period, )
# Mesa Sine Wave
proc msw*(data: seq[float], period: float, ): tuple[msw_sine: seq[float],msw_lead: seq[float],] =
  result = ti.msw(data=data, period=period, )
# Vector Radian Conversion
proc torad*(data: seq[float], ): tuple[radians: seq[float]] =
  result = ti.torad(data=data, )
# Vector Ceiling
proc ceil*(data: seq[float], ): tuple[ceil: seq[float]] =
  result = ti.ceil(data=data, )
# Momentum
proc mom*(data: seq[float], period: float, ): tuple[mom: seq[float]] =
  result = ti.mom(data=data, period=period, )
# Negative Volume Index
proc nvi*(close: seq[float], volume: seq[float], ): tuple[nvi: seq[float]] =
  result = ti.nvi(close=close, volume=volume, )
# Ease of Movement
proc emv*(high: seq[float], nlow: seq[float], volume: seq[float], ): tuple[emv: seq[float]] =
  result = ti.emv(high=high, nlow=nlow, volume=volume, )
# Bollinger Bands
proc bbands*(data: seq[float], period: float,  stddev: float, ): tuple[bbands_lower: seq[float],bbands_middle: seq[float],bbands_upper: seq[float],] =
  result = ti.bbands(data=data, period=period,  stddev= stddev, )
# Variable Index Dynamic Average
proc vidya*(data: seq[float], short_period: float,  long_period: float,  alpha: float, ): tuple[vidya: seq[float]] =
  result = ti.vidya(data=data, short_period=short_period,  long_period= long_period,  alpha= alpha, )
# Aroon
proc aroon*(high: seq[float], nlow: seq[float], period: float, ): tuple[aroon_down: seq[float],aroon_up: seq[float],] =
  result = ti.aroon(high=high, nlow=nlow, period=period, )
# Vertical Horizontal Filter
proc vhf*(data: seq[float], period: float, ): tuple[vhf: seq[float]] =
  result = ti.vhf(data=data, period=period, )
# Exponential Decay
proc edecay*(data: seq[float], period: float, ): tuple[edecay: seq[float]] =
  result = ti.edecay(data=data, period=period, )
# Klinger Volume Oscillator
proc kvo*(high: seq[float], nlow: seq[float], close: seq[float], volume: seq[float], short_period: float,  long_period: float, ): tuple[kvo: seq[float]] =
  result = ti.kvo(high=high, nlow=nlow, close=close, volume=volume, short_period=short_period,  long_period= long_period, )
# Vector Arccosine
proc acos*(data: seq[float], ): tuple[acos: seq[float]] =
  result = ti.acos(data=data, )
# Percentage Price Oscillator
proc ppo*(data: seq[float], short_period: float,  long_period: float, ): tuple[ppo: seq[float]] =
  result = ti.ppo(data=data, short_period=short_period,  long_period= long_period, )
# Typical Price
proc typprice*(high: seq[float], nlow: seq[float], close: seq[float], ): tuple[typprice: seq[float]] =
  result = ti.typprice(high=high, nlow=nlow, close=close, )
# Vector Cosine
proc cos*(data: seq[float], ): tuple[cos: seq[float]] =
  result = ti.cos(data=data, )
# Vector Exponential
proc exp*(data: seq[float], ): tuple[exp: seq[float]] =
  result = ti.exp(data=data, )
# Double Exponential Moving Average
proc dema*(data: seq[float], period: float, ): tuple[dema: seq[float]] =
  result = ti.dema(data=data, period=period, )
# Linear Regression
proc linreg*(data: seq[float], period: float, ): tuple[linreg: seq[float]] =
  result = ti.linreg(data=data, period=period, )
# Crossover
proc crossover*(data1: seq[float], data2: seq[float], ): tuple[crossover: seq[float]] =
  result = ti.crossover(data1=data1, data2=data2, )
# Zero-Lag Exponential Moving Average
proc zlema*(data: seq[float], period: float, ): tuple[zlema: seq[float]] =
  result = ti.zlema(data=data, period=period, )
# Standard Deviation Over Period
proc stddev*(data: seq[float], period: float, ): tuple[stddev: seq[float]] =
  result = ti.stddev(data=data, period=period, )
# Market Facilitation Index
proc marketfi*(high: seq[float], nlow: seq[float], volume: seq[float], ): tuple[marketfi: seq[float]] =
  result = ti.marketfi(high=high, nlow=nlow, volume=volume, )
# Accumulation/Distribution Oscillator
proc adosc*(high: seq[float], nlow: seq[float], close: seq[float], volume: seq[float], short_period: float,  long_period: float, ): tuple[adosc: seq[float]] =
  result = ti.adosc(high=high, nlow=nlow, close=close, volume=volume, short_period=short_period,  long_period= long_period, )
