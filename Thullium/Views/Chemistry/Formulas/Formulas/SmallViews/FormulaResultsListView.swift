//
//  FormulaResultsListView.swift
//  Thullium
//
//  Created by Richard on 11.02.2024.
//

import SwiftUI

struct FormulaResultsListView: View {
    
    @State var showConstants : Bool = true
    @State var showEquations = true
    @State var show: Bool = true
    @Binding var search:String
    @Binding var descHidden:Bool
    let data: [Formula]
    
    var body: some View {
        List{
            Section {
                if showConstants{
                    ForEach(data.filter({ $0.title.contains("const") && $0.title.localizedCaseInsensitiveContains(search) }), id: \.title) { form in
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
                    ForEach(data.filter({ ($0.title.lowercased().contains("eq") ||  $0.title.lowercased().contains("law")) && $0.title.localizedCaseInsensitiveContains(search)}), id: \.title) { form in
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
        } .listStyle(.plain)
    }
}

#Preview {
    FormulaResultsListView(search: .constant("Avog"), descHidden: .constant(false), data: JSONtoSwiftDataconverter().formulas)
}
