//
//  IndependentScreenViewModel.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 24.05.2022.
//

import Combine

class IndependentScreenViewModel: ObservableObject {
    let continueTapped = PassthroughSubject<Void, Never>()

    func continueTap() {
        continueTapped.send()
    }
}
