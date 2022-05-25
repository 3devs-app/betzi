//
//  IndependentScreenView.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 24.05.2022.
//

import SwiftUI

struct IndependentScreenView: View {
    @ObservedObject var viewModel: IndependentScreenViewModel

    var body: some View {
        VStack {
            Text("Independent screen")
        }
    }
}

struct IndependentScreenViewPreviews: PreviewProvider {
    static var previews: some View {
        IndependentScreenView(viewModel: .init())
    }
}
