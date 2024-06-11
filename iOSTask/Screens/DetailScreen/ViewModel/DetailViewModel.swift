//
//  DetailViewModel.swift
//  iOSTask
//
//  Created by sherif on 10/06/2024.
//

import Foundation

class DetailViewModel {
    
    private var teams: [Team] = []
    private let service: NetworkingManagerProtocol
    
    
    
    init(apiClient: NetworkingManagerProtocol) {
        self.service = apiClient
    }
    
    
    func fetchDetails(completion: @escaping (Bool) -> Void){
        service.request(urlString: .getTeams(2000), method: .get, type: Teams.self) { [weak self] result in
            
            switch result {
                
            case .success(let result):
                self?.teams = result.teams ?? []
                completion(true)
                
            case .failure(let error):
                completion(true)
                print(error.localizedDescription)
            }
        }
    }
    
    
}

//MARK: - teamlist  data for table

extension DetailViewModel {
    
    func teamsListCount() -> Int {
        return teams.count
    }
    
    func getTeamsIndexPath(index: IndexPath) -> Team {
        return teams[index.row]
    }
}
