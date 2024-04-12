//
//  ModelData.swift
//  DemoClima
//
//  Created by Fernando Daniel Portilla Posadas on 11/04/24.
//

import Foundation

var previewWeather: ResponseBody = load("weatherData.json")

func load<T: Decodable>(_ filename: String) -> T{
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("No se encontró \(filename) en el main bundle")
    }
    
    do{
        data = try Data(contentsOf: file)
    } catch{
        fatalError("No se encontró \(filename) en el main bundle: \n \(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("No se pudo convertir el archivo \(filename) al tipo \(T.self):\n\(error)")
    }
}
