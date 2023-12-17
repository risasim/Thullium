//
//  SettingsLabelView.swift
//  Thullium
//
//  Created by Richard on 17.12.2023.
//

import SwiftUI

struct SettingsLabelView: View {
    
    var label: String
    var image: String
    
    var body: some View {
        HStack{
            Text(label.uppercased())
            Spacer()
            Image(systemName: image)
        }
        .fontWeight(.bold)
    }
}

#Preview {
    SettingsLabelView(label: "Application", image: "iphone")
}
