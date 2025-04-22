//
//  ElectronConfigGameTextField.swift
//  Thullium
//
//  Created by Richard on 05.02.2024.
//

import SwiftUI

///Text field for the ElectrongConfig game in the mode where the user is supposed to write the correct configuration 
struct ElectronConfigGameTextField:View {
    @AppStorage("playNames") var playNames  = true
    
    @Binding var model:ElectronConfigGameModel
    @State var text = ""
    
    @FocusState.Binding var focusFieldText:Bool
    
    var body: some View {
        HStack{
            TextField(LocalizedStringKey("Text Field"), text: $text, prompt: Text(playNames ? "electronConfigGame.textFieldName": "electronConfigGame.textField"))
                .focused($focusFieldText)
                .onSubmit {
                    self.focusFieldText=true
                    self.model.selectElement(elementName: text)
                    self.text=""
                    
                }
                .padding()
                .background{
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .foregroundStyle(.ultraThinMaterial)
            }
            Button {
                model.selectElement(elementName: text)
                if model.status!{
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
