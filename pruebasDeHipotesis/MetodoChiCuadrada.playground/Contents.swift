import UIKit

//************ archivo para modificar (archivo.csv en Resources) ************
//IMPORTANTE: todos los numeros deben de ir en una sola linea desde el archivo de excel
let filePath = Bundle.main.path(forResource: "numeros3", ofType: "csv")

//************ Algoritmo ************
if let path = filePath {
  let contentData:Data! = FileManager.default.contents(atPath: path)
  
  let c = NSString(data: contentData, encoding: String.Encoding.utf8.rawValue) as? String
  
  if let contenido = c {
    
    let numerosArregloStr = contenido.characters.split{$0 == ","}.map(String.init)
    var numeros:[Float] = numerosArregloStr.map { Float($0)! }
    
    print("N = \(numeros.count)")
    let K:Float = ceil(logf(Float(numeros.count)) / logf(2.0))
    print("K = \(Int(K))")
    
    var intervalo = (numeros.max()! - numeros.min()!) / K
    
    let digitos = String(intervalo).characters.split{$0 == "."}.map(String.init)
    var decimales = digitos[1].characters.count
    let ajuste = 1 / (pow(10.0, Float(decimales)))
    
    var min = numeros.min()!
    var mayor = min + intervalo - ajuste
    var total = 0
    var conts:[Float] = Array()
    var cont = 0
    
    //en este repeat se ajusta el intervalo solito
    repeat {
      min = numeros.min()!
      mayor = min + intervalo - ajuste
      total = 0
      conts = Array()
      cont = 0
      
      for i in 1...Int(K) {
        
        for i in numeros {
          if (i >= min && i <= mayor){
            cont += 1
          }
        }
        conts.append(Float(cont))
        total += cont
        
        min = mayor + ajuste
        mayor = min + intervalo - ajuste
        cont = 0
      }//cierre del for para obtener los conts
      
      if (total != numeros.count) {
        intervalo += ajuste
      }
      
    } while ((numeros.max()! > min) && total != numeros.count)
    
    if (total == numeros.count){
      
      min = numeros.min()!
      mayor = min + intervalo - ajuste
      total = 0
      conts = Array()
      cont = 0
      
      print("\n--- Intervalos ---")
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
      
      let Ei = (1.0/K) * 100.0
      var X2:Float = 0.0
      
      for i in 0..<conts.count {
        X2 += (pow(conts[i] - Ei, 2)) / Ei
      }
      
      print("\nX2 = \(X2)")
    }
    else {
      print("ERROR: Revisar la cantidad de numeros en cada intervalo")
    }
    
  }//cierre de if cuando hay contenido
  else{
    print("No hay contenido que se pueda usar")
  }
  
}
else {
  print("No se encontró el archivo en Resources (Cmd+1)")
}
//************ Algoritmo ************






