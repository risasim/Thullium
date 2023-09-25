//
//  ReusableFunc.swift
//  FlashCards
//
//  Created by Richard on 17.09.2023.
//

import Foundation
import SwiftUI
import TipKit


// MARK: - Global constants
let feedbackGenerator = UINotificationFeedbackGenerator()
var openedFirstTime = UserDefaults.standard.bool(forKey: "sound")
let allCategories = ["noble gas", "diatomic nonmetal", "alkali metal", "alkaline earth metal", "metalloid", "post-transition metal",  "lanthanide", "transition metal", "actinide", "reactive nonmetal", "polyatomic nonmetal", "unknown"]

// MARK: - Global functions
func determineColorFromCategory(category cat: String) ->Color{
    switch cat{
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
    case "polyatomic nonmetal":
        return .green
    default:
        return .gray
    }
}

func determineColorFromPhase(phase: String)-> Color{
    switch phase{
    case "Solid":
        return .black.opacity(0.5)
    case "Liquid":
        return .white
    case "Gas":
        return .black
    default:
        return .primary
    }
}

// MARK: - Tips
struct ClickableTip: Tip {
    var title: Text {
        Text("Tap to explore")
    }


    var message: Text? {
        Text("Tap to see details about element.")
    }


    var image: Image? {
        Image(systemName: "hand.tap")
    }
}

func mayuselater(){
    
    let els = ElementsData(elements: [])
    if openedFirstTime{
        let elements = JSONtoSwiftDataconverter().eData
        elements.forEach { el in
            let element = ElementData(name: el.name, appearance: el.appearance, atomic_mass: el.atomic_mass, boil: el.boil, category: el.category, number: el.number, period: el.period, group: el.group, phase: el.phase, source: el.source, summary: el.summary, symbol: el.symbol, xpos: el.xpos, ypos: el.ypos, wxpos: el.wxpos, wypos: el.wypos, shells: el.shells, electron_cofiguration: el.electron_configuration, electron_configuration_semantic: el.electron_configuration_semantic, ionization_energies: el.ionization_energies, image: ImageData(title: el.image.title, url: el.image.url, attribution: el.image.attribution), block: el.block)
            els.elements.append(element)
        }
       // sharedModelContainer.mainContext.insert(els)
        openedFirstTime = true
    }

}

// MARK: - Reusable Views
struct CloseButtonView:View {
    
    @Binding var popUp:Bool
    
    var body: some View {
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
}


// MARK: - ViewModifiers
struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
