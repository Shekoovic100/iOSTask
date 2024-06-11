//
//  Route.swift
//  iOSTask
//
//  Created by sherif on 09/06/2024.
//
import Foundation


enum Route {
    
    static let BaseURL = "https://api.football-data.org/v2/"

    case getListOfCompetitions
    case competitionDetails
    case getTeams(Int)

    

    var description: String {
        switch self {
        case .getListOfCompetitions:
            return "competitions"
        case .competitionDetails:
            return "competitions/2000"
        case .getTeams(let competitionId):
            return "competitions/\(competitionId)/teams"
        }
    }
}

