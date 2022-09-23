//
//  ProgressBar.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 13.08.2022.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: CGFloat
    @State private var size: CGSize = .zero

    private enum UIProperties {
        static let height: CGFloat = 16
        static let cornerRadius: CGFloat = 8
    }

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: UIProperties.cornerRadius)
                .fill(Colors.primary.midnightBlue)
                .frame(height: UIProperties.height)
                .opacity(0.1)

            RoundedRectangle(cornerRadius: UIProperties.cornerRadius)
                .fill(Colors.primary.midnightBlue)
                .frame(width: size.width * value, height: UIProperties.height)
        }
        .readSize { size = $0 }
    }
}

struct ProgressBarPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            ProgressBar(value: .constant(0.7))
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Default preview")

            ProgressBar(value: .constant(0))
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Empty preview")
            
            ProgressBar(value: .constant(1))
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("Fill preview")
        }
    }
}
