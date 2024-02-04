//
//  FormulaView.swift
//  Thullium
//
//  Created by Richard on 04.02.2024.
//

import SwiftUI
import SwiftMath

struct FormulaView: View {
    var data = JSONtoSwiftDataconverter()
    var formula:Formula
    @Binding var desc:Bool
    var body: some View {
        if formula != nil{
            VStack{
                Text(LocalizedStringKey(formula.title))
                    .font(.title)
                    .bold()
                    .fontDesign(.monospaced)
                    .lineLimit(1)
                    .minimumScaleFactor(0.01)
                MathView(equation: data.formulaDir[formula.equation]!, fontSize: 40)
                    .fixedSize()
                    .padding()
                    .background{
                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                            .foregroundStyle(.ultraThinMaterial)
                    }
                if let text = formula.info{
                    Text(LocalizedStringKey(text))
                        .multilineTextAlignment(.leading)
                        .fontDesign(.serif)
                }
            }
        }
    }
}

#Preview {
    FormulaView(formula: JSONtoSwiftDataconverter().formulas[0],desc: .constant(false))
}
