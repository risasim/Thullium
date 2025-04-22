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
                    .padding()
                    .hoverEffect()
                    .lineLimit(1)
                 //   .minimumScaleFactor(0.01)
                })
                #if !os(visionOS)
                .background{
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(model.selected==elem.name ? Color.blue : Color.primary, lineWidth: 3)
                      //  .aspectRatio(1.0,contentMode: .fill)
                }
                #else
                .padding()
                #endif
                .frame(maxWidth: .infinity,maxHeight: 700)
                .buttonBorderShape(.roundedRectangle(radius: 25))

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

