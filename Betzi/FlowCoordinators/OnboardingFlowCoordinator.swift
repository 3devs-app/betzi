//
//  OnboardingFlowCoordinator.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 22.05.2022.
//

import Combine
import UIKit

class OnboardingFlowCoordinator: BaseCoordinator<Void> {
    private let window: UIWindow
    private let navigationController = UINavigationController()
    private let router: NavigationRouter
    private var cancellables = Set<AnyCancellable>()

    init(window: UIWindow) {
        self.window = window
        self.router = NavigationRouter(navigationController: navigationController)
    }

    override func start() -> AnyPublisher<Void, Never> {
        let onboardingViewModel = OnboardingViewModel()
        let onboardingViewController = BaseViewController(rootView: OnboardingView(viewModel: onboardingViewModel))

        router.present(onboardingViewController)

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        let result = onboardingViewModel.enterNameTapped
            .flatMap { [weak self] _ in
                self!.showOnboardingSecondScreen()
            }
            .flatMap { [weak self] _ in
                self!.showOnboardingThirdScreen()
            }

        return result
            .eraseToAnyPublisher()
    }

    private func showOnboardingSecondScreen() -> AnyPublisher<Void, Never> {
        let onboardingViewModel2 = OnboardingViewModel2()
        let onboardingViewController2 = BaseViewController(rootView: OnboardingView2(viewModel: onboardingViewModel2))
        router.present(onboardingViewController2)

        return onboardingViewModel2.continueTap
            .map { _ in }
            .eraseToAnyPublisher()
    }

    private func showOnboardingThirdScreen() -> AnyPublisher<Void, Never> {
        let onboardingViewModel3 = OnboardingViewModel3()
        let onboardingViewController3 = BaseViewController(rootView: OnboardingView3(viewModel: onboardingViewModel3))
        router.present(onboardingViewController3)

        return onboardingViewModel3.finishTapped
            .map { _ in }
            .eraseToAnyPublisher()
    }
}
