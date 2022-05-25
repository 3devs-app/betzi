//
//  OnboardingViewModel.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 21.05.2022.
//

import Combine

class OnboardingViewModel: ObservableObject {
    let enterNameTapped = PassthroughSubject<Void, Never>()

    func showEnterName() {
        enterNameTapped.send()
    }
}
