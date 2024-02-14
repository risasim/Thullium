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
    @State var searchedData:[Formula] = []
    @State var showConstants = true
    @State var showEquations = true
    @State var search = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                if searchedData.count==0 && search == ""{
                    FormulasBasicListView(descHidden: $descHidden, data: data.formulas)
                }else if searchedData.count==0{
                    Text("Not found")
                }else{
                    FormulaResultsListView(descHidden: $descHidden, data: data.formulas)
                }
            }
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
        .searchable(text: $search, prompt: "Search...")
        .onChange(of: search) { oldValue, newValue in
            searchedData = searchData()
        }
    }
    
    func searchData()->[Formula]{
        return data.formulas.filter({$0.title.lowercased().contains(search.lowercased())})
    }
}

#Preview {
    FormulasView()
}
