//
//  ElectronConfigGameModel.swift
//  Thullium
//
//  Created by Richard on 04.02.2024.
//

import Foundation

@Observable
class ElectronConfigGameModel{
    private var elements = JSONtoSwiftDataconverter().eData
    private let JConfig:[String] =  ["Se", "Mn", "Cr", "Be", "Pt", "Ni", "Ge", "Cs", "O", "Sn", "Ne", "K", "Ga", "Fe", "B", "Sb", "Ar", "Li", "Ca", "F", "Rb", "S", "Xe", "Ag", "P", "He", "Co", "Ba", "Na", "Hg", "P", "N", "Cl", "Sr", "Te", "Au", "Br", "C", "As", "I", "Cu", "Zn", "Al", "Kr", "H", "Ra", "G", "Si"]
    private let RConfig:[String] =  ["N", "H", "Si"]
    var gameArr:[ConfigGameItem] = []
    var currentGuess = 0
    var currentItem:ConfigGameItem
    var gameEnded = false
    
    init(){
        currentItem = ConfigGameItem(name: "", config: "", configSemantic: "", symbol: "")
        prepare()
        currentItem = gameArr[currentGuess]
    }
    
    func checkCurrentGuess(text:String) -> Bool{
        //here will be the change if we play name or config
        if gameArr[currentGuess].config==text || gameArr[currentGuess].configSemantic==text{
            newGuess()
            return true
        }else{
            return false
        }
    }
    
    private func newGuess(){
        if currentGuess<gameArr.count-1{
            currentGuess+=1
            currentItem = gameArr[currentGuess]
        }else{
            gameEnded=true
        }
    }
    
    func gameRestart(){
        gameEnded = false
        prepare()
    }
    
    private func prepare(config: Bool = true){
        for element in elements.shuffled(){
            if RConfig.contains(element.symbol){
                print("\(element.name) and the symbol \(element.symbol) added")
                self.gameArr.append(ConfigGameItem(name: element.name, config: element.electron_configuration, configSemantic: element.electron_configuration_semantic, symbol: element.symbol))
            }
        }
        currentGuess = 0
    }
}


struct ConfigGameItem{
    let name: String
    let config:String
    let configSemantic: String
    let symbol:String
    
    init(name: String, config: String, configSemantic: String, symbol: String) {
        self.name = name
        self.config = config
        self.configSemantic = configSemantic
        self.symbol = symbol
    }
}
