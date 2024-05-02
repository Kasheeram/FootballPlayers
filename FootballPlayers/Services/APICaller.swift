//
//  DataService.swift
//  FootballPlayers
//
//  Created by kashee on 30/04/24.
//

import Foundation


/// Singleton patern to to call data from server
final class APICaller: PlayerService {
    static let shared = APICaller()
    private init() {}
    
    /// Generic function to accept any data type and return the same
    /// - Parameters:
    ///   - endPoint: This is the end point of url to fetch data
    ///   - expectedReturnType: This is the data type of your model or return type you are expecting
    /// - Returns: It is returning a data model after parsing the json 
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
