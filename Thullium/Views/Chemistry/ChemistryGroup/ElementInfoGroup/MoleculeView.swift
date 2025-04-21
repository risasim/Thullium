//
//  MoleculeView.swift
//  Thullium
//
//  Created by Richard Šimoník on 30.01.2024.
//

import SwiftUI
import RealityKit
import ARKit

#if os(visionOS)
struct MoleculeView: View {
    var usdzLink:String
    var body: some View {
        Model3D(url: URL(string: usdzLink)!){model in
            model
                .resizable()
                .aspectRatio(contentMode: .fit)
        }placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    MoleculeView(usdzLink: "https://storage.googleapis.com/thullium_assets/element_002_helium.usdz")
}
#endif
