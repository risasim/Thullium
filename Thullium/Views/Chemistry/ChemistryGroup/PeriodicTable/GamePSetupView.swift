//
//  GamePSetupView.swift
//  Thullium
//
//  Created by Richard on 20.09.2023.
//

import SwiftUI

struct GamePSetupView: View {
    
    var gameModel:GameModel
    
    var body: some View {
        VStack{
            List{
                ForEach(gameModel.categories, id: \.name) { cat in
                    HStack{
                        Text(LocalizedStringKey(cat.name))
                        Spacer()
                        Image(systemName: cat.selected ? "checkmark.circle":"circle")
                    }
                    .onTapGesture {
                        gameModel.toggleCategory(n: cat.name)
                    }
                }
            }
        }
    }
}

#Preview {
    GamePSetupView(gameModel: GameModel())
}
