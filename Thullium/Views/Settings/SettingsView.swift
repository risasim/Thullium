//
//  SettingsView.swift
//  Thullium
//
//  Created by Richard on 17.12.2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20){
// MARK: - General info
                    GroupBox {
                        Divider().padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10){
                            Image(.logo)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(9)
                            Text(LocalizedStringKey("appDescription"))
                                .font(.footnote)
                        }
                    } label: {
                        SettingsLabelView(label: "Thullium", image: "info.circle")
                    }
                    .padding(.top, 10)
// MARK: - Settings
                    GroupBox {
                        Divider().padding(.vertical, 4)
                    } label: {
                        SettingsLabelView(label: "Settings", image: "gear")
                    }
// MARK: - Application info
                    GroupBox(content: {
                        SettingsRowView(label: "Version",description: "1.2")
                        SettingsRowView(label: "Compatibility", description: "iOS 17")
                        SettingsRowView(label: "SwiftUI", description: "6.0")
                        SettingsRowView(label: "Privacy policy",linkLabel: "Link", linkDestination: "https://www.termsfeed.com/live/5fd31393-40dc-45b7-965d-97601764ffd9")
                        SettingsRowView(label: "Developer", description: "Richie")
                        SettingsRowView(label: "Twitter", linkLabel: "@richiesimonik", linkDestination: "twitter.com/richiesimonik")
                        SettingsRowView(label: "Buy me a cofee", linkLabel: "Link", linkDestination:"https://www.buymeacoffee.com/richiesimonik")
                    }, label: {
                        SettingsLabelView(label: "Application", image: "apps.iphone")
                    })
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
