//
//  Onboarding2View.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 23.05.2022.
//

import SwiftUI

struct OnboardingView2: View {
    @ObservedObject var viewModel: OnboardingViewModel2

    var body: some View {
        VStack {
            Button(action: { viewModel.enterAgeTap() }) {
                Text("Another push")
            }
        }
    }
}

struct Onboarding2ViewPreviews: PreviewProvider {
    static var previews: some View {
        OnboardingView2(viewModel: .init())
    }
}
