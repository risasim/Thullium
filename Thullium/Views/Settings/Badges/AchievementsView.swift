//
//  AchievementsView.swift
//  Thullium
//
//  Created by Richard on 22.12.2023.
//

import Foundation
import SwiftUI

struct AchievementsView:View {
    
    var ach:Achievement
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .environment(\.colorScheme, .dark)
                .foregroundStyle(.ultraThinMaterial)
            VStack{
                BadgeView(img: ach.img,grad: ach.grad)
                Text(LocalizedStringKey(ach.name))
                    .font(.title3)
                    .bold()
                if(ach.date != nil){
                    Text(LocalizedStringKey("achs.achieved"))+Text(ach.date!, format: .dateTime.day().month().year())
                        .bold()
                }
                Text(LocalizedStringKey(ach.desc))
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .padding(10)
            }
            
        }
        .padding()
    }
}

#Preview {
    AchievementsView(ach: Achievement(name: "achs.MendeleevAch", desc: "achs.MendeleevAchDesc", img: "Genius", date: Date.now))
}
