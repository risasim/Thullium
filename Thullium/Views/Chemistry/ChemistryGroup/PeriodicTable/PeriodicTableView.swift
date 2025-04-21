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
    @State private var tableScale : CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 1.0 : 0.46
    @State private var tableOffset: CGSize = CGSize(width: 3, height: 4)
    
    var body: some View {
        // ScrollView([.vertical, .horizontal]){
        ZStack{
            Color.clear
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
                            .id(elements[i+88].name)
                    }
                }
            }
        }
#if os(iOS)
        .scaleEffect(tableScale)
        .offset(x: tableOffset.width, y: tableOffset.height)
        .gesture(
            MagnificationGesture()
                .onChanged({ value in
                    withAnimation(.linear(duration: 1)){
                        if UIDevice.current.userInterfaceIdiom == .pad {
                            if tableScale >= 0.5 && tableScale <= 2.5{
                                tableScale = value
                            }else if tableScale > 2.5{
                                tableScale = 2.5
                            }
                        }else{
                            if tableScale >= 0.46 && tableScale <= 4{
                                tableScale = value
                            }else if tableScale > 4{
                                tableScale = 4
                            }
                        }
                    }
                    print(tableScale)
                })
                .onEnded({ _ in
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        if tableScale > 2.5{
                            tableScale = 2.5
                        }else if tableScale <= 0.5{
                            resetImageState()
                        }
                    }else{
                        if tableScale > 4{
                            tableScale = 4
                        }else if tableScale <= 0.46{
                            resetImageState()
                        }
                    }
                })
        )
        .highPriorityGesture(
            DragGesture()
                .onChanged({ value in
                    withAnimation(.linear(duration: 1)){
                        tableOffset = value.translation
                        print(value.translation)
                    }
                })
                .onEnded({ _ in
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        if tableScale <= 0.5{
                            resetImageState()
                        }
                    }else{
                        if tableScale <= 0.46{
                            resetImageState()
                        }
                    }
                })
        )
#endif
    }
    /// React to tap on element and then either add to alreadyGuessed or increment numAt in ``GameData``
    private func manageTap(gameModel : GameModel?, index i: Int){
        if gameModel != nil{
            if gameModel!.gData.currentGuess == elements[i].name{
                gameModel!.addToGuessed(name: elements[i].name)
#if os(iOS)
                feedbackGenerator.notificationOccurred(.success)
#endif
            }else{
#if os(iOS)
                feedbackGenerator.notificationOccurred(.error)
#endif
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

extension PeriodicTableView{
    func resetImageState(){
        return withAnimation(.spring()){
            if UIDevice.current.userInterfaceIdiom == .pad{
                tableScale = 1.0
                tableOffset = .zero
            }else{
                tableScale = 0.46
                tableOffset = .zero
            }
        }
    }
}
