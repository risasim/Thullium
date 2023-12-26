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
        XCTAssertTrue(achievementModel.achievements.exploredElements.count==5)
        XCTAssertTrue(achievementModel.achievements.achieves["elems5"]!.achieved)
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
        XCTAssertTrue(achievementModel.achievements.exploredElements.count==119)
        XCTAssertTrue(achievementModel.achievements.achieves["allElems"]!.achieved)
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
        XCTAssertTrue(achievementModel.achievements.achieves["woHint"]!.achieved)
    }
    
    func testUnd3MinAchieved(){
        //Arrange
        let achievementModel = AchievementModel()
        achievementModel.achievements = Achievements()
        achievementModel.saveAchievements()
        let gModel = GameModel()
        //Act
        gModel.startGame()
        for n in gModel.gData.namesReady{
            gModel.addToGuessed(name: n)
        }
        achievementModel.getScore(data: gModel.gData)
        //Test
        XCTAssertTrue(achievementModel.achievements.achieves["und3min"]!.achieved)
    }
    
    func testMist5Achieved(){
        //Arrange
        let achievementModel = AchievementModel()
        achievementModel.achievements = Achievements()
        achievementModel.saveAchievements()
        let gModel = GameModel()
        gModel.gData.resetUserStat()
        //Act
        gModel.startGame()
        for _ in 1...4{
            gModel.gData.numAt = 6
        }
        print(gModel.gData.mistakes)
        achievementModel.getScore(data: gModel.gData)
        //Test
        XCTAssertTrue(achievementModel.achievements.achieves["mist5"]!.achieved)
    }
    
    func testNoMistAchieved(){
        //Arrange
        let achievementModel = AchievementModel()
        achievementModel.achievements = Achievements()
        achievementModel.saveAchievements()
        let gModel = GameModel()
        gModel.gData.resetUserStat()
        //Act
        gModel.startGame()
        gModel.gData.numAt = 1
        print(gModel.gData.mistakes)
        achievementModel.getScore(data: gModel.gData)
        //Test
        //Because we changed the numAt the mistakes are not 1
        XCTAssertFalse(achievementModel.achievements.achieves["noMist"]!.achieved)
    }
    
    
}
