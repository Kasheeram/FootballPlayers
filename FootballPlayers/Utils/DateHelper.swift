//
//  DateFormatting.swift
//  FootballPlayers
//
//  Created by kashee on 30/04/24.
//

import Foundation


class DateHelper {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy"
        return dateFormatter
    }()
}
