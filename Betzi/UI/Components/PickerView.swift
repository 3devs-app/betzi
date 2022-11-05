//
//  PickerView.swift
//  Betzi
//
//  Created by Daniel Yopla on 05.11.2022.
//

import SwiftUI

struct PickerView: View {
    @Binding var isLoading: Bool

    var body: some View {
        HStack {
            Text("World Cup")
                .textStyle(.bodySmall)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "chevron.down")
                .foregroundColor(Colors.primary.violet)
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
        PickerView(isLoading: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
