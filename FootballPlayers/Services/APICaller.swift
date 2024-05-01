//
//  DataService.swift
//  FootballPlayers
//
//  Created by kashee on 30/04/24.
//

import Foundation

// MARK:- Singleton patern to call data from server
final class APICaller: PlayerService {
    static let shared = APICaller()
    private init() {}
    
    // Generic function to accept any data type and return the same
    func fetchGenericData<T: Decodable>(from endPoint: APIURL, expectedReturnType: T.Type) async throws -> T {
        let urlString = APIConstant.baseURL + endPoint.value + "&api_token=\(APIConstant.apiKey)"
        guard let url = URL(string: urlString) else {
            throw CustomError.invalidUrl
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            throw CustomError.invalidResponse
        }
        
    }
    
}
