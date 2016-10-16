import UIKit

//************ variables para modificar ************
let a:Double = 43
var numAleatorio:Double = 117
let m:Double = 100

let limite = 100
//************ variables para modificar ************


//************ Algoritmo ************
let rango = 0..<limite
var semillasArray:[Int] = Array()
var contadorSemillas = 0
var cola:Int = 0
var valor:Int
var encontrado = false


for i in rango {
  
  print("Numero aleatorio x\(i) --> \(Int(round(numAleatorio)))")
  
  if (!encontrado){
    for i in 0..<semillasArray.count {
      if (semillasArray[i] == Int(round(numAleatorio))){
        valor = semillasArray[i]
        cola = i
        encontrado = true
      }
    }
    contadorSemillas += 1
  }
  
  semillasArray.append(Int(round(numAleatorio)))
  
  var operacion:Double = (a*numAleatorio)/m
  var entero = Int(operacion)
  numAleatorio = operacion.truncatingRemainder(dividingBy: 1) * m
  var decimal = numAleatorio/m
  
}

print("")
print("Cola = \(cola)")
print("Ciclo = \((contadorSemillas - 1) - cola)")
print("Periodo = \(contadorSemillas - 1)")
//************ Algoritmo ************

