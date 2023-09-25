//
//  ChemistryView.swift
//  FlashCards
//
//  Created by Richard on 14.09.2023.
//

import SwiftUI
import SwiftData

struct ChemistryView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [ElementsData]
    @State var gameModel = GameModel()
    @State var popUp = false
    
    var body: some View {
        VStack{
            NavigationStack{
                NavigationLink {
                    ActualPeriodicTable()
                } label: {
                    ChemistryMenuItemView(text: "periodicTable", sysIm: "flask")
                }
                .padding()
                ZStack{
                    HStack(spacing: 0){
                        NavigationLink {
                            GamePeriodicTableView(gameModel: $gameModel)
                        } label: {
                            Label(LocalizedStringKey("game"), systemImage: "arcade.stick")
                                .font(.largeTitle)
                                .frame(maxWidth: .infinity,maxHeight:.infinity)
                                .padding(0)
                                .background(.ultraThickMaterial)
                                .cornerRadius(20, corners: [.topLeft, .bottomLeft])
                        }
                        Divider()
                            .frame(width: 2)
                            .overlay(.primary)
                        Button(action: {
                            popUp.toggle()
                        }, label: {
                            Label(LocalizedStringKey("gameSettings"), systemImage: "gear")
                                .font(.headline)
                                .frame(maxWidth: .infinity,maxHeight:.infinity)
                                .background(.ultraThickMaterial)
                                .cornerRadius(20, corners: [.topRight, .bottomRight])
                        })
                    }
                    .padding()
                    
                }
            }
            .tint(Color.primary)
        }
        .sheet(isPresented: $popUp, content: {
            GamePSetupView(gameModel: gameModel, pop: $popUp)
                .onDisappear(perform: {
                    gameModel.startGame()
                })
        })
    }
}

#Preview {
    ChemistryView()
        .environment(\.locale, .init(identifier: "cs"))
}
