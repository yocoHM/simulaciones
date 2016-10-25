import UIKit

//************ variables para modificar ************
let a:Double = 8
var numAleatorio:Double = 27
let c:Double = 47
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
  
  var temp = Int(a*numAleatorio + c) % Int(m)
  numAleatorio = Double(temp)
  
}

print()
print("Cola = \(cola)")
print("Ciclo = \((contadorSemillas - 1) - cola)")
print("Periodo = \(contadorSemillas - 1)")
//************ Algoritmo ************

