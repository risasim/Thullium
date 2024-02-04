//
//  JSONtoSwiftDataconverter.swift
//  FlashCards
//
//  Created by Richard on 15.09.2023.
//

import Foundation
//import SwiftData

struct JSONtoSwiftDataconverter{
    var eData:[Element] = []
    var formulas:[Formula]=[]
    
    func loadJson(filename fileName: String) -> [Element]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Elements.self, from: data)
                return jsonData.elements
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    func generallyLoadJSON<T:Codable>(from:String, ofType type: T.Type)->T?{
        if let url = Bundle.main.url(forResource: from, withExtension: "json") {
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            }catch{
                print("error:\(error)")
            }
        }
        return nil
    }
    
    func decode(from fileName:String) ->  Elements{
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let elements = try? JSONDecoder().decode(Elements.self, from: data) else{
            print("error while decoding from JSON")
            return Elements(elements: [])
        }
        return elements
        
    }
    
    init(){
        self.eData = loadJson(filename: "PeriodicTableJSON")!
        self.formulas = generallyLoadJSON(from: "Formulas", ofType: Formulas.self)!.formulas
        
    }
}
