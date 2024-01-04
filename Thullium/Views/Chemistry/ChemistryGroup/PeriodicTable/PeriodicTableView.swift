//
//  PeriodicTableView.swift
//  FlashCards
//
//  Created by Richard on 17.09.2023.
//

import SwiftUI
import SwiftData
import TipKit


/// Complete view of periodic table.
/// - Warning: This view does not work on it's own, ``GameModel`` or  ``SearchTable`` is needed as a paramter
struct PeriodicTableView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var realElements: [ElementsData]
    @State var gameModel: GameModel?
    var elements = JSONtoSwiftDataconverter().eData
    @State var searchEngine:SearchTable?
    
    var body: some View {
        ScrollView([.vertical, .horizontal]){
            Grid{
                // MARK: - First
                GridRow {
                    PeriodicTest(el: elements[0], searchModel: $searchEngine,gameModel: $gameModel)
                        .popoverTip(PeriodicTableExploreTip(), arrowEdge: .trailing)
                    ForEach(0..<16, id: \.self){_ in
                        Color.clear
                            .gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                    PeriodicTest(el: elements[1],searchModel: $searchEngine,gameModel: $gameModel)
                }
                // MARK: - Second
                GridRow {
                    ForEach(0..<2, id: \.self){i in
                        PeriodicTest(el: elements[i+2], searchModel: $searchEngine,gameModel: $gameModel)
                    }
                    ForEach(0..<10, id: \.self){i in
                        Color.clear
                            .gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                    ForEach(0..<6, id: \.self){i in
                        PeriodicTest(el: elements[i+4], searchModel: $searchEngine,gameModel: $gameModel)
                    }
                }
                // MARK: - Third
                GridRow {
                    ForEach(0..<2, id: \.self){i in
                        PeriodicTest(el: elements[i+10],searchModel: $searchEngine,gameModel: $gameModel)
                    }
                    ForEach(0..<10, id: \.self){i in
                        Color.clear
                            .gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                    ForEach(0..<6, id: \.self){i in
                        PeriodicTest(el: elements[i+12], searchModel: $searchEngine,gameModel: $gameModel)
                    }
                }
                // MARK: - Fourth
                GridRow {
                    ForEach(0..<18, id: \.self){i in
                        PeriodicTest(el: elements[i+18], searchModel: $searchEngine,gameModel: $gameModel)
                    }
                }
                // MARK: - Fifth
                GridRow {
                    ForEach(0..<18, id: \.self){i in
                        PeriodicTest(el:elements[i+36], searchModel: $searchEngine,gameModel: $gameModel)
                    }
                }
                // MARK: - Sixth
                GridRow {
                    ForEach(0..<2, id: \.self){i in
                        PeriodicTest(el: elements[i+54], searchModel: $searchEngine,gameModel: $gameModel)
                    }
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                    ForEach(0..<15, id: \.self){i in
                        PeriodicTest(el: elements[i+71], searchModel: $searchEngine,gameModel: $gameModel)
                    }
                }
                // MARK: - Seventh
                GridRow {
                    ForEach(0..<2, id: \.self){i in
                        PeriodicTest(el: elements[i+86], searchModel: $searchEngine,gameModel: $gameModel)
                    }
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                    ForEach(0..<15, id: \.self){i in
                        PeriodicTest(el: elements[i+103], searchModel: $searchEngine,gameModel: $gameModel)
                    }
                }
                // MARK: - Eight
                GridRow {
                    PeriodicTest(el: elements[118], searchModel: $searchEngine,gameModel: $gameModel)
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
                        PeriodicTest(el: elements[i+56], searchModel: $searchEngine,gameModel: $gameModel)
                    }
                }
                // MARK: - Down second
                GridRow {
                    ForEach(0..<3, id: \.self){i in
                        Color.clear
                            .gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                    ForEach(0..<15, id: \.self){i in
                        PeriodicTest(el: elements[i+88], searchModel: $searchEngine,gameModel: $gameModel)
                            
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
    /// React to tap on element and then either add to alreadyGuessed or increment numAt in ``GameData``
    private func manageTap(gameModel : GameModel?, index i: Int){
        if gameModel != nil{
            if gameModel!.gData.currentGuess == elements[i].name{
                gameModel!.addToGuessed(name: elements[i].name)
                feedbackGenerator.notificationOccurred(.success)
            }else{
                feedbackGenerator.notificationOccurred(.error)
                print("This happened")
                print(gameModel!.gData.numAt)
                gameModel!.gData.numAt += 1
                print("Got here")
                
            }
        }
    }
}

#Preview {
    PeriodicTableView(searchEngine: SearchTable())
}
