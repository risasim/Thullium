//
//  InfoSign.swift
//  FlashCards
//
//  Created by Richard on 16.09.2023.
//

import SwiftUI


/// Table like view that represents basic data from ``Element``
struct InfoSign: View {
    
    var number:Int?
    var atom_mass: Double?
    var symbol:String
    var name:String
    var showNumbers = true
    
    var body: some View {
        VStack{
            HStack {
                if let n = number{
                    Text(String(n))
                        .font(.system(size: 20))
                }
            }
            Text(symbol)
                .font(.system(size: 80))
                .fontWeight(.bold)
            Text(LocalizedStringKey(name))
                .font(.system(size: 30))
            if let mass = atom_mass{
                Text(String(format: "%.2f",mass))
                    .font(.system(size: 20))
            }
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
    InfoSign(number: 1,atom_mass:1.01,symbol: "H", name: "Hydrogen")
        .environment(\.locale, .init(identifier: "en"))
}
