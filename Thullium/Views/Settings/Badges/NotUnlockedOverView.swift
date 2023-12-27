//
//  NotUnlockedOverView.swift
//  Thullium
//
//  Created by Richard on 22.12.2023.
//

import SwiftUI

struct NotUnlockedOverView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .environment(\.colorScheme, .dark)
                .foregroundStyle(.thinMaterial)
            VStack{
                Image(systemName: "lock.fill")
                    .font(.largeTitle)
                Text(LocalizedStringKey("achs.notUnlocked"))
                    .font(.title3)
                    .padding(.top)
                    .multilineTextAlignment(.center)
            }
            .foregroundColor(.white)
        }
    }
}

#Preview {
    NotUnlockedOverView()
}
