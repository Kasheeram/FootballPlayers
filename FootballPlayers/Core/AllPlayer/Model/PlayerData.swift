//
//  Player.swift
//  FootballPlayers
//
//  Created by kashee on 30/04/24.
//

import Foundation


struct PlayerData: Decodable {
    let data: DataObj
}

struct DataObj: Decodable {
    let lineups: [Lineups]
}

struct Lineups: Decodable, Identifiable {
    let id: Int
    let player: Player
}

struct Player: Decodable {
    let id: Int?
    let name: String?
    let displayName: String?
    let dateOfBirth: String?
    let gender: String?
    let imagePath: String?
}


