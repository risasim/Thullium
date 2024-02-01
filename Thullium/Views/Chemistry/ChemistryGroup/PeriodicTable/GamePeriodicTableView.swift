//
//  GamePeriodicTableView.swift
//  FlashCards
//
//  Created by Richard on 18.09.2023.
//

import SwiftUI
import TipKit
//import ConfettiSwiftUI


/// View of ``PeriodicTableView`` that provides ``GameModel`` as parameter
struct GamePeriodicTableView: View {
    @AppStorage("numberOfAttemps") private var numberOfAttemps:Int = 5
    @Binding var gameModel:GameModel
    
    var body: some View {
        ZStack{
            PeriodicTableView(gameModel: gameModel)
                .overlay {
                    VStack{
                        HStack{
                            Spacer()
                            Text(LocalizedStringKey(JSONtoSwiftConverted.eData[JSONtoSwiftConverted.eData.firstIndex(where: {$0.name == gameModel.gData.currentGuess})!].name))
                                .bold()
                                .font(.title)
                                .padding()
                            Button {
                                gameModel.gData.numAt=6
                            } label: {
                                Image(systemName: "lightbulb.max")
                                    .popoverTip(GameHint())
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                }
            if gameModel.gData.showAlert{
                CustomAlertView(model: $gameModel)
            }
        }
    }
}

#Preview {
    GamePeriodicTableView(gameModel: .constant(GameModel()))
        .environment(\.locale, .init(identifier: "cs"))
        .task {
            try? await Tips.configure()
        }
}


/// View that shows up after the game has ended
struct CustomAlertView:View {
    @AppStorage("gameConfetti") var gameConfetti:Bool = true
    @Binding var model:GameModel
    @State var counter = 0
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                VStack{
                    Image(systemName: "trophy")
                        .font(.system(size: 100))
                       // .confettiCannon(counter: $counter, repetitions: 4, repetitionInterval: 1.2)
                        .padding(5)
                    Text("congratsOnCompleteGame")
                        .bold()
                        .font(.title)
                        .multilineTextAlignment(.center)
                    Button("playAgain") {
                        model.restartGame()
                        model.gData.showAlert.toggle()
                    }
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
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
        .onAppear(perform: {
            if gameConfetti{
                counter+=1
            }
        })
        .background(.ultraThinMaterial)
    }
}

#Preview{
    CustomAlertView(model: .constant(GameModel()))
        .environment(\.locale, .init(identifier: "cs"))
}
