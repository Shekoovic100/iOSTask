//
//  HomeViewModel.swift
//  iOSTask
//
//  Created by sherif on 09/06/2024.
//

import Foundation


class HomeViewModel {
    
    private var competitionsList: [Competition] = []
    private let service: NetworkingManagerProtocol
    
    
    
    init(apiClient: NetworkingManagerProtocol) {
        self.service = apiClient
    }
    
    

    func fetchListOfCompetitions(completion: @escaping (Bool) -> Void) {
        service.request(urlString: .getListOfCompetitions, method: .get, type: Competitions.self) { [weak self] result in
            
            switch result {
            case .success(let competition):
                self?.competitionsList = competition.competitions ?? []
                completion(true)
            case .failure(let error):
                print(error.localizedDescription)
                print("Errror")
                completion(false)
            }
        }
    }
    
}

//MARK: - comtition list data for Table

extension HomeViewModel {
    
    func copmetitionListCount() -> Int {
        return competitionsList.count
    }
    
    func getCompetitionIndexPath(index: IndexPath) -> Competition {
        return competitionsList[index.row]
    }
    
}
