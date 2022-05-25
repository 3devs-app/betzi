//
//  NavigationRouter.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 23.05.2022.
//

import UIKit
import SwiftUI
import Combine

public final class NavigationRouter: NSObject, DismissHandler {
    let dismissPublisher: PassthroughSubject<Void, Never> = .init()

    private let navigationController: UINavigationController

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - Router

extension NavigationRouter: FlowRouter {
    enum PopAction {
        case toRoot
        case toParent
        case toViewController(UIViewController)
    }

    func present(_ viewController: UIViewController) {
        if navigationController.viewControllers.isEmpty {
            navigationController.viewControllers = [viewController]
        } else {
            navigationController.pushViewController(viewController, animated: true)
        }
    }

    func dismiss(completion: (() -> Void)?) {
        pop(.toParent, completion: completion)
    }

    func pop(_ popAction: PopAction, completion: (() -> Void)?) {
        switch popAction {
        case .toViewController(let viewController):
            navigationController.popToViewController(viewController, animated: true)
        case .toRoot:
            navigationController.popToRootViewController(animated: true)
        case .toParent:
            navigationController.popViewController(animated: true)
        }

        completion?()
    }
}
