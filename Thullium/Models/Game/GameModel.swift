//
//  GameModel.swift
//  FlashCards
//
//  Created by Richard on 18.09.2023.
//

import Foundation
import SwiftUI

@Observable
class GameModel{
    var numberOfAttempts = 0{
        willSet{
            print("Number aded")
            print(numberOfAttempts)
            print(hint)
            if newValue>5{
                print("get here")
                hint = currentGuess
            }else if newValue == 0{
                hint = ""
            }
        }
    }
    var currentGuess = ""
    var hint = ""{
        didSet{
            print("hint changed")
        }
    }
    var currentNumber = 0
    var showAlert = false
    var namesReady:[String] = []
    var alreadyGuessed:[String] = []{
        didSet{
            //On change of value - done from view
            print("Guessed \(currentGuess)")
            if currentNumber != alreadyGuessed.count{
                print(namesReady)
                currentNumber += 1
                currentGuess = namesReady[currentNumber]
            }else if currentNumber > alreadyGuessed.count{
                endGame()
            }
        }
    }
    
    init(){
        // add maybe an other variable to get swiftdata into this
        var array:[String] = []
        for el in JSONtoSwiftDataconverter().eData{
            array.append(el.name)
        }
        namesReady = array.shuffled()
        currentGuess = namesReady[currentNumber]
    }
    
    func endGame(){
        showAlert = true
    }
    
    func restartGame(){
        namesReady = alreadyGuessed.shuffled()
        alreadyGuessed = []
        currentNumber = 0
        print(alreadyGuessed)
        print(namesReady)
        print(currentNumber)
    }
    
    //Called from the actual view ====== maybe they will be given the acess just to the array
    func addToGuessed(name:String){
        alreadyGuessed.append(name)
        numberOfAttempts = 0
    }
    
    //Filter by category selected in ChemistryPopUpView
    func filterTheTerms(par : [String]){
        namesReady = []
        for p in par{
            for e in JSONtoSwiftDataconverter().eData{
                if e.category.contains(p){
                    namesReady.append(e.name)
                }else{
                    alreadyGuessed.append(e.name)
                }
            }
        }
    }
}
