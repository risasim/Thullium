//
//  PeriodicTableView.swift
//  FlashCards
//
//  Created by Richard on 17.09.2023.
//

import SwiftUI
import SwiftData
import TipKit

struct PeriodicTableView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var realElements: [ElementsData]
    @State var gameModel: GameModel?
    var elements = JSONtoSwiftDataconverter().eData
   // @State var searchText:String = ""
    @State var searchEngine:SearchTable?
    
    var body: some View {
        ScrollView([.vertical, .horizontal]){
            Grid{
                // MARK: - First
                GridRow {
                    PeriodicTest(el: elements[0], gues: gameModel?.alreadyGuessed, searchQuery: searchEngine?.showThese,hint: gameModel?.hint)
                        .onTapGesture {
                           manageTap(gameModel: gameModel, index: 0)
                        }
                    ForEach(0..<16, id: \.self){_ in
                        Color.clear
                            .gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                    PeriodicTest(el: elements[1], gues: gameModel?.alreadyGuessed,searchQuery: searchEngine?.showThese, hint: gameModel?.hint)
                        .onTapGesture {
                            manageTap(gameModel: gameModel, index: 1)
                        }
                        .popoverTip(ClickableTip(), arrowEdge: .trailing)
                }
                // MARK: - Second
                GridRow {
                    ForEach(0..<2, id: \.self){i in
                        PeriodicTest(el: elements[i+2], gues: gameModel?.alreadyGuessed,searchQuery: searchEngine?.showThese, hint: gameModel?.hint)
                            .onTapGesture {
                               manageTap(gameModel: gameModel, index: i+2)
                            }
                    }
                    ForEach(0..<10, id: \.self){i in
                        Color.clear
                            .gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                    ForEach(0..<6, id: \.self){i in
                        PeriodicTest(el: elements[i+4], gues: gameModel?.alreadyGuessed,searchQuery: searchEngine?.showThese, hint: gameModel?.hint)
                            .onTapGesture {
                                manageTap(gameModel: gameModel, index: i+4)
                            }
                    }
                }
                // MARK: - Third
                GridRow {
                    ForEach(0..<2, id: \.self){i in
                        PeriodicTest(el: elements[i+10],gues: gameModel?.alreadyGuessed,searchQuery: searchEngine?.showThese, hint: gameModel?.hint)
                            .onTapGesture {
                               manageTap(gameModel: gameModel, index: i+10)
                            }
                    }
                    ForEach(0..<10, id: \.self){i in
                        Color.clear
                            .gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                    ForEach(0..<6, id: \.self){i in
                        PeriodicTest(el: elements[i+12], gues: gameModel?.alreadyGuessed,searchQuery: searchEngine?.showThese, hint: gameModel?.hint)
                            .onTapGesture {
                               manageTap(gameModel: gameModel, index: i+12)
                            }
                    }
                }
                // MARK: - Fourth
                GridRow {
                    ForEach(0..<18, id: \.self){i in
                        PeriodicTest(el: elements[i+18], gues: gameModel?.alreadyGuessed,searchQuery: searchEngine?.showThese, hint: gameModel?.hint)
                            .onTapGesture {
                              manageTap(gameModel: gameModel, index: i+18)
                            }
                    }
                }
                // MARK: - Fifth
                GridRow {
                    ForEach(0..<18, id: \.self){i in
                        PeriodicTest(el:elements[i+36], gues: gameModel?.alreadyGuessed,searchQuery: searchEngine?.showThese, hint: gameModel?.hint)
                            .onTapGesture {
                               manageTap(gameModel: gameModel, index: i+36)
                            }
                    }
                }
                // MARK: - Sixth
                GridRow {
                    ForEach(0..<2, id: \.self){i in
                        PeriodicTest(el: elements[i+54], gues: gameModel?.alreadyGuessed,searchQuery: searchEngine?.showThese, hint: gameModel?.hint)
                            .onTapGesture {
                                manageTap(gameModel: gameModel, index: i+54)
                            }
                    }
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                    ForEach(0..<15, id: \.self){i in
                        PeriodicTest(el: elements[i+71], gues: gameModel?.alreadyGuessed,searchQuery: searchEngine?.showThese, hint: gameModel?.hint)
                            .onTapGesture {
                               manageTap(gameModel: gameModel, index: i+71)
                            }
                    }
                }
                // MARK: - Seventh
                GridRow {
                    ForEach(0..<2, id: \.self){i in
                        PeriodicTest(el: elements[i+86], gues: gameModel?.alreadyGuessed,searchQuery: searchEngine?.showThese, hint: gameModel?.hint)
                            .onTapGesture {
                               manageTap(gameModel: gameModel, index: i+86)
                            }
                    }
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                    ForEach(0..<15, id: \.self){i in
                        PeriodicTest(el: elements[i+103], gues: gameModel?.alreadyGuessed,searchQuery: searchEngine?.showThese, hint: gameModel?.hint)
                            .onTapGesture {
                                manageTap(gameModel: gameModel, index: i+103)
                            }
                    }
                }
                // MARK: - Eight
                GridRow {
                    PeriodicTest(el: elements[118], gues: gameModel?.alreadyGuessed,searchQuery: searchEngine?.showThese, hint: gameModel?.hint)
                        .onTapGesture {
                            manageTap(gameModel: gameModel, index: 118)
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
                        PeriodicTest(el: elements[i+56], gues: gameModel?.alreadyGuessed,searchQuery: searchEngine?.showThese, hint: gameModel?.hint)
                            .onTapGesture {
                                manageTap(gameModel: gameModel, index: i+56)
                            }
                    }
                }
                // MARK: - Down second
                GridRow {
                    ForEach(0..<3, id: \.self){i in
                        Color.clear
                            .gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                    ForEach(0..<15, id: \.self){i in
                        PeriodicTest(el: elements[i+88], gues: gameModel?.alreadyGuessed,searchQuery: searchEngine?.showThese, hint: gameModel?.hint)
                            .onTapGesture {
                               manageTap(gameModel: gameModel, index: i+88)
                            }
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        
    }
    
    private func manageTap(gameModel : GameModel?, index i: Int){
        if gameModel != nil{
            if gameModel!.currentGuess == elements[i].name{
                gameModel!.addToGuessed(name: elements[i].name)
                feedbackGenerator.notificationOccurred(.success)
            }else{
                feedbackGenerator.notificationOccurred(.error)
                print("This happened")
                print(gameModel!.numberOfAttempts)
                gameModel!.numberOfAttempts += 1
                print("Got here")
                
            }
        }
    }   
}

#Preview {
    PeriodicTableView()
        .task {
            try? await Tips.configure()
        }
}
