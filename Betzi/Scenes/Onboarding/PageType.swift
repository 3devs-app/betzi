//
//  PageType.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 04.07.2022.
//

import SwiftUI
import Rswift

extension OnboardingView {
    enum PageType: Int, Identifiable, CaseIterable {
        case page1 = 0
        case page2
        case page3

        var id: Int { rawValue }

        var title: String {
            switch self {
            case .page1:
                return "Start \nbetting \nwith Betzi"
            case .page2:
                return "World \ncup"
            case .page3:
                return "Customize \nyour bets"
            }
        }

        var subtitle: String {
            switch self {
            case .page1:
                return "and have fun!"
            case .page2:
                return "and more coming!"
            case .page3:
                return "and invite your friends to play"
            }
        }

        var description: String {
            switch self {
            case .page1:
                return "Classic, custom bets and mini bets between friends"
            case .page2:
                return "Win betting during your favorite leagues"
            case .page3:
                return "You can also create mini bets between matches"
            }
        }

        var soccerBallYOffset: CGFloat {
            switch self {
            case .page1:
                return -500
            case .page2:
                return 20
            case .page3:
                return 200
            }
        }

        var backgroundColor: ColorResource {
            switch self {
            case .page1:
                return Colors.accents.yellowAmber
            case .page2:
                return Colors.accents.greenSoccerField
            case .page3:
                return Colors.accents.cyanBaby
            }
        }

        var foregroundColor: ColorResource {
            switch self {
            case .page1:
                return Colors.primary.midnightBlue
            case .page2, .page3:
                return Colors.primary.white
            }
        }
    }
}
