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
                .lineLimit(2)
                .minimumScaleFactor(0.01)
                
            }else{
                Text(v.name)
                    .multilineTextAlignment(.trailing)
                    .italic()
                    .lineLimit(1)
                    .minimumScaleFactor(0.01)
            }
            Spacer()
        }
        .frame(minWidth: 300)
    }
}

#Preview {
    FormulaVariableView(v: FormulaEquationVariable(sign: "m", name: "Mass", unit: "m\u{00B3}"))
}
