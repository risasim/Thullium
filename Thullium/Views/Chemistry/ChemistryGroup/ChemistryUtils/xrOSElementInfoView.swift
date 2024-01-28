//
//  xrOSElementInfoView.swift
//  Thullium
//
//  Created by Richard Šimoník on 28.01.2024.
//

import SwiftUI
import RealityKit

struct xrOSElementInfoView: View {
    var body: some View {
        Model3D(named: "element_003_lithium"){ phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let resolvedModel3D):
                resolvedModel3D
                    .resizable()
                    .scaledToFit()
                    
            case .failure(let error):
                Text(error.localizedDescription)
            @unknown default:
                Text("error")
            }
            
        }
    }
}

#Preview {
    xrOSElementInfoView()
}
