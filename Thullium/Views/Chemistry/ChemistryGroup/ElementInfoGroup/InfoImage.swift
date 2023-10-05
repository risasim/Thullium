//
//  ElementInfoImage.swift
//  FlashCards
//
//  Created by Richard on 16.09.2023.
//

import SwiftUI


/// Presenting image found in ``Element``
struct InfoImage: View {
    
    var image:ElementImage
    
    var body: some View {
        AsyncImage(url: URL(string: image.url)){phase in
            switch phase{
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case.empty:
                ProgressView()
            case.failure:
                Image(systemName: "wifi.slash")
            @unknown default:
                Color.gray
            }
        }
        .background(Color.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
        .padding()
    }
}

#Preview {
    InfoImage(image: JSONtoSwiftDataconverter().eData[68].image)
        .padding()
}
