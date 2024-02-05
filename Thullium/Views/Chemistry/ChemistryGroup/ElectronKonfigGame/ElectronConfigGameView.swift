//
//  ElectronConfigGameView.swift
//  Thullium
//
//  Created by Richard on 04.02.2024.
//

import SwiftUI

struct ElectronConfigGameView: View {
    @FocusState private var isFocused: Bool
    @AppStorage("showNobleGases") var showNobleGases = true
    @AppStorage("playNames") var playNames  = true
    @State var model = ElectronConfigGameModel()
    @State var text = ""
    @State var status:Bool? = nil
    var body: some View {
        VStack{
            if playNames{
                Text(LocalizedStringKey(model.currentItem.configSemantic))
                    .font(.title)
                    .bold()
                    .padding()
            }else{
                InfoSign(symbol: model.currentItem.symbol, name: model.currentItem.name)
                    .padding(.bottom)
            }
            ElectronConfigStatusBar(stat: $status)
            TextField(LocalizedStringKey("Text Field"), text: $text, prompt: Text(playNames ? "electronConfigGame.textFieldName": "electronConfigGame.textField"))
                .focused($isFocused)
                .onSubmit {
                    status = model.checkCurrentGuess(text: text)
                    if status!{
                        text = ""
                    }
                }
                .padding()
                .background{
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .foregroundStyle(.ultraThinMaterial)
                }
            Spacer()
        }
        .padding()
        .toolbar(content: {
            ToolbarItem{
                Text("\(model.currentGuess) out of \(model.gameArr.count)")
            }
        })
    }
}

#Preview {
    NavigationStack{
        ElectronConfigGameView()
    }
}
