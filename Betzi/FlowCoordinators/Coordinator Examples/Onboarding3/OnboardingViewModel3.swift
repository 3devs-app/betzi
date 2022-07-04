//
//  OnboardingViewModel3.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 23.05.2022.
//

import Combine

class OnboardingViewModel3: ObservableObject {
    let finishTapped = PassthroughSubject<Void, Never>()

    func finishTap() {
        userManager.state = .signedIn
        finishTapped.send()
    }
}
