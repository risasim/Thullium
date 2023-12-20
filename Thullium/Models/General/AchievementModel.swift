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
                print(loadedAchievements)
                print("Achievements setup sucessfulz")
            }
        }else{
            saveAchievements()
        }
    }
    
    ///Encode ``Achievements`` into JSON and saves them into UserDefaults
    func saveAchievements(){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(achievements){
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "SavedAchievements")
            loadAchivements()
        }
    }
    //Maybe add returning into gameModel, so it knows what achievements have been done, returning array of strings?
    ///Function called after ending the game with
    func getScore(data: GameData){
        if data.allHints == 0{
            achievements.actualAchivements["noMist"]=true
            achievements.achTimeStamps["noMist"] = Date.now
            saveAchievements()
        }
    }
    
    func elementTapped(num: Int){
        print("wtf")
        if !achievements.exploredElements.contains(num){
            print("Element added")
            achievements.exploredElements.append(num)
            saveAchievements()
        }
        if achievements.exploredElements.count == 119{
            achievements.actualAchivements["allElems"]=true
            achievements.achTimeStamps["allElems"] = Date.now
            saveAchievements()
        }
        if achievements.exploredElements.count == 5{
            achievements.actualAchivements["elems5"]=true
            achievements.achTimeStamps["elems5"] = Date.now
            print("YOYOOYOOOYOYOOYOYO")
            saveAchievements()
        }
    }
}


struct Achievements:Codable{
    var exploredElements:[Int]=[]
    var actualAchivements:[String:Bool] = ["noMist":false, "woHint":false,"und3min":false, "allElems":false, "mist5":false, "elems5":false]
    var achTimeStamps:[String:Date?] = ["noMist":nil, "woHint":nil,"und3min":nil, "allElems":nil, "mist5":nil, "elems5":nil]
}
