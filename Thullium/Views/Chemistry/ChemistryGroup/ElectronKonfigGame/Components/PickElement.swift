//
//  PickElement.swift
//  Thullium
//
//  Created by Richard on 05.02.2024.
//

import SwiftUI

struct PickElement: View {
    @Binding var rand:[ConfigGameItem]
    @Binding var selected:String
    @Binding var model:ElectronConfigGameModel
    @Binding var status:Bool?
    var body: some View {
        HStack{
            ForEach(rand, id: \.name) { elem in
                VStack{
                    Text(elem.symbol)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(LocalizedStringKey(elem.name))
                        .font(.title2)
                }
                .hoverEffect()
                .lineLimit(1)
                .minimumScaleFactor(0.01)
                .padding()
                .frame(maxWidth: .infinity)
                .overlay(content: {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(selected==elem.name ? Color.blue : Color.primary, lineWidth: 3)
                        .aspectRatio(1.0,contentMode: .fill)
                })
                .onTapGesture {
                    selected = elem.name
                    status = model.checkCurrentGuess(text: selected,with: true)
                    if status!{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            selected = ""
                        }
                    }
                }
               
            }
        }
        
    }
}

#Preview {
    PickElement(rand: .constant([ConfigGameItem(name: "Hydrogen", config: "1s1", configSemantic: "1s1", symbol: "H"),ConfigGameItem(name: "Silicon", config: "1s1", configSemantic: "1s1", symbol: "S"),ConfigGameItem(name: "Nitrogen", config: "1s1", configSemantic: "1s1", symbol: "N")]), selected: .constant("Hydrogen"),model: .constant(ElectronConfigGameModel()), status: .constant(false))
}
