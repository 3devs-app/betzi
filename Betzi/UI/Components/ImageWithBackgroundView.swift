//
//  ImageWithBackgroundView.swift
//  Betzi
//
//  Created by Daniel Yopla on 05.11.2022.
//

import SwiftUI

struct ImageWithBackgroundView: View {
    let image: Image
    let color: Color
    let backgroundWidth: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: backgroundWidth, height: backgroundWidth)

            image
        }
    }
}
