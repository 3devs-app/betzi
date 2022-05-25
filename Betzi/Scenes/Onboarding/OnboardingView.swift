//
//  OnboardingView.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 21.05.2022.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel

    var body: some View {
        VStack {
            Button(action: { viewModel.showEnterName() }) {
                Text("Push")
            }
        }
    }
}

struct OnboardingViewPreviews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: .init())
    }
}
