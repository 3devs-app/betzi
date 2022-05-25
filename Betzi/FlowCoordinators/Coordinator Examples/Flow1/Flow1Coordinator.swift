//
//  Flow1Coordinator.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 24.05.2022.
//

import Combine
import UIKit

class Flow1Coordinator: BaseCoordinator<RouterResult<Void>> {
    private let router: FlowRouter
    private var cancellables = Set<AnyCancellable>()

    init(router: FlowRouter) {
        self.router = router
    }

    override func start() -> AnyPublisher<RouterResult<Void>, Never> {
        let flow1ViewModel = Screen1ViewModel()
        let flow1ViewController = BaseViewController(rootView: Screen1View(viewModel: flow1ViewModel))

        router.present(flow1ViewController)

        let result = flow1ViewModel.continueTapped
            .flatMap { [weak self] _ in
                self!.showSecondScreen()
            }

        let dismissByRouter = dismissObservable(with: flow1ViewController, dismissHandler: router)
            .map { RouterResult<Void>.dismissedByRouter }

        return Publishers.Merge(result, dismissByRouter)
            .eraseToAnyPublisher()
    }

    private func showSecondScreen() -> AnyPublisher<RouterResult<Void>, Never> {
        let screen2ViewModel = Screen2ViewModel()
        let screen2ViewController = BaseViewController(rootView: Screen2View(viewModel: screen2ViewModel))

        router.present(screen2ViewController)

        let finish = screen2ViewModel.finishTapped
            .map { RouterResult<Void>.finished(()) }

        screen2ViewModel.dismissTapped
            .sink { [weak self] _ in
                self?.router.dismiss(completion: nil)
            }
            .store(in: &cancellables)

        return finish
            .eraseToAnyPublisher()
    }
}
