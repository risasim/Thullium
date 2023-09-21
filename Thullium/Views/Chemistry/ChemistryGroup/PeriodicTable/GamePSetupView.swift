//
//  GamePSetupView.swift
//  Thullium
//
//  Created by Richard on 20.09.2023.
//

import SwiftUI

struct GamePSetupView: View {
    
    var gameModel:GameModel
    @Binding var pop: Bool
    @State var showCategories = true
    
    var body: some View {
        ZStack{
            VStack{
                List{
                    Section(header: 
                        Text("selectCategories")
                            .bold()
                            .font(.headline)
                            .foregroundStyle(Color.primary)
                            .padding(.top)){
                        ForEach(gameModel.categories, id: \.name) { cat in
                            HStack{
                                Text(LocalizedStringKey(cat.name))
                                Spacer()
                                Image(systemName: cat.selected ? "checkmark.circle":"circle")
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                cat.selected.toggle()
                            }
                        }
                    }
                }
            }
            CloseButtonView(popUp: $pop)
        }
    }
}

#Preview {
    GamePSetupView(gameModel: GameModel(),pop: .constant(true))
}

#Preview{
    GamePSetupView(gameModel: GameModel(), pop: .constant(true))
        .environment(\.locale, .init(identifier: "cs"))
}
