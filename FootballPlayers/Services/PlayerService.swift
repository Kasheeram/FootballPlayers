//
//  APIProtocols.swift
//  FootballPlayers
//
//  Created by kashee on 30/04/24.
//

import Foundation


protocol PlayerService {
    func fetchGenericData<T: Decodable>(from endPoint: APIURL, expectedReturnType: T.Type) async throws -> T
}


enum APIURL {
    case football
    case footballFixtures(String)
    
    var value: String {
        switch self {
        case .football:
            return "/football"
        case .footballFixtures(let fixtureId):
            return "/football/fixtures/\(fixtureId)?include=lineups.player"
        }
    }
    
    var description: String {
        switch self {
        case .football:
            return "Football Players"
        case .footballFixtures(_):
            return "Football Fixtures"
        }
    }
}


enum CustomError: Error {
    case invalidUrl
    case invalidData
    case noData
    case invalidResponse
    
    var localizeDescription: String {
        switch self {
            case .invalidUrl: return "Invalid URL"
            case .invalidData: return "Invalid Data"
            case .noData: return "No Data"
            case .invalidResponse: return "Invalid Response"
        }
    }
    
    var errorUserInfo: [String: Any] {
        return [NSLocalizedDescriptionKey: localizeDescription]
    }
}
