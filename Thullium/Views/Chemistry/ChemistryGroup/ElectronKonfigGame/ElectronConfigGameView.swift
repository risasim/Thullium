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
    @State var selected = ""
    
    @FocusState var focusFieldText:Bool
    
    var body: some View {
        ZStack {
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
                if showNobleGases && playNames{
                    Spacer()
                    PickElement(rand: $model.elemSet,selected: $selected, model: $model,status: $status)
                        .padding()
                    Spacer()
                    Spacer(minLength: 400)
                }else{
                    ElectronConfigGameTextField(model: $model, status: $status, focusFieldText: $focusFieldText)
                }
                Spacer()
            }
            .padding()
            .toolbar(content: {
                ToolbarItem{
                    Text("\(model.currentGuess+1) out of \(model.gameArr.count)")
                }
        })
            .onChange(of: model.showAlert) { oldValue, newValue in
                focusFieldText = false
                status = nil
            }
            if model.showAlert{
                CustomAlertView(model: $model)
            }
        }
    }
}

#Preview {
    NavigationStack{
        ElectronConfigGameView()
            .environment(\.locale, .init(identifier: "cs"))
    }
}
