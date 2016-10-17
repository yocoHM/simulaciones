import UIKit

//************ archivo para modificar (archivo.csv en Resources) ************
//IMPORTANTE: todos los numeros deben de ir en una sola linea desde el archivo de excel
let filePath = Bundle.main.path(forResource: "numeros", ofType: "csv")
//para numeros.csv K = 7 e Intervalo sumarle 0.01
//Para numeros3.csv K = 10 e Intervalo sumarle 0.01

//************ Algoritmo ************
if let path = filePath {
  let contentData:Data! = FileManager.default.contents(atPath: path)
  
  let c = NSString(data: contentData, encoding: String.Encoding.utf8.rawValue) as? String
  
  if let contenido = c {
    
    let numerosArregloStr = contenido.characters.split{$0 == ","}.map(String.init)
    var numeros:[Float] = numerosArregloStr.map { Float($0)! }
    
    print("N = \(numeros.count)")
    //************ Seleccion de K (variable para modificar) ************
    let K:Float = 7
    
    var intervalo = (numeros.max()! - numeros.min()!) / K
    print("Intervalo = \(intervalo)")
    
    let digitos = String(intervalo).characters.split{$0 == "."}.map(String.init)
    var decimales = digitos[1].characters.count
    let ajuste = 1 / (pow(10.0, Float(decimales)))
    
    //************ Ajuste al intervalo(variable para modificar) ************
    //intervalo += 0.01; print("Nuevo intervalo = \(intervalo)")
    
    var min = numeros.min()!
    var mayor = min + intervalo - ajuste
    
    print("--- Intervalos ---")
    for i in 1...Int(K) {
      print("\(min) - \(mayor)")
      min = mayor + ajuste
      mayor = min + intervalo - ajuste
    }

    if (min < 1.0) {
      print("REALIZAR AJUSTE en 'intervalo' o 'K'")
    }
    else {
      print("INTERVALOS ADECUADOS\n")
      
      var conts:[Float] = Array()
      
      min = numeros.min()!
      mayor = min + intervalo - ajuste
      var cont = 0
      var total = 0
      
      for i in 1...Int(K) {
        print("\(min) - \(mayor)")
        
        for i in numeros {
          if (i >= min && i <= mayor){
            cont += 1
          }
        }
        conts.append(Float(cont))
        total += cont
        print("Cantidad de nums en el intervalo = \(cont)")
        
        min = mayor + ajuste
        mayor = min + intervalo - ajuste
        cont = 0
      }//cierre del for para obtener los conts
      
      if (total == numeros.count){
        print("La cantidad de numeros en cada intervalo es correcta\n")
        
        let Ei = (1.0/K) * 100.0
        var X2:Float = 0.0
        
        for i in 0..<conts.count {
          X2 += (pow(conts[i] - Ei, 2)) / Ei
        }
        
        print("X2 = \(X2)")
      }
      else {
        print("ERROR: Revisar la cantidad de numeros en cada intervalo")
      }

    }//cierre para else de intervalos adecuados
  }//cierre de if cuando hay contenido
  else{
    print("No hay contenido que se pueda usar")
  }
  
}
else {
  print("No se encontró el archivo en Resources (Cmd+1)")
}
//************ Algoritmo ************






