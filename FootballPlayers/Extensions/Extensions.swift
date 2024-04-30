//
//  Extension.swift
//  FootballPlayers
//
//  Created by kashee on 30/04/24.
//

import Foundation


extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
