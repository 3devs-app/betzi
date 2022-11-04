//
//  ButtonMainStyle.swift
//  Betzi
//
//  Created by Daniel Yopla on 04.11.2022.
//

import SwiftUI

struct ButtonMainStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textStyle(.h3)
            .padding()
            .frame(maxWidth: .infinity)
            .background(configuration.isPressed ? Colors.primary.violet.color.opacity(0.6) : Colors.primary.violet.color)
            .foregroundColor(.white)
            .cornerRadius(16)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}
