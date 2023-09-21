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
                    Label("periodicTable", systemImage: "flask")
                        .font(.title)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .overlay(content: {
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .stroke(Color.blue, lineWidth: 5)
                        })
                }
                .padding()
                NavigationLink {
                   GamePeriodicTableView()
                } label: {
                    HStack {
                        Label("game", systemImage: "arcade.stick")
                            .font(.title)
                        Spacer()
                        Button(action: {
                            popUp = true
                        }, label: {
                            Label(LocalizedStringKey("gameSettings"), systemImage: "gear")
                        })
                        
                    }
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .overlay(content: {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .stroke(Color.blue, lineWidth: 5)
                    })
                }
                .padding()
            }
            .tint(Color.primary)
        }
        .sheet(isPresented: $popUp, content: {
            GamePSetupView(gameModel: gameModel, pop: $popUp)
        })
    }
}

#Preview {
    ChemistryView()
        .environment(\.locale, .init(identifier: "cs"))
}
