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
                        Button(action: {print("heelo")}, label: {
                            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
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
    }
}

#Preview {
    ChemistryView()
        .environment(\.locale, .init(identifier: "cs"))
}
