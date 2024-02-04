//
//  FormulaModel.swift
//  Thullium
//
//  Created by Richard on 04.02.2024.
//

import Foundation

struct Formulas:Codable{
    let formulas:[Formula]
}

struct Formula:Codable{
    let title:String
    let equation: String
    let info:String?
}


