//
//  AchievementModelTest.swift
//  ThulliumTests
//
//  Created by Richard on 24.12.2023.
//

import XCTest
@testable import Thullium

final class AchievementModelTest: XCTestCase {
    //there is probably a problem with the JSON file
    
    func test5ExploredElementsAchieved(){
        //Arrange
        let achievementModel = AchievementModel()
        achievementModel.achievements.exploredElements = []
        achievementModel.achievements = Achievements()
        achievementModel.saveAchievements()
        //Act
        for i in 1...5{
            achievementModel.elementTapped(num: i)
        }
        //Test
        let expression = Achievement(name: "achs.elems5", desc: "achs.elems5desc", img: "Explorer",achieved: true)
        XCTAssertTrue(achievementModel.achievements.exploredElements.count==5)
        XCTAssertEqual(achievementModel.achievements.achieves["elems5"]?.achieved, expression.achieved)
    }

    func testAllExploredElementsAchieved(){
        //Arrange
        let achievementModel = AchievementModel()
        achievementModel.achievements.exploredElements = []
        achievementModel.achievements = Achievements()
        achievementModel.saveAchievements()
        //Act
        for i in 1...119{
            achievementModel.elementTapped(num: i)
        }
        //Test
        let expression = Achievement(name: "achs.MendeleevAch", desc: "achs.MendeleevAchDesc", img: "Mendeleev",achieved: true)
        XCTAssertTrue(achievementModel.achievements.exploredElements.count==119)
        XCTAssertEqual(achievementModel.achievements.achieves["allElems"]?.achieved, expression.achieved)
    }
    
    //Functionality not yet developed
    func testNoMistakesAchieved(){
        //Arrange
        let achievementModel = AchievementModel()
        achievementModel.achievements = Achievements()
        achievementModel.saveAchievements()
        let gData = GameData()
        
        //Act
        achievementModel.getScore(data: gData)
        //Test
        let expression = Achievement(name: "achs.noMist", desc: "achs.noMistDesc", img: "NoMistake",achieved: true)
        //XCTAssertEqual(achievementModel.achievements.achieves["noMist"]?.achieved, expression.achieved)
    }
    
    func testNoHintsAchieved(){
        //Arrange
        let achievementModel = AchievementModel()
        achievementModel.achievements = Achievements()
        achievementModel.saveAchievements()
        let gData = GameData()
        gData.allHints = 0
        //Act
        achievementModel.getScore(data: gData)
        //Test
        let expression = Achievement(name: "achs.woHint", desc: "achs.woHintDesc", img: "Genius",achieved: true)
        XCTAssertEqual(achievementModel.achievements.achieves["woHint"]?.achieved, expression.achieved)
    }
    
    
}
