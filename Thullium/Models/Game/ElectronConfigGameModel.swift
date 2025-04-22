//
//  ElectronConfigGameModel.swift
//  Thullium
//
//  Created by Richard on 04.02.2024.
//

import Foundation
import SwiftUI

///ElectrongConfigGameModel does contain the logic for the game where user picks the electron configuration/writes the configuration based on the element.
@Observable
class ElectronConfigGameModel:GamingModel{
    ///List of all of the elements
    private var elements:[Element] = JSONtoSwiftDataconverter().eData
    ///Specail configuration for Juli
    private let JConfig:[String] =  ["Se", "Mn", "Cr", "Be", "Pt", "Ni", "Ge", "Cs", "O", "Sn", "Ne", "K", "Ga", "Fe", "B", "Sb", "Ar", "Li", "Ca", "F", "Rb", "S", "Xe", "Ag", "P", "He", "Co", "Ba", "Na", "Hg", "P", "N", "Cl", "Sr", "Te", "Au", "Br", "C", "As", "I", "Cu", "Zn", "Al", "Kr", "H", "Ra", "G", "Si"]
    ///Testing configuration
    private let RConfig:[String] =  ["N", "H", "Si"]
    ///Noble gasses which I think are not included
    private let nobleGases:[String]=["He","Ar","Ne","Kr","Xe","Rn"]
    ///Array in which is the current order of all of the guessed elements.
    var gameArr:[ConfigGameItem] = []
    ///The number of the current guess. used as the index in ``gameArr``
    var currentGuess = 0
    ///Current guessed element
    var currentItem:ConfigGameItem = ConfigGameItem(name: "", config: "", configSemantic: "", symbol: "")
    ///Flag for if the game has ended
    var gameEnded = false
    ///Flag to show the alert after the game has ended
    var showAlert = false
    //Current elements that are displayed with two wrong ones and one correct
    var elemSet:[ConfigGameItem] = []
    
    init(){
        prepare()
        currentItem = gameArr[currentGuess]
        getRandomSelectors()
    }
    
    ///Checks whether inputed either element or the description is correct
    func checkCurrentGuess(text:String,with: Bool = false) -> Bool{
        //here will be the change if we play name or config
        if UserDefaults.standard.bool(forKey: "playNames")==true{
            if currentItem.name.lowercased()==text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() || text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()==currentItem.name.localized(forLanguageCode: "cs").lowercased(){
                newGuess(with: with)
                return true
            }else{
                return false
            }
        }else{
            if gameArr[currentGuess].config==text || gameArr[currentGuess].configSemantic==text{
                newGuess()
                return true
            }else{
                return false
            }
        }
    }
    
    ///Updates the current gues and if it is last in ``gameArr`` then it ends the game
    private func newGuess(with:Bool = false){
        if currentGuess<gameArr.count-1{
            if with{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.currentGuess+=1
                    self.currentItem = self.gameArr[self.currentGuess]
                    self.getRandomSelectors()
                }
            }else{
                currentGuess+=1
                currentItem = gameArr[currentGuess]
            }
        }else{
            gameEnded=true
            showAlert = true
        }
    }
    
    ///Restarts the game, meaning that the ``gameEnded``, ``gameArr`` will be reset.
    func restartGame() {
        gameEnded = false
        gameArr = []
        prepare()
    }
    
    func showAlertToggle() {
        showAlert.toggle()
    }
    
    ///Prepares the game by adding all  the elemtns based on the configuration.
    private func prepare(config: Bool = true){
        //Adds the elements in random order
        for element in elements.shuffled(){
            if JConfig.contains(element.symbol){
                self.gameArr.append(ConfigGameItem(name: element.name, config: element.electron_configuration, configSemantic: element.electron_configuration_semantic, symbol: element.symbol))
            }
        }
        currentGuess = 0
    }
    
    ///Picks two unique elements to be in the quiz
    private func getRandomSelectors(){
        var ar:[ConfigGameItem] = []
        while(ar.count<2){
            let rand = Int.random(in: 0...gameArr.count-1)
            if(gameArr[rand].name != currentItem.name && !ar.contains(where: {$0.name==gameArr[rand].name})){
                ar.append(gameArr[rand])
            }
        }
        ar.append(currentItem)
        elemSet = ar.shuffled()
    }
}


///Data structure to hold element data that will be used in during the electrong config game
struct ConfigGameItem:ElementInfoData{
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


extension String {
    func localized(forLanguageCode lanCode: String) -> String {
        guard
            let bundlePath = Bundle.main.path(forResource: lanCode, ofType: "lproj"),
            let bundle = Bundle(path: bundlePath)
        else { return "" }
        
        return NSLocalizedString(
            self,
            bundle: bundle,
            value: " ",
            comment: ""
        )
    }
}
