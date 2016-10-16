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
    numeros = numeros.sorted()
    
    numeros.count
    
    var mayorDMas:Float = -1.0
    var mayorDMenos:Float = -1.0
    
    for i in 0..<numeros.count {
      var fx = Float(i+1)/Float(numeros.count)
      var dMas = fx - numeros[i]
      
      if (dMas > mayorDMas) {
        mayorDMas = dMas
      }
        
      var dMenos = numeros[i] - (Float(i)/Float(numeros.count))
      
      if (dMenos > mayorDMenos) {
        mayorDMenos = dMenos
      }
    }//cierre del for
    
    var arregloD = [mayorDMas, mayorDMenos]
    var D = arregloD.max()!
    
    print("D = \(D)")
  }
  else{
    print("No hay contenido que se pueda usar")
  }

}
else {
  print("No se encontró el archivo en Resources (Cmd+1)")
}
//************ Algoritmo ************






