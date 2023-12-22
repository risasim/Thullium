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
                    if ach.achieved{
                        AchievementsView(name: ach.name, description: ach.desc, imgName: ach.img)
                            .frame(maxWidth: 250, maxHeight: 350)
                    }else{
                        AchievementsView(name: ach.name, description: ach.desc, imgName: ach.img)
                            .frame(maxWidth: 250, maxHeight: 350)
                            .overlay{
                                NotUnlockedOverView()
                                    .padding()
                                    .frame(maxWidth: 250, maxHeight: 350)
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    AchievementViews()
}
