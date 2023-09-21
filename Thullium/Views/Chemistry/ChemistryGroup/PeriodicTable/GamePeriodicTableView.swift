//
//  GamePeriodicTableView.swift
//  FlashCards
//
//  Created by Richard on 18.09.2023.
//

import SwiftUI

struct GamePeriodicTableView: View {
    
    @State var gameModel = GameModel()
    @State var alert = false
    
    var body: some View {
        ZStack{
            PeriodicTableView(gameModel: gameModel)
                .overlay {
                    VStack{
                        HStack{
                            Spacer()
                            Text(LocalizedStringKey(JSONtoSwiftDataconverter().eData[JSONtoSwiftDataconverter().eData.firstIndex(where: {$0.name == gameModel.currentGuess})!].name))
                                .bold()
                                .font(.title)
                                .padding()
                            Button {
                                gameModel.numberOfAttempts=6
                            } label: {
                                Image(systemName: "lightbulb.max")
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                }
            if alert{
                CustomAlertView(alert: $alert)
            }
        }
    }
}

#Preview {
    GamePeriodicTableView()
        .environment(\.locale, .init(identifier: "cs"))
}


struct CustomAlertView:View {
    
    @Binding var alert:Bool
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                VStack{
                    Image(systemName: "trophy")
                        .font(.largeTitle)
                    Text("Congratulations on completing the game!")
                    Button("Play again") {
                        alert.toggle()
                    }
                    .foregroundStyle(Color.white)
                    .padding()
                    .buttonBorderShape(.capsule)
                    .background(Color.blue)
                }
                .foregroundStyle(Color.black)
                .padding()
                .background {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .fill(Color.white)
                }
                Spacer()
            }
            Spacer()
        }
        .background(.ultraThinMaterial)
    }
}
