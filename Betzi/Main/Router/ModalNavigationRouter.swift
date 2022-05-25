//
//  ModalNavigationRouter.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 24.05.2022.
//

import UIKit
import Combine

public final class ModalNavigationRouter: NSObject, UIPopoverPresentationControllerDelegate, UIAdaptivePresentationControllerDelegate, DismissHandler {
    let dismissPublisher: PassthroughSubject<Void, Never> = .init()

    private let parentViewController: UIViewController
    private let navigationController = UINavigationController()
    private let presentationStyle: UIModalPresentationStyle
    private let transitionStyle: UIModalTransitionStyle?

    // MARK: - Object Lifecycle

    public init(parentViewController: UIViewController,
                presentationStyle: UIModalPresentationStyle = .automatic,
                transitionStyle: UIModalTransitionStyle? = nil) {
        self.parentViewController = parentViewController
        self.presentationStyle = presentationStyle
        self.transitionStyle = transitionStyle
    }
}

// MARK: - Router

extension ModalNavigationRouter: FlowRouter {
    enum Action {
        case pop(NavigationRouter.PopAction)
        case dismiss
    }

    func present(_ viewController: UIViewController) {
        navigationController.modalPresentationStyle = presentationStyle
        navigationController.presentationController?.delegate = self

        if let transitionStyle = transitionStyle {
            viewController.modalTransitionStyle = transitionStyle
        }

        if navigationController.viewControllers.isEmpty {
            presentModally(viewController, animated: true)
        } else {
            navigationController.pushViewController(viewController, animated: true)
        }
    }

    private func presentModally(_ viewController: UIViewController, animated: Bool) {
        navigationController.setViewControllers([viewController], animated: false)
        parentViewController.present(navigationController,
                                     animated: animated,
                                     completion: nil)
    }

    func dismiss(completion: (() -> Void)?) {
        if navigationController.visibleViewController == navigationController.viewControllers.first {
            perform(.dismiss, animated: true, completion: completion)
        } else {
            perform(.pop(.toParent), animated: true, completion: completion)
        }
    }

    func perform(_ action: Action, animated: Bool, completion: (() -> Void)? = nil) {
        switch action {
        case .pop(.toViewController(let viewController)):
            navigationController.popToViewController(viewController, animated: animated)
        case .pop(.toRoot):
            navigationController.popToRootViewController(animated: animated)
        case .pop(.toParent):
            navigationController.popViewController(animated: animated)
        case .dismiss:
            parentViewController.dismiss(animated: animated, completion: { [weak self] in
                self?.navigationController.viewControllers = []
            })
        }

        completion?()
    }

    public func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        navigationController.viewControllers = []
        dismissPublisher.send()
    }
}
