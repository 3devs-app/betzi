//
//  Screen2ViewModel.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 24.05.2022.
//

import Combine

class Screen2ViewModel: ObservableObject {
    let finishTapped = PassthroughSubject<Void, Never>()
    let dismissTapped = PassthroughSubject<Void, Never>()

    func continueTap() {
        finishTapped.send()
    }

    func dismissTap() {
        dismissTapped.send()
    }
}
