//
//  ChemistryView.swift
//  FlashCards
//
//  Created by Richard on 14.09.2023.
//

import SwiftUI
import SwiftData


/// Main View for chemistry themed content
struct ChemistryView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [ElementsData]
    @State var gameModel = GameModel()
    @State var popUp = false
    @State var settingsUp = false
    
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink {
                    ActualPeriodicTable()
                } label: {
                    ChemistryMenuItemView(text: "periodicTable", sysIm: "flask")
                }
                .buttonStyle(.plain)
                .padding()
                
                HStack(spacing: 0){
                    NavigationLink {
                        GamePeriodicTableView(gameModel: $gameModel)
                            .onAppear(perform: {
                                gameModel.startGame()
                            })
                    } label: {
                        Label(LocalizedStringKey("game"), systemImage: "arcade.stick")
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity,maxHeight:.infinity)
                            .padding(0)
                            .background(.ultraThickMaterial)
                            .cornerRadius(20, corners: [.topLeft, .bottomLeft])
                        
                    }
                    .buttonStyle(.plain)
                    Divider()
                        .frame(width: 2)
                        .overlay(.primary)
                    Button(action: {
                        popUp.toggle()
                    }, label: {
                        Label(LocalizedStringKey("gameConfiguration"), systemImage: "checklist")
                            .font(.headline)
                            .frame(maxWidth: .infinity,maxHeight:.infinity)
                            .background(.ultraThickMaterial)
                            .cornerRadius(20, corners: [.topRight, .bottomRight])
                    })
                    .buttonStyle(.plain)
                }
                .padding()
            }
            .tint(Color.primary)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {settingsUp.toggle()}, label: {
                        Image(systemName: "gear")
                            .font(.title)
                    })
                }
            })
        }
        .sheet(isPresented: $popUp, content: {
            #if os(visionOS)
            GamePSetupView(gameModel: gameModel, pop: $popUp)
                .onDisappear(perform: {
                    gameModel.startGame()
                })
            #else
            GamePSetupView(gameModel: gameModel, pop: $popUp)
                .onDisappear(perform: {
                    gameModel.startGame()
                })
            #endif
        })
        .sheet(isPresented: $settingsUp, content: {
            #if os(visionOS)
                SettingsView(closeButton: $settingsUp)
            #else
            ZStack{
                SettingsView(closeButton: $settingsUp)
                CloseButtonView(popUp: $settingsUp)
            }
            #endif
        })
        
    }
}

#Preview {
    ChemistryView()
        //.environment(\.locale, .init(identifier: "cs"))
}
