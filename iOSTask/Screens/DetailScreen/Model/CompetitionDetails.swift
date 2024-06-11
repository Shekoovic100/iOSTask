//
//  CompetitionDetails.swift
//  iOSTask
//
//  Created by sherif on 09/06/2024.
//

import Foundation


// MARK: - CompetitionsDetails

struct CompetitionsDetails: Codable {
    let id: Int?
    let area: CompetitionsDetailsArea?
    let name, code: String?
    let emblemURL: String?
    let plan: String?
    let currentSeason: Season?
    let seasons: [Season]?
    let lastUpdated: Date?

    enum CodingKeys: String, CodingKey {
        case id, area, name, code
        case emblemURL = "emblemUrl"
        case plan, currentSeason, seasons, lastUpdated
    }
}

// MARK: - Area
struct CompetitionsDetailsArea: Codable {
    let id: Int?
    let name: String?
}

