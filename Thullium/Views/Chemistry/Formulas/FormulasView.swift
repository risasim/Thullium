//
//  FormulasView.swift
//  Thullium
//
//  Created by Richard on 04.02.2024.
//

import SwiftUI

struct FormulasView: View {
    
    var data = JSONtoSwiftDataconverter()
    
    var body: some View {
        List{
            ForEach(data.formulas, id: \.title) { form in
                FormulaView(formula: form)
                    .padding()
                    .listRowSeparator(.hidden)
                    .overlay(content: {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .stroke(Color.primary.opacity(0.6), lineWidth:3)
                    })
                    .background{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .foregroundStyle(.ultraThinMaterial)
                    }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    FormulasView()
}
