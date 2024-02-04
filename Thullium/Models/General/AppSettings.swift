//
//  AppSettings.swift
//  Thullium
//
//  Created by Richard on 04.02.2024.
//

import Foundation

struct AppSettings{
   // @AppStorage("showDetailsInSettigs") private var showDetails:Bool = false
   // @AppStorage("numberOfAttemps") private var numberOfAttemps:Int = 5
   // @AppStorage("gameConfetti") private var gameConfetti:Bool = true
    //@AppStorage("showNobleGases") var showNobleGases = true
    // @AppStorage("playNames") var playNames  = true

    var showDetailsInSettings = UserDefaults.standard.bool(forKey: "showDetailsInSettigs")
    var numberOfAttemps = UserDefaults.standard.integer(forKey: "numberOfAttemps")
    var gameConfetti = UserDefaults.standard.bool(forKey: "gameConfetti")
    var showNobleGases = UserDefaults.standard.bool(forKey: "showNobleGases")
    var playNames = UserDefaults.standard.bool(forKey: "playNames")
    
    func initalizeData(){
        UserDefaults.standard.set(true, forKey: "showDetailsInSettigs")
        UserDefaults.standard.set(5, forKey: "numberOfAttemps")
        UserDefaults.standard.set(true, forKey: "gameConfetti")
        UserDefaults.standard.set(true, forKey: "showNobleGases")
        UserDefaults.standard.set(true, forKey: "playNames")
    }
}
