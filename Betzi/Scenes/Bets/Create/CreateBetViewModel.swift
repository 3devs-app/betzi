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
    @Published var tournamnets: [String] = []
    @Published var isLoadingTournaments: Bool = false
    @Published var selectedTournament: String?
    
    private let betService: BetServiceType

    init(betService: BetServiceType) {
        self.betService = betService
    }

    @MainActor
    func fetchTournamnets() async {
        isLoadingTournaments = true
        do {
            tournamnets = try await betService.fetchTournaments()
            isLoadingTournaments = false
        } catch {
            isLoadingTournaments = false
        }
    }

    func selectTournament(at index: Int) {
        selectedTournament = tournamnets[index]
    }
}
