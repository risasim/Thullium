//
//  GamePeriodicTableView.swift
//  FlashCards
//
//  Created by Richard on 18.09.2023.
//

import SwiftUI

struct GamePeriodicTableView: View {
    
    @Binding var gameModel:GameModel
    //@State var alert = false
    
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
            if gameModel.showAlert{
                CustomAlertView(model: $gameModel)
            }
        }
    }
}

#Preview {
    GamePeriodicTableView(gameModel: .constant(GameModel()))
        .environment(\.locale, .init(identifier: "cs"))
}


struct CustomAlertView:View {
    
    @Binding var model:GameModel
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                VStack{
                    Image(systemName: "trophy")
                        .font(.system(size: 100))
                    Text("congratsOnCompleteGame")
                        .bold()
                        .font(.title)
                        .multilineTextAlignment(.center)
                    Button("playAgain") {
                        model.restartGame()
                        model.showAlert.toggle()
                    }
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .padding()
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                .foregroundStyle(Color.black)
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

#Preview{
    CustomAlertView(model: .constant(GameModel()))
        .environment(\.locale, .init(identifier: "cs"))
}
