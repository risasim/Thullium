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
        Text("exploreTableTip")
    }
    var message: Text? {
        Text("exploreTableTipText")
    }
    var image: Image? {
        Image(systemName: "hand.tap")
    }
}

struct GameHint:Tip{
    var title: Text{
        Text("gameHintTip")
    }
    var message: Text? {
        Text("gameHintTipText")
    }
    var image: Image? {
        Image(systemName: "lightbulb.max.fill")
    }
    
}
