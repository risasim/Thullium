//
//  InfoSign.swift
//  FlashCards
//
//  Created by Richard on 16.09.2023.
//

import SwiftUI


/// Table like view that represents basic data from ``Element``
struct InfoSign: View {
    
    var info:Element
    
    var body: some View {
        VStack{
            HStack {
                Text(String(info.number))
                    .font(.system(size: 20))
            }
            Text(info.symbol)
                .font(.system(size: 80))
                .fontWeight(.bold)
            Text(LocalizedStringKey(info.name))
                .font(.system(size: 30))
            Text(String(format: "%.2f",info.atomic_mass))
                .font(.system(size: 20))
        }
        //.frame(width: 210,height: 220)
        .frame(maxWidth: 210, maxHeight: 220)
        .overlay(content: {
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .stroke(Color.primary, lineWidth: 5)
        })
    }
}

#Preview {
    InfoSign(info: JSONtoSwiftDataconverter().eData[0])
        .environment(\.locale, .init(identifier: "en"))
}
