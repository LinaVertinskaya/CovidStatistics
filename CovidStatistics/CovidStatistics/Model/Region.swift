//
//  Region.swift
//  CovidStatistics
//
//  Created by Лина Вертинская on 9.12.22.
//

import Foundation

struct AllRegions: Codable {
    let data: [Country]
}

struct Country: Codable {
    let iso: String
    let name: String

    static let dummyData = Country(iso: "N/A", name: "Error")
}
