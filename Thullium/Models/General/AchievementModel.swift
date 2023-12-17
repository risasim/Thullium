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
        let decoder = JSONDecoder()
    }
    func saveAchievements(){
        
    }
}


struct Achievements:Codable{
    var exploredElements:[Int]=[]
    var actualAchivements:[String:Bool] = ["noMist":false, "woHint":false,"und3min":false, "allElems":false, "mist5":false]
}
