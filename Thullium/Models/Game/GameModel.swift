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
    var started = false
    var numberOfAttempts = 0{
        willSet{
            print(numberOfAttempts)
            if newValue>5{
                hint = currentGuess
            }else if newValue == 0{
                hint = ""
            }
        }
    }
    var currentGuess = ""
    var hint = ""
    var currentNumber = 0
    var showAlert = false
    var namesReady:[String] = []
    var alreadyGuessed:[String] = []{
        didSet{
            if started{
                //On change of value - done from view
                print("Guessed \(currentGuess)")
                if currentNumber < namesReady.count-1{
                    print(namesReady)
                    currentNumber += 1
                    currentGuess = namesReady[currentNumber]
                }else{
                    print("gone here")
                    endGame()
                }
            }
        }
    }
    var categories:[Category] = []
    
    func startGame(){
        started = false
        print("whz")
        namesReady = []
        alreadyGuessed = []
        var prepareNames:[String] = []
        print("though")
        for el in JSONtoSwiftDataconverter().eData{
            var determined = false
            for cat in categories{
                if el.category == cat.name && cat.selected == true{
                    print("\(el.name) in \(cat.name) and gonna be displayed")
                    determined=true
                    prepareNames.append(el.name)
                    break
                }
                if (cat.name.contains("unknown") && el.category.contains("unknown")&&cat.selected==true){
                    prepareNames.append(el.name)
                    determined=true
                    break
                }
            }
            if !determined{
                print("\(el.name) not gonna be displayed")
                alreadyGuessed.append(el.name)
            }
        }
        started = true
        namesReady = prepareNames.shuffled()
        currentGuess = namesReady[currentNumber]
    }
    
    
    
    init(){
        // add maybe an other variable to get swiftdata into this
        var array:[String] = []
        for el in JSONtoSwiftDataconverter().eData{
            array.append(el.name)
        }
        namesReady = array.shuffled()
        currentGuess = namesReady[currentNumber]
        for cat in allCategories{
            categories.append(Category(name: cat, selected: true))
        }
        started = true
    }
    
    func endGame(){
        print("this happened")
        showAlert = true
    }
    
    func restartGame(){
        numberOfAttempts = 0
        currentNumber = 0
        self.startGame()
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

@Observable
class Category{
    var name:String
    var selected: Bool
    
    init(name: String, selected: Bool) {
        self.name = name
        self.selected = selected
    }
}
