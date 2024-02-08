//
//  FormulaVariableViews.swift
//  Thullium
//
//  Created by Richard on 07.02.2024.
//

import SwiftUI

struct FormulaVariableView: View {
    var v: FormulaEquationVariable
    var body: some View {
        HStack{
            MathView(equation: v.sign, fontSize: 20,textAlignment: .left)
            Spacer()
            if let u = v.unit{
                Text("""
                    \(v.name)
                    (\(u))
                    """)
                .multilineTextAlignment(.trailing)
                .italic()
            }else{
                Text(v.name)
                    .italic()
            }
        }
    }
}

#Preview {
    FormulaVariableView(v: FormulaEquationVariable(sign: "m", name: "Mass", unit: "Kg"))
}
