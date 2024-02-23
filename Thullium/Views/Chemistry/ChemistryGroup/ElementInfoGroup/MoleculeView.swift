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
     //   Model3D(named: "element_003_lithium"){model in
     //       model
     //           .resizable()
     //
     //   }placeholder: {
     //       ProgressView()
     //   }
        Model3D(url: URL(string: usdzLink)!){model in
            model
                .resizable()
        }placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    MoleculeView(usdzLink: "https://storage.googleapis.com/thullium_assets/element_002_helium.usdz")
}
#endif
