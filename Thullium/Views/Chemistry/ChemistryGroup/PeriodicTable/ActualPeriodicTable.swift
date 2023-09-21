//
//  ActualPeriodicTable.swift
//  Thullium
//
//  Created by Richard on 20.09.2023.
//

import SwiftUI

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
