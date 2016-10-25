import UIKit

//************ variables para modificar ************
var semilla:Double = 5497
let cantidadSemillas = 100
//************ variables para modificar ************


//************ Algoritmo ************
let rango = 0..<cantidadSemillas
var semillasArray:[Double] = Array()
var contadorSemillas = 0
var cola:Int = 0
var valor:Double
var encontrado = false

for i in rango {
  
  print("Semilla \(i) --> \(Int(semilla))")
  
  if (!encontrado){
    for i in 0..<semillasArray.count {
      if (semillasArray[i] == semilla){
        valor = semillasArray[i]
        cola = i
        encontrado = true
      }
    }
    contadorSemillas += 1
  }

  semillasArray.append(semilla)
  
  let cuadrado = Int(pow(semilla, 2.0))
  
  var cuadradoStr = String(cuadrado)
  
  if (cuadradoStr.characters.count % 2 != 0){
  cuadradoStr.insert("0", at: cuadradoStr.startIndex)
  }
  
  while (cuadradoStr.characters.count != 4) {
  cuadradoStr.remove(at: cuadradoStr.startIndex)
  cuadradoStr.remove(at: cuadradoStr.index(before: cuadradoStr.endIndex))
  }
  
  let semillaStr = cuadradoStr
  
  semilla = Double(semillaStr)!
  
}

print()
print("Cola = \(cola)")
print("Ciclo = \((contadorSemillas - 1) - cola)")
print("Periodo = \(contadorSemillas - 1)")
//************ Algoritmo ************



