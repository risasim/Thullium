//
//  GameModel.swift
//  FlashCards
//
//  Created by Richard on 18.09.2023.
//

import Foundation
import SwiftUI


///Managing  the game with Periodic Table.
@Observable
class GameModel{
    
// MARK: - Variables
    var gData = GameData()
    var categories:[Category] = []
    ///Manages game settings through ``GamePSetupView``
    var setupModel = GSetupModel()
    
// MARK: - Functions
    /*
     manageTap in PeroidiTableView ensures the logic of being selected, here is logic for how the game works
     
     */
    
    init(){
        // add maybe an other variable to get swiftdata into this NOT NEEDED BECAUSE OF INIT IN SWIFTDATA
    //    var array:[String] = []
    //    for el in JSONtoSwiftDataconverter().eData{
    //        array.append(el.name)
    //    }
    //    gData.namesReady = array.shuffled()
        gData.getGuess()
        for cat in allCategories{
            categories.append(Category(name: cat, selected: true))
        }
        gData.ready = true
    }
    
    ///Initialises the game data and filter them
    func startGame(){
        gData.ready = false
        categories = setupModel.criteria
        if (UserDefaults.standard.integer(forKey: "numberOfAttemps")<3){
            gData.hintCeling = 5
        }else{
            gData.hintCeling = UserDefaults.standard.integer(forKey: "numberOfAttemps")
        }
        gData.namesReady = []
        gData.resetUserStat()
        gData.namesReady = prepareGameWithFilter().shuffled()
        gData.ready = true
        gData.getGuess()
        gData.startTimeStamp = Date.now
        if gData.hintCeling==0{
            gData.hintCeling=5
        }
        print(gData.hintCeling)
    }
    
    ///Resets data and call ``startGame()`` to prepare for new game
    func restartGame(){
        gData.resetUserStat()
        self.startGame()
    }
    
    //Called from the actual view ====== maybe they will be given the acess just to the array
    func addToGuessed(name:String){
        gData.alreadyGuessed.append(name)
        gData.numAt = 0
    }
    
    ///Filtering the elements for the game
    func prepareGameWithFilter()->[String]{
        var prepareNames:[String] = []
        for el in JSONtoSwiftDataconverter().eData{
            var determined = false
            for cat in categories{
                if el.category == cat.name && cat.selected == true{
                    //print("\(el.name) in \(cat.name) and gonna be displayed")
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
                //print("\(el.name) not gonna be displayed")
                gData.alreadyGuessed.append(el.name)
            }
        }
        return prepareNames
    }
    
    //Filter by category selected in ChemistryPopUpView
    func filterTheTerms(par : [String]){
        for p in par{
            for e in JSONtoSwiftDataconverter().eData{
                if e.category.contains(p){
                    gData.namesReady.append(e.name)
                }else{
                    gData.alreadyGuessed.append(e.name)
                }
            }
        }
    }
    
    func manageTap(index i: Int,name:String)->Bool{
        if gData.currentGuess == name{
            addToGuessed(name:name)
            #if os(iOS)
            feedbackGenerator.notificationOccurred(.success)
            #endif
            return true
        }else{
            #if os(iOS)
            feedbackGenerator.notificationOccurred(.error)
            #endif
            print("This happened")
            print(gData.numAt)
            gData.numAt += 1
            print("Got here")
            return false
        }
    }
}
