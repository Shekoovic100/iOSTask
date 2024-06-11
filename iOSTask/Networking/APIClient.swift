//
//  APIClient.swift
//  iOSTask
//
//  Created by sherif on 09/06/2024.
//

import Foundation


final class APIClient: NetworkingManagerProtocol {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration )
    }
    
    convenience init() {
     self.init(configuration: .default)
    }
    
}



