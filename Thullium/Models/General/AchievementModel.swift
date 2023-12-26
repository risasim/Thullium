//
//  AchievementModel.swift
//  Thullium
//
//  Created by Richard on 17.12.2023.
//

import Foundation
import SwiftUI

///Model adding gameficitation in this app. Saving them to Userdefaults in ``Achievements`` structure
@Observable
class AchievementModel{
    var achievements = Achievements()

    
    init() {
        loadAchivements()
    }
    
    ///Decode ``Achievements`` from JSON into ``achievements``
    func loadAchivements(){
        print("started laoding")
        let defaults = UserDefaults.standard
        if let savedAchievements = defaults.object(forKey: "SavedAchievements") as? Data{
            let decoder = JSONDecoder()
            if let loadedAchievements = try? decoder.decode(Achievements.self, from: savedAchievements){
                achievements = loadedAchievements
               // print(loadedAchievements)
                print("Achievements setup sucessfully")
            }
        }else{
            print("Loading failed")
            saveAchievements()
        }
    }
    
    ///Encode ``Achievements`` into JSON and saves them into UserDefaults
    func saveAchievements(){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(achievements){
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "SavedAchievements")
            //loadAchivements()
            //print(achievements.exploredElements)
        }
    }
    //Maybe add returning into gameModel, so it knows what achievements have been done, returning array of strings?
    ///Function called after ending the game with
    func getScore(data: GameData){
        if data.allHints == 0{
            markAsAchieved("woHint")
        }
        if data.timeDiff<300.0{
            markAsAchieved("und3min")
        }
        if data.mistakes == 0{
            markAsAchieved("noMist")
        }
        if data.mistakes < 5{
            markAsAchieved("mist5")
        }
    }
    
    func elementTapped(num: Int){
        loadAchivements()
        if !achievements.exploredElements.contains(num){
            achievements.exploredElements.append(num)
            saveAchievements()
        }
        if achievements.exploredElements.count == 119 && achievements.achieves["allElems"]?.date==nil{
            markAsAchieved("allElems")
        }
        if achievements.exploredElements.count == 5 && achievements.achieves["elems5"]?.date==nil{
            markAsAchieved("elems5")
        }
    }
    
    func markAsAchieved(_ name: String){
        if achievements.achieves[name]?.date == nil {
            achievements.achieves[name]?.achieved = true
            achievements.achieves[name]?.date = Date.now
            saveAchievements()
        }
    }
    
    func exportAchievements()->[Achievement]{
        loadAchivements()
        let ar = Array(achievements.achieves.values.map{ $0 })
        var arDone:[Achievement] = []
        var arNotDone:[Achievement] = []
        for a in ar{
            if a.achieved==true{
                arDone.append(a)
            }else{
                arNotDone.append(a)
            }
        }
        return arDone + arNotDone
    }
}


struct Achievements:Codable{
    var version = 1.0
    var exploredElements:[Int]=[]
    var achieves:[String:Achievement] = [
        "noMist":Achievement(name: "achs.noMist", desc: "achs.noMistDesc", img: "NoMistake"),
        "woHint":Achievement(name: "achs.woHint", desc: "achs.woHintDesc", img: "Genius"),
        "und3min":Achievement(name: "achs.und3min", desc: "achs.und3minDesc", img: "Sprinter"),
        "allElems":Achievement(name: "achs.MendeleevAch", desc: "achs.MendeleevAchDesc", img: "Mendeleev"),
        "mist5":Achievement(name: "achs.mist5", desc: "achs.mist5Desc", img: "Mistake5"),
        "elems5":Achievement(name: "achs.elems5", desc: "achs.elems5desc", img: "Explorer")
    ]
}

struct Achievement:Codable, Hashable, Comparable{
    static func < (lhs: Achievement, rhs: Achievement) -> Bool {
        return lhs.name.count < rhs.name.count
    }
    
    var name:String
    var desc:String
    var img:String
    var achieved:Bool = false
    var date:Date? = nil
    var grad:Gradient{
        switch name{
        case "achs.noMist":
            let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
            let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
            return Gradient(colors: [gradientStart, gradientEnd])
        case "achs.woHint":
            let gradientStart = Color(red: 95.0 / 255, green: 44.0 / 255, blue: 130.0 / 255)
            let gradientEnd = Color(red: 73.0 / 255, green: 160.0 / 255, blue: 157.0 / 255)
            return Gradient(colors: [gradientStart, gradientEnd])
        case "achs.und3min":
            let gradientStart = Color(red: 195.0 / 255, green: 20.0 / 255, blue: 50.0 / 255)
            let gradientEnd = Color(red: 36.0 / 255, green: 11.0 / 255, blue: 54.0 / 255)
            return Gradient(colors: [gradientStart, gradientEnd])
        case "achs.MendeleevAch":
            let gradientStart = Color(red: 224.0 / 255, green: 234.0 / 255, blue: 252.0 / 255)
            let gradientEnd = Color(red: 207.0 / 255, green: 222.0 / 255, blue: 243.0 / 255)
            return Gradient(colors: [gradientStart, gradientEnd])
        case "achs.mist5":
            let gradientStart = Color(red: 17.0 / 255, green: 153.0 / 255, blue: 142.0 / 255)
            let gradientEnd = Color(red: 56.0 / 255, green: 239.0 / 255, blue: 125.0 / 255)
            return Gradient(colors: [gradientStart, gradientEnd])
        case "achs.elems5":
            let gradientStart = Color(red: 255.0 / 255, green: 238.0 / 255, blue: 238.0 / 255)
            let gradientEnd = Color(red: 221.0 / 255, green: 239.0 / 255, blue: 187.0 / 255)
            return Gradient(colors: [gradientStart, gradientEnd])
        default:
            let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
            let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
            return Gradient(colors: [gradientStart, gradientEnd])
        }
    }
}
