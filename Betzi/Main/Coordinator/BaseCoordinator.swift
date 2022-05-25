//
//  BaseCoordinator.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 23.05.2022.
//

import Foundation
import Combine

protocol PopHandler {
    var dismissPublisher: PassthroughSubject<Void, Never> { get }
}

protocol DismissHandler {
    var dismissPublisher: PassthroughSubject<Void, Never> { get }
}

class BaseCoordinator<Result>: Coordinator {
    let identifier = UUID()
    private var childCoordinators = [UUID: Any]()

    func start() -> AnyPublisher<Result, Never> {
        fatalError("Start method should be implemented")
    }

    func coordinate<T: Coordinator, U>(to coordinator: T) -> AnyPublisher<U, Never> where U == T.Result {
        store(coordinator: coordinator)
        return coordinator.start()
            .handleEvents(receiveOutput: { [weak self] _ in self?.free(coordinator: coordinator) })
            .eraseToAnyPublisher()
    }

    func dismissObservable(with popHandler: PopHandler, dismissHandler: DismissHandler) -> AnyPublisher<Void, Never> {
        let popped = popHandler.dismissPublisher
        let dismissed = dismissHandler.dismissPublisher
        return Publishers.Merge(popped, dismissed).eraseToAnyPublisher()
    }

    private func store<T: Coordinator>(coordinator: T) {
        childCoordinators[coordinator.identifier] = coordinator
    }

    private func free<T: Coordinator>(coordinator: T) {
        childCoordinators[coordinator.identifier] = nil
    }
}
