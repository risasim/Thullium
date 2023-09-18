//
//  PeriodicTableView.swift
//  FlashCards
//
//  Created by Richard on 17.09.2023.
//

import SwiftUI

struct PeriodicTableView: View {
    
    var elements = JSONtoSwiftDataconverter().eData
    var i = 2
    
    var body: some View {
        ScrollView([.vertical, .horizontal]){
            Grid{
    // MARK: - First
                GridRow {
                    PeriodicTest(el: elements[0])
                    ForEach(0..<16, id: \.self){_ in
                        Color.clear
                            .gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                    PeriodicTest(el: elements[1])
                }
    // MARK: - Second
                GridRow {
                    ForEach(0..<2, id: \.self){i in
                        PeriodicTest(el: elements[i+2])
                    }
                    ForEach(0..<10, id: \.self){i in
                        Color.clear
                            .gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                    ForEach(0..<6, id: \.self){i in
                        PeriodicTest(el: elements[i+4])
                    }
                }
    // MARK: - Third
                GridRow {
                    ForEach(0..<2, id: \.self){i in
                        PeriodicTest(el: elements[i+10])
                    }
                    ForEach(0..<10, id: \.self){i in
                        Color.clear
                            .gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                    ForEach(0..<6, id: \.self){i in
                        PeriodicTest(el: elements[i+12])
                    }
                }
    // MARK: - Fourth
                GridRow {
                    ForEach(0..<18, id: \.self){i in
                        PeriodicTest(el: elements[i+18])
                    }
                }
    // MARK: - Fifth
                GridRow {
                    ForEach(0..<18, id: \.self){i in
                        PeriodicTest(el:elements[i+36])
                    }
                }
    // MARK: - Sixth
                GridRow {
                    ForEach(0..<2, id: \.self){i in
                        PeriodicTest(el: elements[i+54])
                    }
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                    ForEach(0..<15, id: \.self){i in
                        PeriodicTest(el: elements[i+71])
                    }
                }
    // MARK: - Seventh
                GridRow {
                    ForEach(0..<2, id: \.self){i in
                        PeriodicTest(el: elements[i+86])
                    }
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                    ForEach(0..<15, id: \.self){i in
                        PeriodicTest(el: elements[i+104])
                    }
                }
                Divider()
                    .padding([.leading, .trailing])
    // MARK: - Down first
                GridRow {
                    ForEach(0..<3, id: \.self){i in
                        Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                    ForEach(0..<15, id: \.self){i in
                        PeriodicTest(el: elements[i+56])
                    }
                }
    // MARK: - Down second
                GridRow {
                    ForEach(0..<3, id: \.self){i in
                        Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                    ForEach(0..<15, id: \.self){i in
                        PeriodicTest(el: elements[i+88])
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    PeriodicTableView()
}



struct PeriodicTest:View {
    
    var el:Element
    var color:Color{
        switch el.category{
        case "noble gas":
            return .purple
        case "diatomic nonmetal":
            return .green
        case "alkali metal":
            return .brown
        case "alkaline earth metal":
            return .yellow
        case "metalloid":
            return .cyan
        case "post-transition metal":
            return .blue
        case "lanthanide":
            return .mint
        case "transition metal":
            return .red
        case "actinide":
            return .teal
        case "reactive nonmetal":
            return .indigo
        default:
            return .gray
        }
    }
    
    var body: some View {
        NavigationLink {
            ElementInfoView(element: el)
        } label: {
            color
                .frame(width: 32, height: 32)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 4, height: 4)))
                .overlay{
                    Text(el.symbol)
                        .foregroundStyle(.black)
                }
        }

    }
}
