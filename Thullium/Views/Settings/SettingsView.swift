//
//  SettingsView.swift
//  Thullium
//
//  Created by Richard on 17.12.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("showDetailsInSettigs") private var showDetails:Bool = false
    @AppStorage("numberOfAttemps") private var numberOfAttemps:Int = 5
    @AppStorage("gameConfetti") private var gameConfetti:Bool = true
    @AppStorage("scrollingTable") private var scrollingTable:Bool = true
    @State var achs = AchievementModel()
    @Binding var closeButton:Bool
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20){
// MARK: - Achievements
                    GroupBox {
                        AchievementViews(achievements: $achs)
                    } label: {
                        SettingsLabelView(label: "achs.name", image: "trophy")
                    }
                    // MARK: - Settings
                    // numOfAttemps+=1
                    GroupBox {
                        HStack{
                            Toggle("set.gameConfetti", isOn: $gameConfetti)
#if os(visionOS)
                                .foregroundColor(.primary)
#else
                                .foregroundColor(.gray)
#endif
                        }
                        HStack{
                            Toggle("set.scrollingTable", isOn: $scrollingTable)
#if os(visionOS)
                                .foregroundColor(.primary)
#else
                                .foregroundColor(.gray)
#endif
                        }
                        Divider().padding(.vertical, 4)
                        HStack{
                            Stepper(LocalizedStringKey("set.numOfAttemps \(numberOfAttemps)"), value: $numberOfAttemps,in:3...20)
#if os(visionOS)
                                .foregroundColor(.primary)
#else
                                .foregroundColor(.gray)
#endif
                        }
                        Divider().padding(.vertical, 4)
                        HStack{
                            Toggle("set.gameShowDetails", isOn: $showDetails)
#if os(visionOS)
                                .foregroundColor(.primary)
#else
                                .foregroundColor(.gray)
#endif
                        }
                    } label: {
                        SettingsLabelView(label: "set.settings", image: "gear")
                    }
// MARK: - Application info
                    GroupBox(content: {
                        Divider().padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10){
                            Image(.logo)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(9)
                            Text(LocalizedStringKey("set.appDescription"))
                                .font(.footnote)
                        }
                        SettingsRowView(label: "set.version",description: "1.2")
                        SettingsRowView(label: "set.compatibility", description: "iOS 17")
                        SettingsRowView(label: "SwiftUI", description: "6.0")
                        SettingsRowView(label: "set.privacyPolicy",linkLabel: "Link", linkDestination: "www.termsfeed.com/live/5fd31393-40dc-45b7-965d-97601764ffd9")
                        SettingsRowView(label: "set.developer", description: "Richie")
                        SettingsRowView(label: "Twitter", linkLabel: "@richiesimonik", linkDestination: "twitter.com/richiesimonik")
                        SettingsRowView(label: "If you like this app", linkLabel: "Buy me a coffee", linkDestination:"www.buymeacoffee.com/richiesimonik")
                    }, label: {
                        SettingsLabelView(label: "set.application", image: "apps.iphone")
                    })
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("set.settings")
            #if os(visionOS)
            .toolbar{
                CloseButtonView(popUp: $closeButton)
            }
            #endif
        }
    }
}

#Preview {
    SettingsView(closeButton: .constant(false))
}

#Preview{
    SettingsView(closeButton: .constant(true))
        .environment(\.locale, .init(identifier: "cs"))
}
