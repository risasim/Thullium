//
//  TipKitViews.swift
//  Thullium
//
//  Created by Richard on 17.12.2023.
//

import Foundation
import SwiftUI
import TipKit

// MARK: - Periodic table
struct PeriodicTableExploreTip: Tip {
    var title: Text {
        Text("tip.exploreTable")
    }
    var message: Text? {
        Text("tip.exploreTableText")
    }
    var image: Image? {
        Image(systemName: "hand.tap")
    }
}

struct GameHint:Tip{
    var title: Text{
        Text("tip.gameHint")
    }
    var message: Text? {
        Text("tip.gameHintText")
    }
    var image: Image? {
        Image(systemName: "lightbulb.max.fill")
    }
    
}
