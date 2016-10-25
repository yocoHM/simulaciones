import UIKit

let miu:Float = 4320.0
let lambda:Float = 3456.0
let m:Float = 1.0
let Cs:Float = 5.0
let Cw:Float = 10.0

let Lq:Float = powf(lambda, 2.0) / (2.0*miu*(miu - lambda))
let Wq:Float = lambda / (2.0*miu*(miu - lambda))
let L:Float = Lq + (lambda/miu)
let W:Float = Wq + (1.0/miu)
let Ct:Float = m*Cs + W*lambda*Cw