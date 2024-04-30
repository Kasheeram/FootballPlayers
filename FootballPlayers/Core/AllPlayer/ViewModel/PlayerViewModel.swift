//
//  PlayerViewModel.swift
//  FootballPlayers
//
//  Created by kashee on 30/04/24.
//

import Foundation

@MainActor
class PlayerViewModel: ObservableObject {
    @Published var playerLineups = [Lineups]()
    @Published var players = [PlayerCellViewModel]()
    @Published var errorMessage: String?
    @Published var isLoading = false
    @Published var shouldShowError = false
    
    func fetchPlayers(id: String) async {
        isLoading = true
        do {
            let result = try await APICaller.shared.fetchGenericData(from: .footballFixtures(id), expectedReturnType: PlayerData.self)
            self.playerLineups = result.data.lineups
            self.mapLineupsData()
            self.isLoading = false
        } catch {
            self.isLoading = false
            self.shouldShowError = true
            self.errorMessage = error.localizedDescription
        }
    }
    
    private func mapLineupsData() {
        players = self.playerLineups.compactMap({PlayerCellViewModel(player: $0.player)})
    }
}
