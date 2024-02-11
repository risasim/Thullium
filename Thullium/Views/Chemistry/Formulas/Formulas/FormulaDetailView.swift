//
//  FormulaDetailView.swift
//  Thullium
//
//  Created by Richard on 07.02.2024.
//

import SwiftUI
import SwiftMath

struct FormulaDetailView: View {
    
    let variables:[FormulaEquationVariable]
    @Binding var isOpened:Bool
    
    var body: some View {
        VStack{
            HStack{
                Text("Variables")
                    .font(.title2)
                    .bold()
                Spacer()
                Button {
                    isOpened.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .font(.largeTitle)
                        .foregroundStyle(Color.primary)
                }
                
            }
            .padding(0)
            ForEach(variables,id: \.name) { v in
                FormulaVariableView(v: v)
                    .frame(maxHeight: 50)
                    .overlay(
                        Rectangle()
                            .frame(width: nil, height: 0.4, alignment: .top)
                            .foregroundColor(Color.gray)
                        , alignment: .top)
                    
            }
        }
        .padding()
        .background{
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .foregroundStyle(.ultraThickMaterial)
                
        }
    }
}

#Preview {
    FormulaDetailView(variables: [FormulaEquationVariable(sign: "e", name: "Energy", unit: nil),FormulaEquationVariable(sign: "m", name: "Mass", unit: "kg"),FormulaEquationVariable(sign: "c", name: "Speed of light", unit: "km/s")], isOpened: .constant(true))
}
