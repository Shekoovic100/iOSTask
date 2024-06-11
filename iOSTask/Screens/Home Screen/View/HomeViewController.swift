//
//  HomeViewController.swift
//  iOSTask
//
//  Created by sherif on 09/06/2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var competitionsTableView: UITableView!
    
    //MARK: - variables
    
    private var viewModel = HomeViewModel(apiClient: APIClient())
    
    //MARK: - lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        getListOfCompetitions()
        self.title = "Copmetitions"
    }
    
   private func registerCell() {
        competitionsTableView.register(UINib(nibName: CopmetitionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CopmetitionTableViewCell.identifier)
    }
}

//MARK: - fetch list of Competitions Data

extension HomeViewController {
    
    func getListOfCompetitions() {
        viewModel.fetchListOfCompetitions { [weak self] success in
            if success {
                DispatchQueue.main.async {
                    self?.competitionsTableView.reloadData()
                }
            }else {
                print("Failed to fetch competitions")
            }
        }
    }
}


//MARK: - TableView Methods

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return viewModel.copmetitionListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: CopmetitionTableViewCell.identifier, for: indexPath) as? CopmetitionTableViewCell else { return UITableViewCell() }
        
        let competition = viewModel.getCompetitionIndexPath(index: indexPath)
        cell.configureCell(cell: competition)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigateToDetails(index: indexPath)
    }
    
    
    func navigateToDetails(index: IndexPath) {
       guard let DetailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewControler") as? DetailViewController else{ return }
        let competition = viewModel.getCompetitionIndexPath(index: index)
        DetailsVC.competitions = competition
        self.navigationController?.pushViewController(DetailsVC, animated: true)
    }
    
}
