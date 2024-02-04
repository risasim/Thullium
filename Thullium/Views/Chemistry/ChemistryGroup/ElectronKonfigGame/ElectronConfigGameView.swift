//
//  ElectronConfigGameView.swift
//  Thullium
//
//  Created by Richard on 04.02.2024.
//

import SwiftUI

struct ElectronConfigGameView: View {
    @AppStorage("showNobleGases") var showNobleGases = true
    @AppStorage("playNames") var playNames  = true
    @State var model = ElectronConfigGameModel()
    @State var text = ""
    @State var status:Bool? = nil
    var body: some View {
        VStack{
            Text(LocalizedStringKey(model.currentItem.name))
            ElectronConfigStatusBar(stat: $status)
            TextField(LocalizedStringKey("Electron config"), text: $text, prompt: Text("electronConfigGame.textField"))
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
