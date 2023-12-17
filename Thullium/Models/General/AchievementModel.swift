//
//  AchievementModel.swift
//  Thullium
//
//  Created by Richard on 17.12.2023.
//

import Foundation

@Observable
class AchievementModel{
    var achievements = Achievements()
    init() {
        self.achievements = achievements
    }
    func loadAchivements(){
        let defaults = UserDefaults.standard
        if let savedAchievements = defaults.object(forKey: "SavedAchievements") as? Data{
            let decoder = JSONDecoder()
            if let loadedAchievements = try? decoder.decode(Achievements.self, from: savedAchievements){
                achievements = loadedAchievements
            }
        }
    }
    func saveAchievements(){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(achievements){
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "SavedAchievements")
        }
    }
}


struct Achievements:Codable{
    var exploredElements:[Int]=[]
    var actualAchivements:[String:Bool] = ["noMist":false, "woHint":false,"und3min":false, "allElems":false, "mist5":false]
}
