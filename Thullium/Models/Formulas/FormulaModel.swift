//
//  FormulaModel.swift
//  Thullium
//
//  Created by Richard on 04.02.2024.
//

import Foundation

///Data struct that holds the formulas
struct Formulas:Codable{
    let formulas:[Formula]
}

///Data structure that holds the formula information.
struct Formula:Codable{
    ///The name or title of the formula
    let title:String
    ///Equation that is in LaTeX  for SwiftMath to show
    let equation: String
    ///Additional optional info about the formula
    let info:String?
    ///Optional variables that cound be in the formula
    let variables: [FormulaEquationVariable]?
}


