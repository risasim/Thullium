//
//  ElementInfoView.swift
//  FlashCards
//
//  Created by Richard on 15.09.2023.
//

import SwiftUI

struct ElementInfoView: View {
    var element:Element
    var body: some View {
        ScrollView{
            InfoSign(info: element)
                .frame(width: 220, height: 220)
                .padding()
            Divider()
            InfoBasic(info: element)
            Divider()
            HStack{
                InfoImage(image: element.image)
                InfoImage(image: ElementImage(title: "Bohr Model", url: element.bohr_model_image ?? "/", attribution: ""))
            }
            Divider()
                
        }
    }
}

#Preview {
    ElementInfoView(element: JSONtoSwiftDataconverter().eData[0])
}
