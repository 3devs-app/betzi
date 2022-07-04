//
//  OnboardingView.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 21.05.2022.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    @State private var pageIndex = 0
    @State private var textsSize: CGSize = .zero

    var currentContent: Content {
        Content(rawValue: pageIndex) ?? .page1
    }

    var soccerBallYOffset: CGFloat {
        switch currentContent {
        case .page1:
            return -500
        case .page2:
            return 20
        case .page3:
            return 200
        }
    }

    var body: some View {
        ZStack {
            tabs

            header

            VStack(spacing: .xLarge) {
                signInWithAppleButton

                tabDots
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .padding(.large)
        .animation(.easeInOut, value: pageIndex)
        .backgroundIgnoringSafeArea(currentContent.backgroundColor, edges: .all)
        .navigationBarHidden(true)
    }

    private var header: some View {
        HStack {
            Text(String(currentContent.id + 1))
                .textStyle(.largeTitle)
                .foregroundColor(currentContent.foregroundColor)
                .frame(maxWidth: .infinity, alignment: .leading)

            Images.onboarding.soccerBall.image
                .offset(y: soccerBallYOffset)
                .animation(.spring(response: 1, dampingFraction: 0.6, blendDuration: 0.5), value: pageIndex)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }

    private var tabs: some View {
        TabView(selection: $pageIndex) {
            ForEach(Content.allCases) { content in
                makePage(with: content)
                    .tag(content.id)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }

    private var tabDots: some View {
        HStack(spacing: .xSmall) {
            ForEach(Content.allCases) { content in
                Circle()
                    .fill(Colors.primary.white)
                    .opacity(content.id == pageIndex ? 1 : 0.5)
                    .frame(width: 8, height: 8)
            }
        }
    }

    private var signInWithAppleButton: some View {
        Button(action: { print("Sign in with Apple") }, label: {
            HStack {
                Image(systemName: "applelogo")
                Text("Sign in with Apple")
                    .textStyle(.buttonLabelLarge)
            }
            .frame(maxWidth: .infinity)
        })
        .padding()
        .foregroundColor(Colors.primary.white)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Colors.primary.midnightBlue)
        )
        .padding(.horizontal, .medium)
    }

    @ViewBuilder private func makePage(with content: Content) -> some View {
        VStack(alignment: .leading, spacing: .medium) {
            Text(content.title)
                .textStyle(.largeTitle)

            Text(content.subtitle)
                .textStyle(.body)
                .padding(.bottom, .large)

            Text(content.description)
                .textStyle(.bodyBold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .readSize(onChange: { size in
            if size.height > textsSize.height {
                textsSize = size
            }
        })
        .foregroundColor(currentContent.foregroundColor)
    }
}

struct OnboardingViewPreviews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: .init())
    }
}
