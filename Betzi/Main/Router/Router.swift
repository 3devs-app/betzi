//
//  Router.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 23.05.2022.
//

import Foundation
import UIKit

enum RouterResult<T> {
    case dismiss
    case dismissedByRouter
    case finished(T)
}

protocol Router: DismissHandler {
    func present(_ viewController: UIViewController)
    func dismiss(completion: (() -> Void)?)
}

protocol FlowRouter: Router {}
