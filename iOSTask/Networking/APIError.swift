//
//  APIError.swift
//  iOSTask
//
//  Created by sherif on 09/06/2024.
//

import Foundation



enum APIError: Error {
    
    case requestFailed(description: String)
    case responseUnsuccessful(description: String)
    case invalidData
    case failedSerialization
    case noInternet
    case jsonConversionFailure(description: String)
    case invalidURL
    
    var customeDescription: String {
        
        switch self {
        case .requestFailed(let description):
            return "request Failed\(description)"
        case .invalidData:
            return "inavild Data"
        case .failedSerialization:
            return "JSON Pasing failure"
        case .noInternet:
            return "No internet Conection"
        case .responseUnsuccessful(description: let description):
            return "Unsuccessful: \(description)"
        case .jsonConversionFailure(description: let description):
            return "JSON Conversion Failure: \(description)"
        case .invalidURL:
            return "invalidURL"
        }
    }
}


