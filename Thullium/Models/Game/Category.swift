//
//  Category.swift
//  Thullium
//
//  Created by Richard on 22.10.2023.
//

import Foundation

/// Object created
@Observable
class Category{
    /// Name of category
    var name:String
    /// Determining if this category should be added to ``GameData/namesReady``
    var selected: Bool
    
    init(name: String, selected: Bool) {
        self.name = name
        self.selected = selected
    }
}
