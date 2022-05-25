//
//  IndependentScreenCoordinator.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 24.05.2022.
//

import Combine
import UIKit

final class IndependentScreenCoordinator: BaseCoordinator<RouterResult<Void>> {
    private let router: Router
    private var cancellables = Set<AnyCancellable>()

    init(router: Router) {
        self.router = router
    }

    override func start() -> AnyPublisher<RouterResult<Void>, Never> {
        let viewModel = IndependentScreenViewModel()
        let viewController = BaseViewController(rootView: IndependentScreenView(viewModel: viewModel))

        router.present(viewController)

        let dismissByRouter = dismissObservable(with: viewController, dismissHandler: router)
            .map { RouterResult<Void>.dismissedByRouter }

        let finish = viewModel.continueTapped
            .map { RouterResult<Void>.finished(()) }

        return Publishers.Merge(finish, dismissByRouter)
            .eraseToAnyPublisher()
    }
}
