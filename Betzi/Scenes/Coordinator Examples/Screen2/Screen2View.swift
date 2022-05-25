//
//  Screen2View.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 24.05.2022.
//

import SwiftUI

struct Screen2View: View {
    @ObservedObject var viewModel: Screen2ViewModel

    var body: some View {
        VStack {
            Text("Screen 2")
            Button(action: { viewModel.continueTap() }, label: {
                Text("finish")
            })
            Button(action: { viewModel.dismissTap() }, label: {
                Text("dismiss")
            })
        }
    }
}

struct Screen2ViewPreviews: PreviewProvider {
    static var previews: some View {
        Screen2View(viewModel: .init())
    }
}
