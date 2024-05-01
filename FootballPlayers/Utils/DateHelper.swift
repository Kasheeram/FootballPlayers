//
//  DateFormatting.swift
//  FootballPlayers
//
//  Created by kashee on 30/04/24.
//

import Foundation


class DateHelper {
    static func customDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        // You can customize the date format according to your needs
        return dateFormatter
    }
    
    static func customFormattedDateString(from dateString: String) -> String? {
        let dateFormatter = customDateFormatter()
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "dd/MMM/yyyy"
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
