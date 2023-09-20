//
//  SearchTable.swift
//  Thullium
//
//  Created by Richard on 20.09.2023.
//

import Foundation
import SwiftUI

@Observable
class SearchTable{
    var showThese:[String] = []
    var allElements:[String] = []
    var search:String = ""{
        willSet{
            print("this happened")
            if(newValue != ""){
                self.performSearch(s: newValue)
            }else{
                showThese = getAllElements()
            }
        }
    }
    
    init(){
        self.allElements = getAllElements()
        self.showThese = self.allElements
    }
    
    private func performSearch(s:String){
        showThese = []
        print("Searching")
        for el in allElements{
            if (el.lowercased()).contains(s.lowercased()){
                showThese.append(el)
            }
        }
    }
    
    private func getAllElements() ->[String]{
        let data = JSONtoSwiftDataconverter().eData
        var arEl:[String] = []
        for el in data{
            arEl.append(el.name)
        }
        return arEl
    }
    
}
