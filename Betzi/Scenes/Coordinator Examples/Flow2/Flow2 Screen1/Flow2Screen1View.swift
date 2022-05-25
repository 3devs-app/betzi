//
//  Flow2Screen1View.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 24.05.2022.
//

import SwiftUI

struct Flow2Screen1View: View {
    @ObservedObject var viewModel: Flow2Screen1ViewModel

    var body: some View {
        VStack {
            Text("Flow1")
            Button(action: { viewModel.continueTap() }, label: {
                Text("Push")
            })
        }
    }
}

struct Flow2Screen1ViewPreviews: PreviewProvider {
    static var previews: some View {
        Flow2Screen1View(viewModel: .init())
    }
}
