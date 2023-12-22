//
//  BadgeView.swift
//  Thullium
//
//  Created by Richard on 22.12.2023.
//

import SwiftUI

struct BadgeView: View {
    
    var img:String
    
    var body: some View {
        Image(img)
            .resizable()
            .scaledToFit()
            .scaleEffect(0.6)
            .background {
                BadgeBackgroundView()
            }
    }
}

#Preview {
    BadgeView(img: "Mendeleev")
}
