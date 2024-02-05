//
//  ChemistryMenuItemView.swift
//  Thullium
//
//  Created by Richard on 24.09.2023.
//

import SwiftUI

/// Menu item for ``ChemistryView``
struct ChemistryMenuItemView: View {
    
    var text:String
    /// System image string
    var sysIm:String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(.ultraThickMaterial)
            Label(LocalizedStringKey(text), systemImage: sysIm)
                .font(.largeTitle)
                .lineLimit(1)
                .minimumScaleFactor(0.01)
                .padding()
        }
        
    }
}

#Preview {
    ChemistryMenuItemView(text: "periodicTable", sysIm: "flask")
}
