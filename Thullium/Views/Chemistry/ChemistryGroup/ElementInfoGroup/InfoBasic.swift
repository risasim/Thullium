//
//  InfoBasic.swift
//  FlashCards
//
//  Created by Richard on 16.09.2023.
//

import SwiftUI

// Presenting basic information about element. Contains link to wikipedia
struct InfoBasic: View {
    
    var info:Element
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                VStack(alignment:.leading){
                    Text(LocalizedStringKey(info.category))
                        .bold()
                        .padding(.leading)
                    Text(LocalizedStringKey("Category"))
                        .font(.footnote)
                        .padding(.leading)
                }
                Spacer()
                Link(destination: URL(string: info.source)!) {
                    Label(LocalizedStringKey("Wikipedia"), systemImage: "arrow.up.right")
                        .font(.footnote)
                        .padding(.trailing)
                }
            }
            Divider()
            HStack{
                VStack(alignment: .leading,content: {
                    VStack(alignment: .leading,content: {
                        Text(LocalizedStringKey(info.phase))
                            .bold()
                        Text(LocalizedStringKey("Phase"))
                            .font(.footnote)
                    })
                    VStack(alignment: .leading,content: {
                        Text(String(format: "%.1f",info.boil ?? "-"))
                            .bold()
                        Text(LocalizedStringKey("Boiling point(K)"))
                            .font(.footnote)
                    })
                    
                })
                Spacer()
                VStack(alignment: .leading,content: {
                    VStack(alignment: .leading,content: {
                        Text(String(format: "%.3f",info.atomic_mass))
                            .bold()
                        Text(LocalizedStringKey("Mass (AMU)"))
                            .font(.footnote)
                    })
                    VStack(alignment: .leading,content: {
                        Text(String(format: "%.1f",info.melt ?? "-"))
                            .bold()
                        Text(LocalizedStringKey("Melting point(K)"))
                            .font(.footnote)
                    })
                })
                Spacer()
                VStack(alignment: .leading,content: {
                    VStack(alignment: .leading,content: {
                        Text(String(format: "%.2f",info.electronegativity_pauling ?? "-"))
                            .bold()
                        Text(LocalizedStringKey("Electronegativity"))
                            .font(.footnote)
                    })
                    VStack(alignment: .leading,content: {
                        Text(info.electron_configuration_semantic)
                            .bold()
                            .scaledToFit()
                            .minimumScaleFactor(0.01)
                            .lineLimit(1)
                        Text(LocalizedStringKey("Electron config."))
                            .font(.footnote)
                    })
                })
            }
            .padding([.leading, .trailing])
        }
        #if os(visionOS)
       // .background(.regularMaterial,in: .rect(cornerSize: 4))
        #endif
    }
}

#Preview {
    InfoBasic(info: JSONtoSwiftDataconverter().eData[0])
        .environment(\.locale, .init(identifier: "cs"))
}
