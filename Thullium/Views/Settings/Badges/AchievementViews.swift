//
//  AchievementViews.swift
//  Thullium
//
//  Created by Richard on 22.12.2023.
//

import Foundation
import SwiftUI

struct AchievementViews:View {
    
    @State var achievements = AchievementModel()
    
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(achievements.achievements.achieves.values.sorted(by: >), id: \.self) { ach in
                    AchievementsView(name: ach.name, description: ach.desc, imgName: ach.img)
                        .frame(maxWidth: 350, maxHeight: 450)
                }
            }
        }
    }
}

#Preview {
    AchievementViews()
}
