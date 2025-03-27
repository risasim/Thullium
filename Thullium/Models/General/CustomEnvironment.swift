//
//  CustomEnvironment.swift
//  Thullium
//
//  Created by Richard Šimoník on 15.11.2024.
//
import Foundation
import SwiftUI
import UIKit

private struct CurrentScreenWidth:EnvironmentKey{
    static let defaultValue:CGFloat = 0.0
}

private struct CurrentScreenHeight:EnvironmentKey{
    static let defaultValue:CGFloat = 0.0
}

extension EnvironmentValues{
    var currentScreenWidth:CGFloat{
        get{self[CurrentScreenWidth.self]}
        set{self[CurrentScreenWidth.self] = newValue}
    }
    var currentScreenHeight:CGFloat{
        get{self[CurrentScreenHeight.self]}
        set{self[CurrentScreenHeight.self] = newValue}
    }
}
