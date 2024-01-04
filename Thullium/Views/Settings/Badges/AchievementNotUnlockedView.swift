//
//  AchievementNotUnlockedView.swift
//  Thullium
//
//  Created by Richard on 22.12.2023.
//

import SwiftUI

struct AchievementNotUnlockedView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .environment(\.colorScheme, .dark)
            .foregroundStyle(.ultraThinMaterial)
            .overlay {
                Image(systemName: "lock.fill")
            }
    }
}

#Preview {
    AchievementNotUnlockedView()
}
