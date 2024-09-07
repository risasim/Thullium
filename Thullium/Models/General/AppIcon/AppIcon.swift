//
//  AppIcon.swift
//  Thullium
//
//  Created by Richard on 07.09.2024.
//

import Foundation
import SwiftUI

enum AppIcon: String, CaseIterable, Identifiable {
    case primary = "AppIcon"
    case lightMode = "AltIcon1"
    case original = "AltIcon2"

    var id: String { rawValue }
    var iconName: String? {
        switch self {
        case .primary:
            /// `nil` is used to reset the app icon back to its primary icon.
            return nil
        default:
            return rawValue
        }
    }

    var description: String {
        switch self {
        case .primary:
            return "AppIconDesc"
        case .lightMode:
            return "AltIcon1Desc"
        case .original:
            return "AltIcon2Desc"
        }
    }

    var preview: UIImage {
        UIImage(named: rawValue) ?? UIImage()
    }
}
