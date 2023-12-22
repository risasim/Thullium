//
//  AchievementModel.swift
//  Thullium
//
//  Created by Richard on 17.12.2023.
//

import Foundation

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
            achievements.achieves["noMist"]?.achieved=true
            achievements.achieves["noMist"]?.date = Date.now
            saveAchievements()
        }
    }
    
    func elementTapped(num: Int){
        print("wtf, count:"+String(achievements.exploredElements.count))
        loadAchivements()
        if !achievements.exploredElements.contains(num){
            print("Element added")
            achievements.exploredElements.append(num)
            print(achievements.exploredElements)
            saveAchievements()
        }
        else if achievements.exploredElements.count == 119{
            achievements.achieves["allElems"]?.achieved = true
            achievements.achieves["allElems"]?.date = Date.now
            saveAchievements()
        }
        else if achievements.exploredElements.count == 5{
            achievements.achieves["elems5"]?.achieved = true
            achievements.achieves["elems5"]?.date = Date.now
            print("YOYOOYOOOYOYOOYOYO")
            saveAchievements()
        }
    }
}


struct Achievements:Codable{
    var exploredElements:[Int]=[]
    var achieves:[String:Achievement] = [
        "noMist":Achievement(name: "achs.noMist", desc: "achs.noMistDesc", img: ""),
        "woHint":Achievement(name: "achs.woHint", desc: "achs.woHintDesc", img: ""),
        "und3min":Achievement(name: "achs.und3min", desc: "achs.und3minDesc", img: ""),
        "allElems":Achievement(name: "achs.MendeleevAch", desc: "achs.MendeleevAchDesc", img: "Mendeleev"),
        "mist5":Achievement(name: "achs.mist5", desc: "achs.mist5Desc", img: "",achieved: true),
        "elems5":Achievement(name: "achs.elems5", desc: "achs.elems5Desc", img: "")
    ]
}

struct Achievement:Codable, Hashable, Comparable{
    static func < (lhs: Achievement, rhs: Achievement) -> Bool {
        //Not sure if this part does the wanted thing
        
        return lhs.name.count < rhs.name.count
    }
    
    var name:String
    var desc:String
    var img:String
    var achieved:Bool = false
    var date:Date? = nil
}
