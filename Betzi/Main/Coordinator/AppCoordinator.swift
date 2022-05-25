//
//  AppCoordinator.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 23.05.2022.
//

import UIKit
import Combine

// TODO: manage dependencies
let userManager = UserManager()

final class AppCoordinator: BaseCoordinator<Void> {
    private let window: UIWindow
    private var cancellable: AnyCancellable?

    init(window: UIWindow) {
        self.window = window
    }

    override func start() -> AnyPublisher<Void, Never> {
        coordinateToRoot()
        return Empty().eraseToAnyPublisher()
    }

    private func coordinateToRoot() {
        let coordinateToScreen: AnyPublisher<Void, Never> = {
            switch userManager.state {
            case .signedOut:
                return self.showOnboarding()
            case .signedIn:
                return self.showHome()
            }
        }()

        cancellable = coordinateToScreen
            .sink(receiveValue: { [weak self] _ in
                self?.cancellable?.cancel()
                self?.window.rootViewController = nil
                self?.coordinateToRoot()
            })
    }

    private func showOnboarding() -> AnyPublisher<Void, Never> {
        coordinate(to: OnboardingFlowCoordinator(window: window))
    }

    private func showHome() -> AnyPublisher<Void, Never> {
        coordinate(to: HomeCoordinator(window: window))
    }
}
