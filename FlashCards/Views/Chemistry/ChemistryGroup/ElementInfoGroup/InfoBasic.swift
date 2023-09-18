//
//  InfoBasic.swift
//  FlashCards
//
//  Created by Richard on 16.09.2023.
//

import SwiftUI

struct InfoBasic: View {
    
    var info:Element
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                VStack(alignment:.leading){
                    Text(info.category.capitalized)
                        .bold()
                        .padding(.leading)
                    Text("Category")
                        .font(.footnote)
                        .padding(.leading)
                }
                Spacer()
                Link(destination: URL(string: info.source)!) {
                    Label("Wikipedia", systemImage: "arrow.up.right")
                        .font(.footnote)
                        .padding(.trailing)
                }
            }
            Divider()
            HStack{
                VStack(alignment: .leading,content: {
                    VStack(alignment: .leading,content: {
                        Text(info.phase)
                            .bold()
                        Text("Phase")
                            .font(.footnote)
                    })
                    VStack(alignment: .leading,content: {
                        Text(String(format: "%.1f",info.boil ?? "-"))
                            .bold()
                        Text("Boiling point(K)")
                            .font(.footnote)
                    })
                    
                })
                Spacer()
                VStack(alignment: .leading,content: {
                    VStack(alignment: .leading,content: {
                        Text(String(format: "%.3f",info.atomic_mass))
                            .bold()
                        Text("Mass (AMU)")
                            .font(.footnote)
                    })
                    VStack(alignment: .leading,content: {
                        Text(String(format: "%.1f",info.melt ?? "-"))
                            .bold()
                        Text("Melting point(K)")
                            .font(.footnote)
                    })
                })
                Spacer()
                VStack(alignment: .leading,content: {
                    VStack(alignment: .leading,content: {
                        Text(String(format: "%.2f",info.electronegativity_pauling ?? "-"))
                            .bold()
                        Text("Electronegativity")
                            .font(.footnote)
                    })
                    VStack(alignment: .leading,content: {
                        Text(info.electron_configuration_semantic)
                            .bold()
                        Text("Elecron config.")
                            .font(.footnote)
                    })
                })
            }
            .padding([.leading, .trailing])
        }
    }
}

#Preview {
    InfoBasic(info: JSONtoSwiftDataconverter().eData[56])
}
