//
//  FormulaEquationVariable.swift
//  Thullium
//
//  Created by Richard on 07.02.2024.
//

import Foundation

///Data struct that holds the info about the variable in equation
struct FormulaEquationVariable:Codable{
    ///Usually greek sign of the variable
    let sign:String
    ///Name of the variable
    let name:String
    ///Unit in which is the variable used. Optional cause i t may not have unit
    let unit:String?
}
