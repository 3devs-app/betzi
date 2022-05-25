//
//  Coordinator.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 23.05.2022.
//

import Foundation
import Combine

protocol Coordinator {
    associatedtype Result

    var identifier: UUID { get }

    func start() -> AnyPublisher<Result, Never>
}

