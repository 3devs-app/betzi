//
//  SelectableCircleView.swift
//  Betzi
//
//  Created by Daniel Yopla on 04.11.2022.
//

import SwiftUI

struct SelectableCircleView: View {
    let color: Color
    let isSelected: Bool

    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(color, lineWidth: 1)
                .frame(width: 20, height: 20)

            if isSelected {
                Circle()
                    .fill(color)
                    .frame(width: 10, height: 10)
            }
        }
    }
}

struct SelectableCircleViewPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            SelectableCircleView(
                color: .red,
                isSelected: false
            )
            .previewLayout(.sizeThatFits)

            SelectableCircleView(
                color: .green,
                isSelected: true
            )
            .previewLayout(.sizeThatFits)
        }
    }
}
