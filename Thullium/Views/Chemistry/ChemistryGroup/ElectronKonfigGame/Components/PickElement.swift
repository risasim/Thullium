//
//  PickElement.swift
//  Thullium
//
//  Created by Richard on 05.02.2024.
//

import SwiftUI

struct PickElement: View {
    var rand = [ConfigGameItem(name: "Hydrogen", config: "1s1", configSemantic: "1s1", symbol: "H"),ConfigGameItem(name: "Silicon", config: "1s1", configSemantic: "1s1", symbol: "S"),ConfigGameItem(name: "Nitrogen", config: "1s1", configSemantic: "1s1", symbol: "N")]
    @Binding var selected:String
    var body: some View {
        HStack{
            ForEach(rand.shuffled(), id: \.name) { elem in
                InfoSign(symbol: elem.symbol, name: elem.name)
            }
        }
    }
}

#Preview {
    PickElement(selected: .constant("Hydrogen"))
}
