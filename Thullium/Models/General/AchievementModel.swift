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
        self.achievements = achievements
    }
    
    ///Decode ``Achievements`` from JSON into ``achievements``
    func loadAchivements(){
        let defaults = UserDefaults.standard
        if let savedAchievements = defaults.object(forKey: "SavedAchievements") as? Data{
            let decoder = JSONDecoder()
            if let loadedAchievements = try? decoder.decode(Achievements.self, from: savedAchievements){
                achievements = loadedAchievements
                print(loadedAchievements)
            }
        }
    }
    
    ///Encode ``Achievements`` into JSON and saves them into UserDefaults
    func saveAchievements(){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(achievements){
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "SavedAchievements")
        }
    }
    //Maybe add returning into gameModel, so it knows what achievements have been done
    ///Function called after ending the game with
    func getScore(data: GameData){
        if data.allHints == 0{
            achievements.actualAchivements["noMist"]=true
        }
    }
    
    func elementTapped(num: Int){
        if !achievements.exploredElements.contains(num){
            achievements.exploredElements.append(num)
        }
        if achievements.exploredElements.count == 119{
            achievements.actualAchivements["allElems"]=true
        }
    }
}


struct Achievements:Codable{
    var exploredElements:[Int]=[]
    var actualAchivements:[String:Bool] = ["noMist":false, "woHint":false,"und3min":false, "allElems":false, "mist5":false]
}
