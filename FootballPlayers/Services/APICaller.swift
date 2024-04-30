//
//  DataService.swift
//  FootballPlayers
//
//  Created by kashee on 30/04/24.
//

import Foundation

final class APICaller: PlayerService {
    
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
