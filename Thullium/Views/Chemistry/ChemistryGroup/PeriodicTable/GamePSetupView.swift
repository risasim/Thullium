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
                    Label("selectCategories", systemImage: showCategories ? "chevron.down" : "chevron.up")
                        .bold()
                        .font(.headline)
                        .foregroundStyle(Color.primary)
                        .padding(.top, 30)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                showCategories.toggle()
                            }
                        }
                    ){
                        if showCategories{
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
                                .animation(.linear(duration: 0.3), value: cat.selected==false)
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
