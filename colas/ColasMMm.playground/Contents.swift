import UIKit

//************ variables para modificar ************
let lambda:Float = 3.0
let mew:Float = 4.0
let m:Float = 2.0
let Cs:Float = 6.0
let Cw:Float = 10.0
//************ variables para modificar ************

//************ Funciones auxiliares ************
func factorial(num: Float) -> (Float) {
  if (num <= 1) {
    return 1
  }
  
  return num * factorial(num: num - 1)
}

func obtenerP0(m:Float, lambda:Float, mew:Float) -> Float {
  var res:Float = 0.0
  var sumatoria:Float = 0.0
  var segundaDenominador:Float = 0.0
  
  for i in 0...(Int(m)-1) {
    sumatoria += (1.0/factorial(num: Float(i))) * powf(lambda/mew, Float(i))
  }
  
  segundaDenominador = (1.0/factorial(num: m)) * powf(lambda/mew, m) * ((m*mew)/((m*mew)-lambda))
  
  res = 1.0/(sumatoria + segundaDenominador)
  
  return res
}

func obtenerL(m:Float, lambda:Float, mew:Float, P0:Float) -> Float {
  var res:Float = 0.0
  var numerador:Float = 0.0
  var denominador:Float = 0.0
  
  numerador = lambda * mew * powf(lambda/mew, m)
  denominador = factorial(num: Float(m-1.0)) * powf((m*mew - lambda), 2.0)
  
  res = (numerador / denominador)*P0 + (lambda/mew)
  
  return res
}
//************ Funciones auxiliares ************

//************ Calculos ************
var P0:Float = obtenerP0(m: m, lambda: lambda, mew: mew)
var L:Float = obtenerL(m: m, lambda: lambda, mew: mew, P0: P0)
var W:Float = L/lambda
var Lq:Float = L - (lambda/mew)
var Wq:Float = Lq/lambda
var Ro:Float = lambda/(m*mew)
var Ct:Float = m*Cs + lambda*W*Cw
//************ Calculos ************

//************ Impresion de resultados ************
print("P0 = \(P0)")
print("Ro = \(Ro)")
print("L = \(L)")
print("Lq = \(Lq)")
print("W = \(W)")
print("Wq = \(Wq)")
print("Ct = \(Ct)")
//************ Impresion de resultados ************