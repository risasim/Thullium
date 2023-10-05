//
//  PerodicTest.swift
//  Thullium
//
//  Created by Richard on 20.09.2023.
//

import SwiftUI



/// View representing one element in ``PeriodicTableView``
///
/// - Note This view carries a lot of logic, that is based on data from ``GameModel`` or ``SearchTable``
struct PeriodicTest:View {
    
    var el:Element
    var searchQuery : [String]?
    var categories: [Category]?
    var number:Int?
    var gData: GameData?
    @State var popUp = false
    var colour:Color{
        determineColorFromCategory(category: el.category)
    }
    
    /// Handles logic of making sure that either ``GameModel`` or  ``SearchTable`` exists and based on that creates the right view in three variants
    var body: some View {
        if let data = gData{
            if data.alreadyGuessed.contains(el.name){
                normalView
                    .animation(.bouncy, value: 0.6)
            }else{
                baseView.opacity(data.hint==el.name ? 0.85 : 0.6)
            }
        }else if (searchQuery != nil){
            if (searchQuery!.contains(el.name)){
                normalView
            }else{
                baseView.opacity(0.6)
            }
        }
    }
// MARK: - The constructed peroidic table element
    /// Combinatin of baseView and infoView , which is link to ``ElementInfoView``
    private var normalView:some View{
        baseView
            .overlay{
               infoView
            }
            .onTapGesture {
                popUp.toggle()
            }
            .popover(isPresented: $popUp, content: {
                ZStack{
                    ElementInfoView(element: el)
                        .padding(.top)
                    CloseButtonView(popUp: $popUp)
                    
                }
                .background(determineColorFromCategory(category: el.category).ignoresSafeArea())
            })
    }
    /// Color square background shown in background
    private var baseView: some View{
        colour
            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 50 : 32, height: UIDevice.current.userInterfaceIdiom == .pad ? 50 : 32)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 4, height: 4)))
    }
    /// Actual information contained in the ``PeriodicTest`` being the name and symbol of element
    private var infoView: some View{
        VStack{
            Text(String(el.number))
                .font(.caption2)
            Text(el.symbol)
        }
        .foregroundStyle(determineColorFromPhase(phase: el.phase))
    }
}
