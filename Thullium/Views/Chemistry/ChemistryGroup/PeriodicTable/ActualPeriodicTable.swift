//
//  ActualPeriodicTable.swift
//  Thullium
//
//  Created by Richard on 20.09.2023.
//

import SwiftUI


/// View of periodic table that is presented to user giving the ``SearchTable`` parameter
struct ActualPeriodicTable: View {
    
    @State var searchEng = SearchTable()
    
    var body: some View {
        PeriodicTableView(searchEngine: searchEng)
            .searchable(text: $searchEng.search, prompt: "searchElement")
        
    }
}

#Preview {
    ActualPeriodicTable()
        .environment(\.locale, .init(identifier: "cs"))
}
