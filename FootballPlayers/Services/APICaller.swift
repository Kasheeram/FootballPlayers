//
//  DataService.swift
//  FootballPlayers
//
//  Created by kashee on 30/04/24.
//

import Foundation


enum APIURL {
    case football
    case footballFixtures(String)
    
    var value: String {
        switch self {
        case .football:
            return "/movie/now_playing"
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


final class APICaller {
    
    static let shared = APICaller()
    
    private init() {}
    
    func fetchGenericData<T: Decodable>(from endPoint: APIURL, expectedReturnType: T.Type) async throws -> T {
        let urlString = APIConstant.baseURL + endPoint.value + "&api_token=\(APIConstant.apiKey)"
        guard let url = URL(string: urlString) else {
            throw CustomError.invalidUrl
        }
        print("DEBUG: Fetching data...")
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            print("DEBUG: Error: \(error.localizedDescription)")
            throw CustomError.invalidResponse
        }
        
    }
    
}
