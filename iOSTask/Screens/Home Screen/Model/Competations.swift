//
//  Competations.swift
//  iOSTask
//
//  Created by sherif on 09/06/2024.
//

import Foundation


// MARK: - Competations

struct Competitions: Codable {
       let count: Int?
       let competitions: [Competition]?
}

// MARK: - Competition

struct Competition: Codable {
        let id: Int?
        let area: Area?
        let name: String?
        let code: String?
        let emblemURL: String?
        let currentSeason: CurrentSeason?
        let numberOfAvailableSeasons: Int?
        let lastUpdated: Date?

        enum CodingKeys: String, CodingKey {
            case id, area, name, code
            case emblemURL = "emblemUrl"
            case currentSeason, numberOfAvailableSeasons, lastUpdated
        }
}

// MARK: - Area

struct Area: Codable {
       let id: Int?
       let name, countryCode: String?
       let ensignURL: String?

       enum CodingKeys: String, CodingKey {
           case id, name, countryCode
           case ensignURL = "ensignUrl"
       }
}

// MARK: - CurrentSeason
struct CurrentSeason: Codable {
    let id: Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
    let winner: Winner?
}


