//
//  PerodicTest.swift
//  Thullium
//
//  Created by Richard on 20.09.2023.
//

import SwiftUI


struct PeriodicTest:View {
    
    var el:Element
    var gues: [String]?
    var searchQuery : [String]?
    var hint: String?
    var number:Int?
    @State var popUp = false
    var colour:Color{
        determineColorFromCategory(category: el.category)
    }
    
    var body: some View {
        // check if the gamemodel exists and then chooses right version
        if let guess = gues{
            if guess.contains(el.name){
               normalView
            }else{
                baseView.opacity(hint==el.name ? 0.85 : 0.6)
            }
        }else if (searchQuery != nil){
            if (searchQuery!.contains(el.name)){
                normalView
            }else{
                baseView.opacity(hint==el.name ? 0.85 : 0.6)
            }
        }
    }
// MARK: - The constructed peroidic table element
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
                    closeView
                    
                }
                .background(determineColorFromCategory(category: el.category).ignoresSafeArea())
            })
    }
// MARK: - The color square
    private var baseView: some View{
        colour
            .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 50 : 32, height: UIDevice.current.userInterfaceIdiom == .pad ? 50 : 32)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 4, height: 4)))
    }
// MARK: - Close button on popupView
    private var closeView: some View{
        VStack {
            HStack{
                Spacer()
                Button(action: {popUp = false}, label: {
                    Image(systemName: "multiply")
                        .font(.largeTitle)
                        .padding()
                        .foregroundStyle(Color.primary)
                        .background(Color.clear.ignoresSafeArea(.container, edges: .top))
                })
            }
            Spacer()
        }
    }
// MARK: - What is written in the square
    private var infoView: some View{
        VStack{
            Text(String(el.number))
                .font(.caption2)
            Text(el.symbol)
        }
        .foregroundStyle(determineColorFromPhase(phase: el.phase))
    }
}
