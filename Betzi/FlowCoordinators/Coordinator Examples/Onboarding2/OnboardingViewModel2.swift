//
//  OnboardingViewModel2.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 23.05.2022.
//

import Combine

class OnboardingViewModel2: ObservableObject {
    let continueTap = PassthroughSubject<Void, Never>()

    func enterAgeTap() {
        continueTap.send()
    }
}
