//
//  TeamViewController.swift
//  iOSTask
//
//  Created by sherif on 10/06/2024.
//

import UIKit

class TeamViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamShortNameLabel: UILabel!
    @IBOutlet weak var teamFoundedLabel: UILabel!
    @IBOutlet weak var teamVenueLabel: UILabel!
    
    //MARK: - variables
    
    var team: Team?
    
    
    //MARK: - lifcycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Team Detail"
        displayTeamDetails()
    }
    

}

//MARK: - Display Team Details

extension TeamViewController {
    

    private func displayTeamDetails() {
        
        guard let team = team else { return }
        teamNameLabel.text = team.name
        teamShortNameLabel.text = team.tla
        teamFoundedLabel.text = "\(team.founded ?? 0)"
        teamVenueLabel.text = team.venue ?? "Unknown"

        if let url = URL(string: team.crestURL ?? "") {
            let processor = SVGImgProcessor()
            teamImageView.kf.setImage(with: url, options: [.processor(processor)])
        }
    }
}
