//
//  Teams.swift
//  iOSTask
//
//  Created by sherif on 09/06/2024.
//

import Foundation


// MARK: - Teams

struct Teams: Codable {
    let count: Int?
    let competition: TeamCompetition?
    let season: Season?
    let teams: [Team]?
}

// MARK: - Competition

struct TeamCompetition: Codable {
    let id: Int?
    let area: TeamArea?
    let name, code, plan: String?
    let lastUpdated: Date?
}

// MARK: - TeamArea

struct TeamArea: Codable {
    let id: Int?
    let name: String?
}

// MARK: - Season
struct Season: Codable {
    let id: Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
    let winner: Winner?
}

// MARK: - Winner
struct Winner: Codable {
    let id: Int?
    let name, shortName, tla: String?
    let crestURL: String?

    enum CodingKeys: String, CodingKey {
        case id, name, shortName, tla
        case crestURL = "crestUrl"
    }
}

// MARK: - Team
struct Team: Codable {
    
    let id: Int?
    let area: TeamArea?
    let name, shortName, tla: String?
    let crestURL: String?
    let address: String?
    let phone: String?
    let website: String?
    let email: String?
    let founded: Int?
    let clubColors, venue: String?
    let lastUpdated: Date?

    enum CodingKeys: String, CodingKey {
        case id, area, name, shortName, tla
        case crestURL = "crestUrl"
        case address, phone, website, email, founded, clubColors, venue, lastUpdated
    }
}
