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
    @State var showVar = false
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
                    VStack{
#if !os(visionOS)
                        MathView(equation: f, fontSize: 40)
#endif
                    }
                        .fixedSize()
                        .padding()
                        .overlay(alignment: .bottom, content: {
                            if let vars = formula.variables{
                                HStack{
                                    Spacer()
                                    Button(action: {showVar.toggle()}, label: {
                                        Image(systemName: "info.circle")
                                            .font(.caption)
                                            .padding(4)
                                    })
                                }
                                .popover(isPresented: $showVar, content: {
                                    FormulaDetailView(variables: vars,isOpened: $showVar)
                                        .fixedSize()
                                        .frame( maxWidth: .infinity, maxHeight: .infinity)
                                        .presentationCompactAdaptation(.popover)
                                })
                            }
                        })
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
