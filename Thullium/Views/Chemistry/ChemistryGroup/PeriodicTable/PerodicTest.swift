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
// MARK: - Variables
    @AppStorage("showDetailsInSettigs") private var showDetails:Bool = false
    var el:Element
    //var searchQuery : [String]?
    @Binding var searchModel:SearchTable?
    @Binding var gameModel:GameModel?
    var categories: [Category]?
    var number:Int?
    //The reason it does fetch so many times is because i create it a few dozen times
    var colour:Color{
        determineColorFromCategory(category: el.category)
    }
    @State var popUp = false
    @State private var start: Bool = false
    @State private var hintAnimated = false
    
// MARK: - Views
    /// Handles logic of making sure that either ``GameModel`` or  ``SearchTable`` exists and based on that creates the right view in three variants
    var body: some View {
        if let model = gameModel{
            if model.gData.alreadyGuessed.contains(el.name){
                normalView
                    .hoverEffect()
                    .scaleEffect(CGSize(width: start ? 1.1 : 1.0, height: start ? 1.2 : 1.0), anchor: .center)
                    .onAppear{
                            start = true
                        withAnimation(Animation.easeOut) {
                                start = false
                        }
                    }
            }else{
                baseView
                    .hoverEffect()
                    .opacity(model.gData.hinted==el.name ? 0.85 : 0.6)
                    .rotationEffect(.degrees(start ? 30 : 0))
                    .offset(x: start ? 5:0)
                    .offset(x:  hintAnimated ? 5:0)
                    .onTapGesture {
                        if !model.manageTap(index: el.number-1, name: el.name){
                            start = true
                            withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2,blendDuration: 0.2)) {
                                start = false
                            }
                        }
                    }
                    .onChange(of: model.gData.hinted) { oldValue, newValue in
                        if newValue == el.name{
                            hintAnimated = true
                            withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2,blendDuration: 0.2).repeatForever(autoreverses: false)) {
                                hintAnimated = false
                            }
                        }
                    }
            }
        }else if (searchModel != nil){
            if (searchModel!.showThese.contains(el.name)){
                normalView
                    .hoverEffect()
            }else{
                baseView.opacity(0.6)
                    .hoverEffect()
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
                if(searchModel != nil){
                    searchModel!.achieveModel.elementTapped(num: el.number)
                }
                if let gModel = gameModel{
                    if (showDetails==true){
                        popUp.toggle()
                    }
                }else{
                    popUp.toggle()
                }
            }
        #if targetEnvironment(macCatalyst)
            .sheet(isPresented: $popUp, content: {
                ZStack{
                    ElementInfoView(element: el)
                        .padding(.top)
                    CloseButtonView(popUp: $popUp)
                    
                }
                .background(determineColorFromCategory(category: el.category).ignoresSafeArea())
            })
        #else
            .popover(isPresented: $popUp, content: {
                ZStack{
                    ElementInfoView(element: el)
                        .padding(.top)
                    CloseButtonView(popUp: $popUp)
                    
                }
                .background(determineColorFromCategory(category: el.category).ignoresSafeArea())
            })
        #endif
    }
    /// Color square background shown in background
    private var baseView: some View{
        colour
        #if os(visionOS)
            .frame(width: 50,height: 50)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 4, height: 4)))
        #else
            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 50 : 32, height: UIDevice.current.userInterfaceIdiom == .pad ? 50 : 32)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 4, height: 4)))
        #endif
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


#Preview(traits: .sizeThatFitsLayout){
    PeriodicTest(el: JSONtoSwiftDataconverter().eData[68], searchModel: .constant(nil), gameModel:.constant( GameModel()))
}
