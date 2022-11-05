//
//  BetService.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 15.05.2022.
//

import Foundation

protocol BetServiceType {
    func createBet()
    func fetchTournaments() async throws -> [String]
}

class BetService: BetServiceType {
    func createBet() {
        // firebase
    }

    func fetchTournaments() async throws -> [String] {
        try await Task.sleep(nanoseconds: 2_000_000_000)
        return ["World Cup", "Premier league"]
    }
}
