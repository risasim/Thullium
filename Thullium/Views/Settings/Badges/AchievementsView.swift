//
//  AchievementsView.swift
//  Thullium
//
//  Created by Richard on 22.12.2023.
//

import Foundation
import SwiftUI

struct AchievementsView:View {
    
    var name: String
    var description:String
    var imgName:String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .environment(\.colorScheme, .dark)
                .foregroundStyle(.ultraThinMaterial)
            VStack{
                BadgeView(img: imgName)
                Text(LocalizedStringKey(name))
                    .font(.title2)
                    .bold()
                Text(LocalizedStringKey(description))
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding(10)
            }
            
        }
        .padding()
    }
}

#Preview {
    AchievementsView(name: "achs.MendeleevAch", description: "achs.MendeleevAchDesc", imgName: "Mendeleev")
}
