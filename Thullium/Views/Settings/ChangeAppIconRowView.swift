//
//  ChangeAppIconRowView.swift
//  Thullium
//
//  Created by Richard on 07.09.2024.
//

import SwiftUI

struct ChangeAppIconRowView: View {
    
    @StateObject var appIconVM:ChangeAppIconViewModel
    var appIcon: AppIcon
    
    var body: some View {
        HStack(spacing: 16) {
            Image(uiImage: appIcon.preview)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .cornerRadius(12)
            Text(LocalizedStringKey(appIcon.description))
                .font(.subheadline)
            Spacer()
            Image(systemName: appIconVM.selectedAppIcon == appIcon ? "checkmark.square.fill" : "square")
        }
        .padding(EdgeInsets(top: 14, leading: 16, bottom: 14, trailing: 16))
        .background(.thinMaterial)
        .cornerRadius(20)
        .onTapGesture {
            withAnimation {
                appIconVM.updateAppIcon(to: appIcon)
            }
        }
    }
}

#Preview {
    ChangeAppIconRowView(appIconVM:ChangeAppIconViewModel(), appIcon: AppIcon.primary)
}

