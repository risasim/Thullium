//
//  MoleculeView.swift
//  Thullium
//
//  Created by Richard Šimoník on 30.01.2024.
//

import SwiftUI
import RealityKit
import ARKit

struct MoleculeView: View {
    var body: some View {
       Model3D(named: "element_003_lithium")
            //.resizable()
    }
}

#Preview {
    MoleculeView()
}
