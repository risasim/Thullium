//
//  GamePSetupView.swift
//  Thullium
//
//  Created by Richard on 20.09.2023.
//

import SwiftUI

/// View that creates the setting for ``GameModel``
struct GamePSetupView: View {
    
    var gameModel:GameModel
    @Binding var pop: Bool
    @State var showCategories = true
    @State var showMessage = false
    
    var body: some View {
        ZStack{
            VStack{
                List{
                    Section(header:
                    GSetupLabel(text: "selectCategories", isPresented: $showCategories)
                        .padding(.top, 30)
                    ){
                        if showCategories{
                            GSetupViewList(criteria: gameModel.categories, showMessage: $showMessage)
                        }
                    }
                 //   Section {
                 //       //
                 //   } header: {
                 //       GSetupLabel(text: "selectPeriods", isPresented: .constant(false))
                 //   }
                }
            }
            .alert("categoriesAlert", isPresented: $showMessage) {
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
    
    var criteria:[Category]
    @Binding var showMessage:Bool
    
    var body: some View {
        ForEach(criteria, id: \.name) { cat in
            HStack{
                Text(LocalizedStringKey(cat.name))
                Spacer()
                Image(systemName: cat.selected ? "checkmark.circle":"circle")
            }
            .contentShape(Rectangle())
            .onTapGesture {
               checkTheSelection(cat)
            }
            .animation(.linear(duration: 0.3), value: cat.selected==false)
        }
    }
    
    ///Function that ensures that the game is not started with zero categories to choose from
    func checkTheSelection(_ cat: Category){
        var select:Category = Category(name: "Random", selected: false)
        var counter = 0
        for c in criteria{
            if c.selected==true{
                counter+=1
                select = c
            }
        }
        if counter<2 && cat.name==select.name{
            showMessage.toggle()
        }else{
            cat.selected.toggle()
        }
    }
}

#Preview {
    GSetupViewList(criteria: GameModel().categories, showMessage: .constant(false))
}
