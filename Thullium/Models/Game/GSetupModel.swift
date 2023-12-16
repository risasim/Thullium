//
//  GSetupModel.swift
//  Thullium
//
//  Created by Richard on 16.12.2023.
//

import Foundation
import Observation

@Observable
class GSetupModel {
    var criteria = allCats
    var showMessage:Bool = false
    
    ///Function that ensures that the game is not started with zero categories to choose from
    func checkTheSelection(_ cat: Category){
        var counter = 0
        for c in criteria{
            if c.selected==true{
                counter+=1
            }
        }
        if counter<2{
            showMessage.toggle()
        }else{
            cat.selected.toggle()
        }
    }
    
    func selectAll(){
        for c in criteria{
            c.selected=true
        }
    }
    
    ///Function that  chooses random categories
    func randomSelection(){
        for c in criteria{
            c.selected=false
        }
        let count = Int.random(in: 2...criteria.count-1)
        var used:[Int] = []
        for n in 0...count{
            var index = Int.random(in: 0...criteria.count-1)
            while used.contains(index)==true{
                index = Int.random(in: 0...criteria.count-1)
            }
            criteria[index].selected = true
            used.append(index)
        }
        used=[]
    }
}
