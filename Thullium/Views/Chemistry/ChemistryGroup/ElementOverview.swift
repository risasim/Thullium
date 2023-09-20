//
//  ElementOverview.swift
//  FlashCards
//
//  Created by Richard on 14.09.2023.
//

import SwiftUI

struct ElementOverview: View {
    
    var elements:[Element]
    @State var search:String = ""
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(searchResults, id: \.name) { el in
                        NavigationLink(destination: ElementInfoView(element: el)) {
                            VStack{
                                HStack {
                                    Text(String(el.number))
                                        .font(.caption)
                                }
                                Text(el.symbol)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                Text(el.name)
                                    .font(.caption)
                                Text(String(format: "%.2f",el.atomic_mass))
                                    .font(.footnote)
                            }
                            .foregroundStyle(Color.primary)
                            .padding()
                            .frame(maxWidth: 120, maxHeight: 120)
                            .overlay(content: {
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                    .stroke(Color.primary, lineWidth: 1)
                            })
                        }
                    }
                })
            }
            .navigationTitle("Elements")
            .searchable(text: $search)
        }
        .tint(.black)
        var searchResults: [Element] {
                if search.isEmpty {
                    return elements
                } else {
                    return elements.filter { $0.name.contains(search) }
                }
            }
    }
}

#Preview {
    ElementOverview(elements: JSONtoSwiftDataconverter().eData)
}
