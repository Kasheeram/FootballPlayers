//
//  FootballPlayersTests.swift
//  FootballPlayersTests
//
//  Created by kashee on 29/04/24.
//

import XCTest
@testable import FootballPlayers

final class PlayerCellViewModelTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_PlayerCellViewModel() {
        // Given
        let player = Player(id: 123, name: "Anay", displayName: "K. Anay", dateOfBirth: "2022-01-05", gender: "male", imagePath: nil)
        // When
        let playerCellViewModel = PlayerCellViewModel(player: player)
        // Then
        XCTAssertNotNil(playerCellViewModel)
        XCTAssertEqual(playerCellViewModel.id, player.id)
        XCTAssertNotEqual(playerCellViewModel.imagePath, nil)
        XCTAssertEqual(playerCellViewModel.dateOfBirth, "05/Jan/2022")
        XCTAssertNotEqual(playerCellViewModel.dateOfBirth, player.dateOfBirth)
        XCTAssertNotEqual(playerCellViewModel.gender, player.gender)
        XCTAssertEqual(playerCellViewModel.gender, "Male")
        
    }
    
}
