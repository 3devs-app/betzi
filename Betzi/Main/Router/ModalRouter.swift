//
//  ModalRouter.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 23.05.2022.
//

import UIKit
import Combine

final class ModalRouter: NSObject, UIPopoverPresentationControllerDelegate, UIAdaptivePresentationControllerDelegate, DismissHandler {
    let dismissPublisher: PassthroughSubject<Void, Never> = .init()

    private let parentViewController: UIViewController
    private let presentationStyle: UIModalPresentationStyle
    private let transitionStyle: UIModalTransitionStyle?

    init(parentViewController: UIViewController,
         presentationStyle: UIModalPresentationStyle = .automatic,
         transitionStyle: UIModalTransitionStyle? = nil) {
        self.parentViewController = parentViewController
        self.presentationStyle = presentationStyle
        self.transitionStyle = transitionStyle
    }
}

extension ModalRouter: Router {
    func present(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = presentationStyle
        viewController.presentationController?.delegate = self

        if let transitionStyle = transitionStyle {
            viewController.modalTransitionStyle = transitionStyle
        }

        parentViewController.definesPresentationContext = true
        parentViewController.present(viewController,
                                     animated: true,
                                     completion: nil)

    }

    func dismiss(completion: (() -> Void)?) {
        parentViewController.dismiss(animated: true, completion: completion)
    }

    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        dismissPublisher.send()
    }
}
