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
    
// MARK: - Functions
    /*
     manageTap in PeroidiTableView ensures the logic of being selected, here is logic for how the game works
     
     */
    
    init(){
        // add maybe an other variable to get swiftdata into this
        var array:[String] = []
        for el in JSONtoSwiftDataconverter().eData{
            array.append(el.name)
        }
        gData.namesReady = array.shuffled()
        gData.currentGuess = gData.getGuess()
        for cat in allCategories{
            categories.append(Category(name: cat, selected: true))
        }
        gData.ready = true
    }
    
    func startGame(){
        gData.ready = false
        gData.namesReady = []
        gData.alreadyGuessed = []
        gData.resetUserStat()
        var prepareNames:[String] = []
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
                gData.alreadyGuessed.append(el.name)
            }
        }
        gData.ready = true
        gData.namesReady = prepareNames.shuffled()
        gData.currentGuess = gData.getGuess()
    }
    
    func restartGame(){
        gData.resetUserStat()
        self.startGame()
    }
    
    //Called from the actual view ====== maybe they will be given the acess just to the array
    func addToGuessed(name:String){
        gData.alreadyGuessed.append(name)
        gData.numAt = 0
    }
    
    //Filter by category selected in ChemistryPopUpView
    func filterTheTerms(par : [String]){
        gData.namesReady = []
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
}


/// Object created
@Observable
class Category{
    /// Name of category
    var name:String
    /// Determining if this category should be added to ``GameData/namesReady``
    var selected: Bool
    
    init(name: String, selected: Bool) {
        self.name = name
        self.selected = selected
    }
}


/// All data needed for View to function properly and show correctly. Should work only for carrying data not for having main logic.
///
/// - Note:  Only logic carried out by this struct is refreshing in didSet of ``currentGuess`` and determining if hint should be shown in willSet of ``numAt``
@Observable
class GameData{
    /// Used when change of order of elements is needed.
    var ready = false
    var showAlert = false
    /// Number of attempts of user, whilst guessing. When 5 is reached the ``hint`` is showed.
    var numAt = 0{
        willSet{
            if newValue>5{
                hint = currentGuess
            }else if newValue == 0{
                hint = ""
            }
        }
    }
    /// String that is filled with name of elment if needed. Used in ``PeriodicTest``
    var hint = ""
    /// Guessed name of element, that will be shown on top of ``GamePeriodicTableView``
    var currentGuess = ""
    /// Index for ``namesReady``
    private var arIndex = 0
    /// Array of strings containg the names of elements.
    var namesReady:[String] = []
    /// Array of elements in form of string. By this array is in PeriodicTest.swift determined, if it's shown.
    var alreadyGuessed:[String] = []{
        didSet{
            if ready{
                if arIndex < namesReady.count-1{
                    arIndex += 1
                    currentGuess = namesReady[arIndex]
                }else{
                    showAlert = true
                }
            }
        }
    }
    ///  Array of element in their normal order. 
    var namesPreset:[String] = []
    
    init() {
        for el in JSONtoSwiftConverted.eData{
            namesPreset.append(el.name)
        }
        namesReady = namesPreset
    }
    
    func getGuess() -> String{
        return namesReady[arIndex]
    }
    
    func resetUserStat(){
        self.numAt = 0
        self.arIndex = 0
    }
   
}
