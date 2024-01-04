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
            if newValue>=hintCeling{
                hinted = currentGuess
                allHints+=1
                mistakes+=1;
            }else if newValue == 0{
                hinted = ""
            }else{
                mistakes+=1
            }
        }
    }
    /// Int used to determine ``Achievement`` called "noMist" and "mist5"
    var mistakes = 0
    /// Number of mistakes
    var hintCeling = 5
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
    /// TimeStamp at the start of the Game
    var startTimeStamp = Date.now
    /// TimeStamp at the end of the Game
    var finishTimeStamp = Date.now
    /// Array of elements in form of string. By this array is in PeriodicTest.swift determined, if it's shown.
    var alreadyGuessed:[String] = []{
        didSet{
            if ready{
                if arIndex < namesReady.count-1{
                    arIndex += 1
                    currentGuess = namesReady[arIndex]
                }else{
                    finishTimeStamp = Date.now
                    getTimeDiff()
                    showAlert = true
                }
            }
        }
    }
    ///  Array of element in their normal order.
    var namesPreset:[String] = []
    /// Timestamps diference
    var timeDiff:Double = 0.0
    
    init() {
        for el in JSONtoSwiftConverted.eData{
            namesPreset.append(el.name)
        }
        namesReady = namesPreset.shuffled()
    }
    
    func getTimeDiff(){
        timeDiff = finishTimeStamp.timeIntervalSince(startTimeStamp)
    }

    func getGuess(){
        self.tapHint = 0
        self.currentGuess = namesReady[arIndex]
    }
    
    func resetUserStat(){
        self.alreadyGuessed = []
        self.numAt = 0
        self.arIndex = 0
        self.mistakes = 0
    }
   
}
