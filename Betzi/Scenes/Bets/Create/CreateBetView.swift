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

                Button("Next") {
                    print("button tap")
                }
                .buttonStyle(ButtonMainStyle())
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

            SelectableCircleView(
                color: Colors.primary.violet.color,
                isSelected: viewModel.selectedBetType == .classic
            )
        }
        .padding(.vertical, .large)
        .frame(maxWidth: .infinity)
        .background(
            Colors.bets.classic.color
                .cornerRadius(16)
        )
        .onTapGesture {
            viewModel.selectedBetType = .classic
        }
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

            SelectableCircleView(
                color: Colors.primary.midnightBlue.color,
                isSelected: viewModel.selectedBetType == .custom
            )
        }
        .padding(.vertical, .large)
        .frame(maxWidth: .infinity)
        .background(
            Colors.bets.custom.color
                .cornerRadius(16)
        )
        .onTapGesture {
            viewModel.selectedBetType = .custom
        }
    }
}

struct CreateBetViewPreviews: PreviewProvider {
    static var previews: some View {
        CreateBetView(viewModel: .init())
    }
}
