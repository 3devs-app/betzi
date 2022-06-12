//
//  TextStyle.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 12.06.2022.
//

import UIKit
import SwiftUI

enum TextStyle {
    case largeTitle
    case h1
    case h2
    case h3

    case body
    case bodyBold

    case bodySmall
    case bodySmallBold

    case smallLabel

    case buttonLabelLarge
    case buttonLabelSmall

    case tabBarLabel

    var uiFont: UIFont {
        switch self {
        case .largeTitle:
            return UIFont.systemFont(ofSize: 42, weight: .bold)
        case .h1:
            return UIFont.systemFont(ofSize: 32, weight: .bold)
        case .h2:
            return UIFont.systemFont(ofSize: 24, weight: .bold)
        case .h3:
            return UIFont.systemFont(ofSize: 20, weight: .bold)
        case .body:
            return UIFont.systemFont(ofSize: 24, weight: .regular)
        case .bodyBold:
            return UIFont.systemFont(ofSize: 24, weight: .bold)
        case .bodySmall:
            return UIFont.systemFont(ofSize: 18, weight: .regular)
        case .bodySmallBold:
            return UIFont.systemFont(ofSize: 18, weight: .bold)
        case .smallLabel:
            return UIFont.systemFont(ofSize: 12, weight: .regular)
        case .buttonLabelLarge:
            return UIFont.systemFont(ofSize: 18, weight: .semibold)
        case .buttonLabelSmall:
            return UIFont.systemFont(ofSize: 14, weight: .semibold)
        case .tabBarLabel:
            return UIFont.systemFont(ofSize: 14, weight: .regular)
        }
    }

    var font: Font { Font(uiFont) }
}

struct TextModifier: ViewModifier {
    let textStyle: TextStyle

    func body(content: Content) -> some View {
        content
            .font(Font(textStyle.uiFont))
    }
}

extension View {
    func textStyle(_ textStyle: TextStyle) -> some View {
        modifier(TextModifier(textStyle: textStyle))
    }
}
