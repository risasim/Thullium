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
    @State var gameModel: GameModel?
    var elements = JSONtoSwiftDataconverter().eData
    @State var searchEngine:SearchTable?
    @State private var tableScale : CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 1.0 : 0.46
    @State private var tableOffset: CGSize = CGSize(width: 3, height: 4)
    @GestureState private var magnifyBy = 1.0
    @AppStorage("tableZoom") private var zoom:Bool = false

    
    var body: some View {
        // ScrollView([.vertical, .horizontal]){
        ZStack{
            Rectangle()
                .foregroundStyle(Color.clear)
            PeriodicTableBaseView(gameModel: gameModel,searchEngine: searchEngine)
        }
#if os(iOS)
        .if(zoom){view in
            view
                .scaleEffect(tableScale * magnifyBy)
                .offset(tableOffset)
                .gesture(
                    MagnificationGesture()
                        .updating($magnifyBy) { currentState, gestureState, _ in
                            gestureState = currentState
                        }
                        .onEnded { value in
                            tableScale *= value
                            tableScale = min(max(tableScale, 0.5), 4.0)
                        }
                )
                .simultaneousGesture(
                    DragGesture()
                        .onChanged { value in
                            tableOffset = value.translation
                        }
                        .onEnded { _ in
                            if tableScale <= 0.5 {
                                resetImageState()
                            }
                        }
                )
                .onTapGesture(count: 2) {
                    resetImageState()
                }
            
        }
#endif
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
