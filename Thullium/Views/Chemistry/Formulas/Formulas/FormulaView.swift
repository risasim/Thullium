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
    @State var hiddenText = false
    var body: some View {
        if formula != nil{
            VStack{
                Text(LocalizedStringKey(formula.title))
                    .font(.title)
                    .bold()
                    .fontDesign(.monospaced)
                    .lineLimit(1)
                    .minimumScaleFactor(0.01)
                if let f = data.formulaDir[formula.equation]{
                    MathView(equation: f, fontSize: 40)
                        .fixedSize()
                        .padding()
                        .background{
                            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                .foregroundStyle(.ultraThinMaterial)
                        }
                }
                if let text = formula.info{
                    if hiddenText{
                        HStack{
                            Spacer()
                            VStack{
                                Image(systemName:"ellipsis")
                                    .font(.title)
                                    .padding(.bottom,2)
                             //   Text("formulaHiddenTextButton")
                            //      .font(.callout)
                            }
                            Spacer()
                        }
                        .padding(3)
                        .onTapGesture {
                            hiddenText.toggle()
                        }
                    }else{
                        Text(LocalizedStringKey(text))
                            .multilineTextAlignment(.leading)
                            .fontDesign(.serif)
                    }
                }
            }
            .onChange(of: desc) { oldValue, newValue in
                hiddenText = newValue
            }
        }
    }
}

#Preview {
    FormulaView(formula: JSONtoSwiftDataconverter().formulas[0],desc: .constant(false))
}
