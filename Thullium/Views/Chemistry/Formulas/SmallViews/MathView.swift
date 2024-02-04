//
//  MathView.swift
//  Thullium
//
//  Created by Richard on 04.02.2024.
//

import SwiftUI
import SwiftMath

struct MathView: UIViewRepresentable {

    var equation: String
    var fontSize: CGFloat
    
    func makeUIView(context: Context) -> MTMathUILabel {
        let view = MTMathUILabel()
        return view
    }
    
    func updateUIView(_ uiView: MTMathUILabel, context: Context) {
        uiView.latex = equation
       // uiView.fontSize = fontSize
       // uiView.font = MTFontManager().termesFont(withSize: fontSize)
        uiView.textAlignment = .center
        uiView.labelMode = .text
        uiView.textColor = UIColor { tc in
            switch tc.userInterfaceStyle {
            case .dark:
                return UIColor.white
            default:
                return UIColor.black
            }
        }
    }
}


#Preview {
    MathView(equation: "N_{A}=6.022 140 76 \times 10^{-23}  mol^{-1}", fontSize: 15.0)
}
