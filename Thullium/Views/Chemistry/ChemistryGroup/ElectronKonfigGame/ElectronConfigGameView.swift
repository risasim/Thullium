//
//  ElectronConfigGameView.swift
//  Thullium
//
//  Created by Richard on 04.02.2024.
//

import SwiftUI

struct ElectronConfigGameView: View {
    @AppStorage("showNobleGases") var showNobleGases = true
    @AppStorage("playNames") var gameWithPickingRightElementFromThree  = true
    
    @State var model = ElectronConfigGameModel()
   
    
    @FocusState var focusFieldText:Bool
    
    var body: some View {
        ZStack {
            VStack{
                if gameWithPickingRightElementFromThree{
                    Text(LocalizedStringKey(model.currentItem.configSemantic))
                        .font(.title)
                        .bold()
                        .padding()
                }else{
                    InfoSign(symbol: model.currentItem.symbol, name: model.currentItem.name)
                        .padding(.bottom)
                }
                ElectronConfigStatusBar(model: $model)
                if showNobleGases && gameWithPickingRightElementFromThree{
                    Spacer()
                    PickElement(rand: $model.elemSet,model: $model)
                        .padding()
                    Spacer(minLength: 400)
                }else{
                    ElectronConfigGameTextField(model: $model, focusFieldText: $focusFieldText)
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
