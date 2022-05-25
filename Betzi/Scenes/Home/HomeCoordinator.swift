//
//  HomeCoordinator.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 23.05.2022.
//

import Combine
import UIKit

final class HomeCoordinator: BaseCoordinator<Void> {
    private let window: UIWindow
    private let navigationController = UINavigationController()
    private let router: NavigationRouter
    private var cancellables = Set<AnyCancellable>()

    init(window: UIWindow) {
        self.window = window
        self.router = NavigationRouter(navigationController: navigationController)
    }

    override func start() -> AnyPublisher<Void, Never> {
        let viewModel = HomeViewModel()
        let viewController = BaseViewController(rootView: HomeView(viewModel: viewModel))
        router.present(viewController)

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        viewModel
            .presentFlow1Tapped
            .flatMap { [weak self] _ in
                self!.showFlow1(viewController: viewController)
            }
            .sink(receiveValue: { _ in })
            .store(in: &cancellables)

        viewModel
            .presentFlow2Tapped
            .flatMap { [weak self] _ in
                self!.showFlow2()
            }
            .sink(receiveValue: { _ in })
            .store(in: &cancellables)

        viewModel
            .presentIndependentModal
            .flatMap { [weak self] _ in
                self!.showIndependentModal(viewController: viewController)
            }
            .sink(receiveValue: { _ in })
            .store(in: &cancellables)

        viewModel
            .presentIndependentPush
            .flatMap { [weak self] _ in
                self!.showIndependentPush()
            }
            .sink(receiveValue: { _ in })
            .store(in: &cancellables)

        return Empty().eraseToAnyPublisher()
    }

    private func showFlow1(viewController: UIViewController) -> AnyPublisher<RouterResult<Void>, Never> {
        let modalNavigationRouter = ModalNavigationRouter(parentViewController: viewController)
        return coordinate(to: Flow1Coordinator(router: modalNavigationRouter))
            .handleEvents(receiveOutput: { result in
                switch result {
                case .finished:
                    modalNavigationRouter.perform(.dismiss, animated: true)
                case .dismiss:
                    modalNavigationRouter.dismiss(completion: nil)
                case .dismissedByRouter:
                    break
                }
            })
            .prefix(1)
            .eraseToAnyPublisher()
    }

    private func showFlow2() -> AnyPublisher<RouterResult<Void>, Never> {
        return coordinate(to: Flow2Coordinator(router: router))
            .handleEvents(receiveOutput: { [weak self] result in
                switch result {
                case .finished:
                    self?.router.pop(.toRoot, completion: nil)
                case .dismiss:
                    self?.router.dismiss(completion: nil)
                case .dismissedByRouter:
                    break
                }
            })
            .prefix(1)
            .eraseToAnyPublisher()
    }

    private func showIndependentModal(viewController: UIViewController) -> AnyPublisher<RouterResult<Void>, Never> {
        let modalRouter = ModalRouter(parentViewController: viewController)
        return coordinate(to: IndependentScreenCoordinator(router: modalRouter))
            .handleEvents(receiveOutput: { [weak self] result in
                switch result {
                case .finished:
                    self?.router.pop(.toRoot, completion: nil)
                case .dismiss:
                    self?.router.dismiss(completion: nil)
                case .dismissedByRouter:
                    break
                }
            })
            .prefix(1)
            .eraseToAnyPublisher()
    }

    private func showIndependentPush() -> AnyPublisher<RouterResult<Void>, Never> {
        return coordinate(to: IndependentScreenCoordinator(router: router))
            .handleEvents(receiveOutput: { [weak self] result in
                switch result {
                case .finished:
                    self?.router.pop(.toRoot, completion: nil)
                case .dismiss:
                    self?.router.dismiss(completion: nil)
                case .dismissedByRouter:
                    break
                }
            })
            .prefix(1)
            .eraseToAnyPublisher()
    }
}
