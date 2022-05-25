//
//  Flow2Screen1ViewModel.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 24.05.2022.
//

import Combine

class Flow2Screen1ViewModel: ObservableObject {
    let continueTapped = PassthroughSubject<Void, Never>()

    func continueTap() {
        continueTapped.send()
    }
}
