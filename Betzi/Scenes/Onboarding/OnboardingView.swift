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
        VStack(alignment: .leading, spacing: 16) {
            Text("Start \nbetting \nwith Betzi")
                .textStyle(.largeTitle)
            Text("and have fun!")
                .textStyle(.body)
            Text("Classic, custom bets and mini bets between friends")
                .textStyle(.bodyBold)

            Button(action: { print("Sign in with Apple") }, label: {
                HStack {
                    Image(systemName: "applelogo")
                    Text("Sign in with Apple")
                        .textStyle(.buttonLabelLarge)
                }
                .frame(maxWidth: .infinity)
            })
            .padding()
            .foregroundColor(Colors.white)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Colors.midnightBlue)
            )
            .padding(.horizontal, .medium)
        }
        .foregroundColor(Colors.midnightBlue)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.medium)
        .backgroundIgnoringSafeArea(Colors.yellowAmber, edges: .all)
    }
}

struct OnboardingViewPreviews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: .init())
    }
}
