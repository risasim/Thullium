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
                    GSetupLabel(text: "selectCategories", isPresented: $showCategories)
                        .padding(.top, 30)
                    ){
                        if showCategories{
                            GSetupViewList(criteria: gameModel.categories)
                        }
                    }
                 //   Section {
                 //       //
                 //   } header: {
                 //       GSetupLabel(text: "selectPeriods", isPresented: .constant(false))
                 //   }
//
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

struct GSetupLabel:View {
    
    var text:String
    @Binding var isPresented:Bool
    
    var body: some View {
        Label(LocalizedStringKey(text), systemImage: isPresented ? "chevron.down" : "chevron.up")
            .bold()
            .font(.headline)
            .foregroundStyle(Color.primary)
            .onTapGesture {
                withAnimation(.easeIn) {
                    isPresented.toggle()
                }
            }
    }
}


struct GSetupViewList: View {
    
    var criteria:[Category]
    
    var body: some View {
        ForEach(criteria, id: \.name) { cat in
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

#Preview {
    GSetupViewList(criteria: GameModel().categories)
}
