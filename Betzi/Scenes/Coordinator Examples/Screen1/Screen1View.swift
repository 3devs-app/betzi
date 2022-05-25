//
//  Screen1View.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 24.05.2022.
//

import SwiftUI

struct Screen1View: View {
    @ObservedObject var viewModel: Screen1ViewModel

    var body: some View {
        VStack {
            Text("Screen 1")
            Button(action: { viewModel.continueTap() }, label: {
                Text("Push")
            })
        }
    }
}

struct Screen1ViewPreviews: PreviewProvider {
    static var previews: some View {
        Screen1View(viewModel: .init())
    }
}
