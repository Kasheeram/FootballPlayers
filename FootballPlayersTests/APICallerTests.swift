//
//  APICallerTests.swift
//  FootballPlayersTests
//
//  Created by kashee on 01/05/24.
//

import XCTest
@testable import FootballPlayers

final class APICallerTests: XCTestCase {
    
    var sut: APICaller!

    override func setUpWithError() throws {
        sut = APICaller.shared
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_fetch_genericData_success() async throws {
        // Given
        let fixureId = "18535517"
        let url: APIURL = .footballFixtures(fixureId)
        let expectedType = PlayerData.self

        // When
        let result = try await sut.fetchGenericData(from: url, expectedReturnType: expectedType)
        
        // Then
        XCTAssertNotNil(result)
        XCTAssertGreaterThan(result.data.lineups.count, 0)
        XCTAssertNotNil(result.data.lineups[0].id)
        XCTAssertNotNil(result.data.lineups[0].player)
    }
    
    func test_fetch_genericData_failure() async throws {
        // Given
        let fixureId = ""
        let url: APIURL = .footballFixtures(fixureId)
        let expectedType = PlayerData.self
        let expectation = XCTestExpectation(description: "Fetch data")
        
        // When
        Task {
            do {
                _ = try await sut.fetchGenericData(from: url, expectedReturnType: expectedType)
                XCTFail("Expected an error, but call succeeded")
            } catch let error as CustomError {
                // Then
                XCTAssertEqual(error.localizeDescription, "Invalid Response")
            } catch {
                XCTFail("Unexpected error: \(error)")
            }
            
            expectation.fulfill()
            
        }
        await fulfillment(of: [expectation], timeout: 5)
    }
    
}

