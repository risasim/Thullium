//
//  FormulasView.swift
//  Thullium
//
//  Created by Richard on 04.02.2024.
//

import SwiftUI

struct FormulasView: View {
    
    @State var descHidden = false
    var data = JSONtoSwiftDataconverter()
    @State var showConstants = true
    @State var showEquations = true
    
    var body: some View {
        NavigationStack{
            List{
                Section {
                    if showConstants{
                        ForEach(data.formulas.filter({ $0.title.contains("const") }), id: \.title) { form in
                            FormulaView(formula: form,desc: $descHidden)
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
                } header: {
                    HStack{
                        Text("formula.constants")
                        Image(systemName: showConstants ? "chevron.down" : "chevron.up")
                    }
                    .onTapGesture {
                        showConstants.toggle()
                    }
                }
                Section {
                    if showEquations{
                        ForEach(data.formulas.filter({ $0.title.lowercased().contains("eq") ||  $0.title.lowercased().contains("law")}), id: \.title) { form in
                            FormulaView(formula: form,desc: $descHidden)
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
                } header: {
                    HStack{
                        Text("formula.equations")
                        Image(systemName: showEquations ? "chevron.down" : "chevron.up")
                    }
                    .onTapGesture {
                        showEquations.toggle()
                    }
                }
            }
            .listStyle(.plain)
            .toolbar(content: {
                ToolbarItem(placement: .primaryAction) {
                    Image(systemName: descHidden ? "book.closed":"book")
                        .bold()
                        .font(.title3)
                        .onTapGesture {
                            descHidden.toggle()
                        }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Text("Formulas")
                        .font(.title2)
                        .bold()
                       
                }
            })
        }
    }
}

#Preview {
    FormulasView()
}
