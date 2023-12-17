//
//  GameData.swift
//  Thullium
//
//  Created by Richard on 22.10.2023.
//

import Foundation

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
                hinted = currentGuess
                allHints+=1
            }else if newValue == 0{
                hinted = ""
            }
        }
    }
    /// String that is filled with name of elment if needed. Used in ``PeriodicTest``
    var hinted = ""
    ///Number of taps on the hint icon once give it a short description and second gives it the postion of the element
    var tapHint = 0
    ///Number of all hints that have been used
    var allHints = 0
    /// String showing base info about the element
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
        namesReady = namesPreset.shuffled()
    }
    
  //  func getGuess() -> String{
  //      return namesReady[arIndex]
  //  }
    func getGuess(){
        self.tapHint = 0
        self.currentGuess = namesReady[arIndex]
    }
    
    func resetUserStat(){
        self.alreadyGuessed = []
        self.numAt = 0
        self.arIndex = 0
    }
   
}
