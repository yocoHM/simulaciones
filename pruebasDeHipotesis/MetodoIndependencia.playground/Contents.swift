import UIKit

//************ archivo para modificar (archivo.csv en Resources) ************
//IMPORTANTE: todos los numeros deben de ir en una sola linea desde el archivo de excel
let filePath = Bundle.main.path(forResource: "independenciaNums", ofType: "csv")

//************ Algoritmo ************
if let path = filePath {
  let contentData:Data! = FileManager.default.contents(atPath: path)
  
  let c = NSString(data: contentData, encoding: String.Encoding.utf8.rawValue) as? String
  
  if let contenido = c {
    
    let numerosArregloStr = contenido.characters.split{$0 == ","}.map(String.init)
    
    var numeros:[Float] = numerosArregloStr.map { Float($0)! }
    let N = numeros.count
    print("N = \(N)")
    
    //************ Variables para modificar ************
    let i = 3
    let l = 5
    let M = 4
    //************ Variables para modificar ************
    
    let formulaM = i + (M + 1) * l
    print("Formula M = \(formulaM)")
    if (formulaM < N){
      var pos = i
      var temp:Float = 0
      while (pos != formulaM) {
        temp += numeros[pos-1] * numeros[pos+l-1]
        pos += l
      }
      var Pil = ((1.0/(Float(M)+1.0)) * temp) - 0.25
      var Sigmail = (sqrtf(13*Float(M)+7))/Float(12*(M+1))
      
      var resultado = Pil / Sigmail
      
      print("\nResultado = \(resultado)")
    }
    else {
      print("Disminuir M")
    }
    
  }
  else{
    print("No hay contenido que se pueda usar")
  }
  
}
else {
  print("No se encontró el archivo en Resources (Cmd+1)")
}
//************ Algoritmo ************