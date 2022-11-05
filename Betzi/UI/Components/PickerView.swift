//
//  PickerView.swift
//  Betzi
//
//  Created by Daniel Yopla on 05.11.2022.
//

import SwiftUI

struct PickerView: View {
    @Binding var isLoading: Bool
    @Binding var options: [String]
    @Binding var selectedOption: String?
    var tapAction: (Int) -> Void

    var body: some View {
        Menu {
            ForEach(options.indices, id: \.self) { index in
                Button(options[index], action: { tapAction(index) })
            }
        } label: {
            if isLoading {
                ProgressView()
            } else {
                HStack {
                    Text(selectedOption ?? "Pick an option")
                        .textStyle(.bodySmall)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "chevron.down")
                        .foregroundColor(Colors.primary.violet)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(.gray, lineWidth: 2)
                .background(.white)
        )
    }
}

struct PickerViewPreviews: PreviewProvider {
    static var previews: some View {
        PickerView(
            isLoading: .constant(true),
            options: .constant([]),
            selectedOption: .constant("World Cup"),
            tapAction: { _ in }
        )
        .previewLayout(.sizeThatFits)
    }
}
