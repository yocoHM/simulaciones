import UIKit

let miu:Float = 1.0
let lambda:Float = 1.0/6.0
let N:Float = 5.0
let Cs:Float = 5.0
let Cw:Float = 10.0


func factorial(num: Float) -> (Float) {
  if (num <= 1) {
    return 1
  }
  
  return num * factorial(num: num - 1)
}

var suma:Float = 0.0
for i in 0...Int(N) {
  suma += (factorial(num: N) / factorial(num: N-Float(i))) * powf(lambda/miu, Float(i))
}

//Problema 13.29
//Lq = 0.537
//L = 1.17
//N-L = 3.83
//Wq = 0.8422
//W = 1.84

let P0:Float = 1.0 / suma
let Lq:Float = N - ((lambda + miu) / lambda) * (1.0 - P0)
let L:Float = Lq + (1.0 - P0)
let Wq:Float = Lq / ((N - L)*lambda)
let W:Float = Wq + (1.0/miu)
N-L
