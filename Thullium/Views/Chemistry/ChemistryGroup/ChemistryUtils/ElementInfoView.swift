//
//  ElementInfoView.swift
//  FlashCards
//
//  Created by Richard on 15.09.2023.
//

import SwiftUI


/// View presenting data about element
struct ElementInfoView: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    var element:Element
    var body: some View {
        ZStack {
            Color(determineColorFromCategory(category: element.category))
                .ignoresSafeArea()
            ScrollView{
                InfoSign(info: element)
                    .frame(width: 220, height: 220)
                    .padding()
                VStack{
                    InfoBasic(info: element)
                        .padding()
                    Divider()
                    Text(LocalizedStringKey(element.summary))
                        .padding()
                    Divider()
                    ScrollView(.horizontal) {
                        HStack{
                            InfoImage(image: element.image)
                            InfoImage(image: ElementImage(title: "Bohr Model", url: element.bohr_model_image ?? "/", attribution: ""))
                        }
                    }
                    Divider()
                    #if os(visionOS)
                    Button {
                        openWindow(id:"molecule")
                    } label: {
                        Text("Show the molecule")
                    }
                    .padding()
                    #endif
                }
                .background{
                    RoundedRectangle(cornerRadius: 20.0, style: .circular)
                        .foregroundStyle(.regularMaterial)
                }
                    
            }
            .scrollIndicators(.hidden)
           // .background(determineColorFromCategory(category: element.category).opacity(0.7))
        }
    }
}

#Preview {
    ElementInfoView(element: JSONtoSwiftDataconverter().eData[50])
        .environment(\.locale, .init(identifier: "cs"))
}
