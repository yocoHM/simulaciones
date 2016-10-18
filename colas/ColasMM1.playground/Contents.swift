import UIKit

let lambda:Float = 4.0
let mew:Float = 5.0
let k:Float = 4.0

var L:Float = lambda / (mew - lambda)
var W:Float = 1 / (mew - lambda)
var Lq:Float = powf(lambda, 2.0) / (mew * (mew - lambda))
var Wq:Float = lambda / (mew * (mew - lambda))
var Ro:Float = lambda / mew
var P0:Float = 1 - (lambda / mew)
var Pnk:Float = powf((lambda / mew), k+1.0)

print("L = \(L)")
print("W = \(W)")
print("Lq = \(Lq)")
print("Wq = \(Wq)")
print("Ro = \(Ro)")
print("P0 = \(P0)")
print("P(n>k) = \(Pnk) donde k = \(k)")