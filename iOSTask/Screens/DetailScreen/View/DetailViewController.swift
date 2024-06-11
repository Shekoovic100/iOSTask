//
//  DetailViewController.swift
//  iOSTask
//
//  Created by sherif on 10/06/2024.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var TeamsTableView: UITableView!
    @IBOutlet weak var longNameLabel: UILabel!
    @IBOutlet weak var shortNameLabel: UILabel!
    @IBOutlet weak var numberOfTeamsLabel: UILabel!
    @IBOutlet weak var numberOfGamesLabel: UILabel!
    @IBOutlet weak var numberOfMatchDay: UILabel!
    @IBOutlet weak var competitonImageView: UIImageView!
    
    //MARK: - variables
    
    var competitions: Competition?
    private var viewModel = DetailViewModel(apiClient: APIClient())
    

    //MARK: - lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTeamCell()
        getCompetitionTeams()
        displayCompetitionDetails()
        self.title = "Competitions Details"
    }
    
    
    //MARK: - Register Cell

    private func registerTeamCell() {
        TeamsTableView.register(UINib(nibName: TeamTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TeamTableViewCell.identifier)
    }
    
    
}

//MARK: - fetch teams Data

extension DetailViewController {
    
    private func getCompetitionTeams() {
        viewModel.fetchDetails { success in
            if success {
                DispatchQueue.main.async {
                    self.TeamsTableView.reloadData()
                }
            }
        }
    }
}

//MARK: - set competitions Data

extension DetailViewController {
    
    private func displayCompetitionDetails() {
        
        longNameLabel.text = competitions?.name
        shortNameLabel.text = competitions?.code
        numberOfTeamsLabel.text = "\(competitions?.numberOfAvailableSeasons ?? 0) teams"
        numberOfGamesLabel.text = "\(competitions?.currentSeason?.currentMatchday ?? 0) games"
        numberOfMatchDay.text = "\(competitions?.currentSeason?.currentMatchday ?? 0) Matches"
        
        if let teamImageUrlString = competitions?.emblemURL {
            guard let url = URL(string: teamImageUrlString) else { return }
            competitonImageView.kf.setImage(with: url, options: [.processor(SVGImgProcessor())])
        }else {
            competitonImageView.image = UIImage(named: "default")
        }
    }
    
}

//MARK: - tableViewDatatSource

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.teamsListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.identifier, for: indexPath) as? TeamTableViewCell else { return UITableViewCell() }
        let team = viewModel.getTeamsIndexPath(index: indexPath)
        cell.configureCell(cell: team)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

//MARK: - tableViewDelegate

extension DetailViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigateToTeams(index: indexPath)
    }
    
    
    func navigateToTeams(index: IndexPath) {
       guard let teamsVC = storyboard?.instantiateViewController(withIdentifier: "TeamViewController") as? TeamViewController else{ return }
        let team = viewModel.getTeamsIndexPath(index: index)
        teamsVC.team = team
        self.navigationController?.pushViewController(teamsVC, animated: true)
    }
    
}
