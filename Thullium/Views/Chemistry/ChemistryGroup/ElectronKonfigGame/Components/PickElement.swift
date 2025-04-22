//
//  PickElement.swift
//  Thullium
//
//  Created by Richard on 05.02.2024.
//

import SwiftUI

struct PickElement: View {
    @Binding var rand:[ConfigGameItem]
    @Binding var model:ElectronConfigGameModel
    var body: some View {
        HStack{
            ForEach(rand, id: \.name) { elem in
                Button(action: {
                    model.selectElement(elementName: elem.name)
                }, label: {
                    VStack{
                        Text(elem.symbol)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(LocalizedStringKey(elem.name))
                            .font(.title2)
                    }
                    .foregroundStyle(Color.primary)
                    .hoverEffect()
                    .lineLimit(1)
                    .padding()
                 //   .minimumScaleFactor(0.01)
                })
                .background{
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(model.selected==elem.name ? Color.blue : Color.primary, lineWidth: 3)
                      //  .aspectRatio(1.0,contentMode: .fill)
                }
                .frame(maxWidth: .infinity,maxHeight: 700)
            }
        }
        .padding(.top,15)
        
    }
}

#Preview {
    PickElement(rand: .constant([ConfigGameItem(name: "Hydrogen", config: "1s1", configSemantic: "1s1", symbol: "H"),ConfigGameItem(name: "Silicon", config: "1s1", configSemantic: "1s1", symbol: "S"),ConfigGameItem(name: "Nitrogen", config: "1s1", configSemantic: "1s1", symbol: "N")]),model: .constant(ElectronConfigGameModel()))
}


#Preview {
    NavigationStack{
        ElectronConfigGameView()
            .environment(\.locale, .init(identifier: "cs"))
    }
}

