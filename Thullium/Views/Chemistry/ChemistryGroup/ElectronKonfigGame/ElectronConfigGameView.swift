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
    
    @FocusState private var focusFieldText:Bool
    
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
            HStack{
                TextField(LocalizedStringKey("Text Field"), text: $text, prompt: Text(playNames ? "electronConfigGame.textFieldName": "electronConfigGame.textField"))
                    .focused($focusFieldText)
                    .onSubmit {
                        focusFieldText=true
                        status = model.checkCurrentGuess(text: text)
                        if status!{
                            text = ""
                        }else{
#if os(iOS)
                            feedbackGenerator.notificationOccurred(.success)
#endif
                        }
                    }
                    .padding()
                    .background{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .foregroundStyle(.ultraThinMaterial)
                }
                Button {
                    status = model.checkCurrentGuess(text: text)
                    if status!{
                        text = ""
                    }
                } label: {
                    Text("Submit")
                        .padding()
                }
                .background{
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .foregroundStyle(.ultraThinMaterial)
                }
                .buttonStyle(.plain)

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
