//
//  Extension+Int.swift
//  CovidStatistics
//
//  Created by Лина Вертинская on 15.12.22.
//

import Foundation

extension Int {

    var formatNumber: String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self))!
    }

    var roundedWithAbbreviations: String {

        let number = Double(self)
        let million = number / 1_000_000

        if million >= 1.0 {
            return "\(round(million*10)/10)M"
        } else {
            return "\(self.formatNumber)"
        }
    }
}
