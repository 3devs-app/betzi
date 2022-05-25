//
//  OnboardingView3.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 23.05.2022.
//

import SwiftUI

struct OnboardingView3: View {
    @ObservedObject var viewModel: OnboardingViewModel3

    var body: some View {
        VStack {
            Button(action: { viewModel.finishTap() }) {
                Text("Finish flow")
            }
        }
    }
}

struct OnboardingView3ViewPreviews: PreviewProvider {
    static var previews: some View {
        OnboardingView3(viewModel: .init())
    }
}
