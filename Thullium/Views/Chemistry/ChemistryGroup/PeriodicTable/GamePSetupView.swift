//
//  GamePSetupView.swift
//  Thullium
//
//  Created by Richard on 20.09.2023.
//

import SwiftUI

/// View that creates the setting for ``GameModel``
struct GamePSetupView: View {
    
    @State var gameModel:GameModel
    @Binding var pop: Bool
    @State var showCategories = true
    
    var body: some View {
        ZStack{
            VStack{
                List{
                    Section(header:
                    GSetupLabel(text: "selectCategories", isPresented: $showCategories)
                        .padding(.top, 30)
                        .listRowInsets(.init(top: 20, leading: 0, bottom: 5, trailing: 0))
                    ){
                        if showCategories{
                            GSetupViewList(model: $gameModel.setupModel)
                        }
                    }
                    if showCategories{
                        HStack {
                            Button(LocalizedStringKey("randCategories")) {
                                gameModel.setupModel.randomSelection()
                            }
                            Spacer()
                            Button("selectAllCategories") {
                                gameModel.setupModel.selectAll()
                            }
                        }
                        .listRowBackground(Color.clear)
                        .font(.title3)
                        .buttonStyle(.borderedProminent)
                        //.foregroundColor(.primary)
                        .listRowInsets(.init(top: 10, leading: 5, bottom: 10, trailing: 5))
                    }
                }
                .padding(0)
                .listSectionSpacing(5)
            }
            .background(.gray)
            .alert("categoriesAlert", isPresented: $gameModel.setupModel.showMessage) {
                Button("OK", role: .cancel) { }
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


/// Label used for presenting optional category in ``GamePSetupView``
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


/// List with all options presented with ``GSetupLabel``
struct GSetupViewList: View {
    
    @Binding var model:GSetupModel
    
    var body: some View {
        ForEach(model.criteria, id: \.name) { cat in
            HStack{
                Text(LocalizedStringKey(cat.name))
                Spacer()
                Image(systemName: cat.selected ? "checkmark.circle":"circle")
            }
            .contentShape(Rectangle())
            .onTapGesture {
                model.checkTheSelection(cat)
            }
            .animation(.linear(duration: 0.3), value: cat.selected==false)
        }
    }
}

#Preview {
    GSetupViewList(model: .constant(GSetupModel()))
}
