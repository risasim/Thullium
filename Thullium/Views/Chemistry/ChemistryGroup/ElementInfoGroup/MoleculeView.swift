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
    var body: some View {
        Model3D(named: "element_003_lithium"){model in
            model
                .resizable()
                
        }placeholder: {
            ProgressView()
        }
          
    }
}

#Preview {
    MoleculeView()
}
#endif
