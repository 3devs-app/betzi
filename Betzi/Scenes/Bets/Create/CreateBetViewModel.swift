//
//  CreateBetViewModel.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 13.08.2022.
//

import Foundation

final class CreateBetViewModel: ObservableObject {
    enum BetType {
        case classic
        case custom
    }

    @Published var selectedBetType: BetType = .classic

}
