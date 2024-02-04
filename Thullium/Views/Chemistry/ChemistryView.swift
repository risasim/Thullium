//
//  ChemistryView.swift
//  FlashCards
//
//  Created by Richard on 14.09.2023.
//

import SwiftUI
import SwiftData


/// Main View for chemistry themed content
struct ChemistryView: View {
    
    var body: some View {
        TabView {
            ChemistryMenu()
                .tabItem {
                    Label("menu.periodictable", systemImage: "tablecells")
                }
            FormulasView()
                .tabItem {
                    Label("menu.formulas", systemImage: "function")
                }
        }
        
    }
}

#Preview {
    ChemistryView()
        //.environment(\.locale, .init(identifier: "cs"))
}
