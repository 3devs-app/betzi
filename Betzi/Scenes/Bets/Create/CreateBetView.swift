//
//  CreateBetView.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 13.08.2022.
//

import SwiftUI

struct CreateBetView: View {
    @ObservedObject var viewModel: CreateBetViewModel
    @State private var textSizeClassicBet: CGSize = .zero

    var body: some View {
        VStack(spacing: .large) {
            ProgressBar(value: .constant(0.3))

            scrollableContent
        }
        .padding(.horizontal, .medium)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { print("closing") }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Colors.primary.midnightBlue)
                })
            }
        }
        .background(Colors.neutrals.neutral03.color.ignoresSafeArea())
    }

    private var scrollableContent: some View {
        ScrollView {
            VStack(spacing: .large) {
                Text("Bet type")
                    .textStyle(.h2)
                    .foregroundColor(Colors.primary.midnightBlue)
                    .frame(maxWidth: .infinity, alignment: .leading)

                classicBet

                customBet

                Divider()

                Text("Tournament")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .textStyle(.bodySmallBold)

                Spacer()

                Button(action: { print("Next") }, label: {
                    Text("Next")
                        .textStyle(.h3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Colors.primary.violet)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                })
            }
        }
    }

    private var classicBet: some View {
        HStack(spacing: .medium) {
            Circle()
                .fill(Colors.primary.violet)
                .frame(width: 56, height: 56)

            VStack(alignment: .leading, spacing: .medium) {
                Text("Classic bet")
                    .foregroundColor(Colors.primary.violet)
                    .textStyle(.bodySmallBold)

                Text("Select the top 4 teams for the Worldcup")
                    .readSize(onChange: { textSizeClassicBet = $0 })
                    .foregroundColor(Colors.primary.midnightBlue)
                    .textStyle(.bodySmall)
            }

            ZStack {
                Circle()
                    .strokeBorder(Colors.primary.violet.color, lineWidth: 1)
                    .frame(width: 20, height: 20)

                Circle()
                    .fill(Colors.primary.violet)
                    .frame(width: 10, height: 10)
            }
        }
        .padding(.vertical, .large)
        .frame(maxWidth: .infinity)
        .background(
            Colors.bets.classic.color
                .cornerRadius(16)
        )
    }

    private var customBet: some View {
        HStack(spacing: .medium) {
            Circle()
                .fill(Colors.primary.midnightBlue)
                .frame(width: 56, height: 56)

            VStack(alignment: .leading, spacing: .medium) {
                Text("Custom bet")
                    .foregroundColor(Colors.primary.midnightBlue)
                    .textStyle(.bodySmallBold)

                Text("Customize the bet and prize as you wish")
                    .frame(width: textSizeClassicBet.width, alignment: .leading)
                    .foregroundColor(Colors.primary.midnightBlue)
                    .textStyle(.bodySmall)
            }

            ZStack {
                Circle()
                    .strokeBorder(Colors.primary.midnightBlue.color, lineWidth: 1)
                    .frame(width: 20, height: 20)

                Circle()
                    .fill(Colors.primary.midnightBlue)
                    .frame(width: 10, height: 10)
            }
        }
        .padding(.vertical, .large)
        .frame(maxWidth: .infinity)
        .background(
            Colors.bets.custom.color
                .cornerRadius(16)
        )
    }
}

extension HorizontalAlignment {
    private enum LeftBets: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.height
        }
    }

    static let leftBets = HorizontalAlignment(LeftBets.self)
}

struct CreateBetViewPreviews: PreviewProvider {
    static var previews: some View {
        CreateBetView(viewModel: .init())
    }
}
