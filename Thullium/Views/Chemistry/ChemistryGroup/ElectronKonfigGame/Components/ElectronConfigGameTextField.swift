//
//  ElectronConfigGameTextField.swift
//  Thullium
//
//  Created by Richard on 05.02.2024.
//

import SwiftUI

struct ElectronConfigGameTextField:View {
    @AppStorage("playNames") var playNames  = true
    
    @Binding var model:ElectronConfigGameModel
    @Binding var status: Bool?
    @State var text = ""
    
    @FocusState.Binding var focusFieldText:Bool
    
    var body: some View {
        HStack{
            TextField(LocalizedStringKey("Text Field"), text: $text, prompt: Text(playNames ? "electronConfigGame.textFieldName": "electronConfigGame.textField"))
                .focused($focusFieldText)
                .onSubmit {
                    focusFieldText=true
                    status = model.checkCurrentGuess(text: text)
                    if status!{
                        text = ""
                        #if os(iOS)
                        feedbackGenerator.notificationOccurred(.success)
                        #endif
                    }else{
#if os(iOS)
                        feedbackGenerator.notificationOccurred(.error)
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
    }
}

//#Preview{
//    ElectronConfigGameTextField(model: .constant(ElectronConfigGameModel()), status: .constant(true), focusFieldText: $focus)
//}
