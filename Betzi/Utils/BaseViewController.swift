//
//  BaseViewController.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 23.05.2022.
//

import SwiftUI
import Combine

class BaseViewController<RootView: View>: UIHostingController<RootView>, PopHandler {
    let dismissPublisher: PassthroughSubject<Void, Never> = .init()

    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        if parent == nil {
            dismissPublisher.send()
        }
    }
}
