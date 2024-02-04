//
//  FormulaView.swift
//  Thullium
//
//  Created by Richard on 04.02.2024.
//

import SwiftUI

struct FormulaView: View {
    var formula:Formula
    var body: some View {
        if formula != nil{
            VStack{
                Text(LocalizedStringKey(formula.title))
                    .font(.title)
                    .bold()
                    .fontDesign(.monospaced)
                Text(LocalizedStringKey(formula.equation))
                if let text = formula.info{
                    Text(LocalizedStringKey(text))
                }
            }
            .padding()
        }
    }
}

#Preview {
    FormulaView(formula: JSONtoSwiftDataconverter().formulas[0])
}
