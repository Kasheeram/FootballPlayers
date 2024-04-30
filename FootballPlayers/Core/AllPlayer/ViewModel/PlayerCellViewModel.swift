//
//  PlayerCellViewModel.swift
//  FootballPlayers
//
//  Created by kashee on 30/04/24.
//

import Foundation

// All extra business logic will go here
class PlayerCellViewModel: Identifiable {
    let id: Int
    let name: String
    let displayName: String
    var dateOfBirth: String?
    let gender: String
    let imagePath: String
    
    init(player: Player) {
        self.id = player.id ?? 0
        self.name = player.name ?? ""
        self.displayName = player.displayName ?? ""
        self.imagePath = player.imagePath ?? ""
        self.gender = player.gender?.capitalizingFirstLetter() ?? "" // Convert gender first letter to capital
        self.dateOfBirth = getFormattedDate(date: player.dateOfBirth ?? "")
    }
    
    private func getFormattedDate(date: String) -> String {
        if let dob = DateHelper.customFormattedDateString(from: date) {
            return "\(dob)"
        }
        return ""
    }
    
    // MARK: - Generate full image url if not getting directly from api
    //    private func makeImageUrl(_ imageCode: String) -> URL? {
    //        URL(string: "\(ApiConstant.imageBaseUrl)\(imageCode)")
    //    }
}
