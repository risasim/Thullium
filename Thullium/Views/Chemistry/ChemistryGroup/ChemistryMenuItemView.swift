//
//  ChemistryMenuItemView.swift
//  Thullium
//
//  Created by Richard on 24.09.2023.
//

import SwiftUI

struct ChemistryMenuItemView: View {
    
    var text:String
    var sysIm:String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(.ultraThickMaterial)
            Label(LocalizedStringKey(text), systemImage: sysIm)
                .font(.largeTitle)
        }
        
    }
}

#Preview {
    ChemistryMenuItemView(text: "periodicTable", sysIm: "flask")
}
