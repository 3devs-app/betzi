//
//  HomeViewModel.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 23.05.2022.
//

import Combine

class HomeViewModel: ObservableObject {
    let presentFlow1Tapped = PassthroughSubject<Void, Never>()
    let presentFlow2Tapped = PassthroughSubject<Void, Never>()
    let presentIndependentModal = PassthroughSubject<Void, Never>()
    let presentIndependentPush = PassthroughSubject<Void, Never>()

    func presentFlow1Tap() {
        presentFlow1Tapped.send()
    }

    func presentFlow2Tap() {
        presentFlow2Tapped.send()
    }
}
