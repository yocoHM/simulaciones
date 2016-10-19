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
    
    var K:Float = ceil(logf(Float(numeros.count)) / logf(2.0))
    
    var intervalo = (numeros.max()! - numeros.min()!) / K
    
    let digitos = String(intervalo).characters.split{$0 == "."}.map(String.init)
    var decimales = digitos[1].characters.count
    let unidadMinima = 1 / (pow(10.0, Float(decimales)))
    
    var min = numeros.min()!
    var mayor = min + intervalo - unidadMinima
    var total = 0
    var conts:[Float] = Array()
    var intervalos:[(Float,Float)] = Array()
    var cont = 0
    var Ei:Float = 0.0
    var X2:Float = 0.0
    
    //en este repeat se ajusta el intervalo solito
    repeat {
      min = numeros.min()!
      mayor = min + intervalo - unidadMinima
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
        
        min = mayor + unidadMinima
        mayor = min + intervalo - unidadMinima
        cont = 0
      }//cierre del for para obtener los conts
      
      if (total != numeros.count) {
        intervalo += unidadMinima
      }
      
    } while ((numeros.max()! > min) && total != numeros.count)
    
    if (total == numeros.count){
      
      min = numeros.min()!
      mayor = min + intervalo - unidadMinima
      total = 0
      conts = Array()
      intervalos = Array()
      
      cont = 0
      
      for i in 1...Int(K) {
        
        for i in numeros {
          if (i >= min && i <= mayor){
            cont += 1
          }
        }
        conts.append(Float(cont))
        
        var tuplaIntervalos = (min,mayor)
        intervalos.append(tuplaIntervalos)
        
        total += cont
        
        min = mayor + unidadMinima
        mayor = min + intervalo - unidadMinima
        cont = 0
      }//cierre del for para obtener los conts
      
      var menorEncontrado = false
      var j:Int = 0
      
      while (!menorEncontrado && j != conts.count){
        if (conts[j] < 5){
          menorEncontrado = true
        }
        j += 1
      }
      
      if (menorEncontrado) {
        print("AJUSTE DE INTERVALOS (POR TENER MENOS DE 5 VALORES)")
        
        var contsBien:[Float] = Array()
        var intervalosBien:[(Float,Float)] = Array()
        
        var i:Int = 0
        
        while (i < conts.count) {
          if (conts[i] < 5){
            var temp = conts[i+1] + conts[i]
            contsBien.append(temp)
            intervalosBien.append((intervalos[i].0,intervalos[i+1].1))
            i += 1
          }
          else{
            contsBien.append(conts[i])
            intervalosBien.append((intervalos[i].0,intervalos[i].1))
          }
          i += 1
        }
        
        print("---Intervalos---")
        for i in 0..<intervalosBien.count {
          print("\(intervalosBien[i].0) - \(intervalosBien[i].1)")
          print("Cantidad de nums en el intervalo = \(Int(contsBien[i]))")
        }
        
        K = Float(contsBien.count)
        
        Ei = (1.0/K) * 100.0
        
        for i in 0..<contsBien.count {
          X2 += (pow(contsBien[i] - Ei, 2)) / Ei
        }
        
      }
      else {
        print("NO SE SUFRIÓ AJUSTE DE INTERVALOS (POR LA CANTIDAD DE VALORES QUE CONTIENEN)")
        print("---Intervalos---")
        for i in 0..<intervalos.count {
          print("\(intervalos[i].0) - \(intervalos[i].1)")
          print("Cantidad de nums en el intervalo = \(Int(conts[i]))")
        }
        
        Ei = (1.0/K) * 100.0
        
        for i in 0..<conts.count {
          X2 += (pow(conts[i] - Ei, 2)) / Ei
        }
        
      }
      
      print("\nN = \(numeros.count)")
      print("K = \(Int(K))")
      print("X2 = \(X2)")
      
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






