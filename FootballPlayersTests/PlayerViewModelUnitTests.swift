//
//  PlayerViewModelUnitTests.swift
//  FootballPlayersTests
//
//  Created by kashee on 30/04/24.
//

import XCTest
@testable import FootballPlayers

final class PlayerViewModelUnitTests: XCTestCase {
    
    @MainActor
    func test_playerViewModel_fetchPlayers_success() async {
        // given
        let vm = PlayerViewModel()
        let fixerId = "18535517"
        // when
        await vm.fetchPlayers(id: fixerId)
        // then
        XCTAssertNotNil(vm.playerLineups)
        XCTAssertGreaterThan(vm.playerLineups.count, 0)
        XCTAssertGreaterThan(vm.players.count, 0)
        XCTAssertFalse(vm.isLoading)
        XCTAssertNil(vm.errorMessage)
        XCTAssertFalse(vm.shouldShowError)
    }
    
    @MainActor
    func test_playerViewModel_fetchPlayers_failure() async {
        // given
        let vm = PlayerViewModel()
        let fixerId = ""
        // when
        await vm.fetchPlayers(id: fixerId)
        // then
        XCTAssertEqual(vm.playerLineups.count, 0)
        XCTAssertEqual(vm.players.count, 0)
        XCTAssertFalse(vm.isLoading)
        XCTAssertTrue(vm.shouldShowError)
        XCTAssertNotNil(vm.errorMessage)
    }
    
    
}
