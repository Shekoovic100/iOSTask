//
//  CopmetitionTableViewCell.swift
//  iOSTask
//
//  Created by sherif on 09/06/2024.
//

import UIKit

class CopmetitionTableViewCell: UITableViewCell {

    @IBOutlet weak var longNameLabel: UILabel!
    @IBOutlet weak var shortNameLabel: UILabel!
    @IBOutlet weak var numberOfTeamsLabel: UILabel!
    @IBOutlet weak var numberOfGamesLabel: UILabel!
    
    
    static let identifier = String(describing: CopmetitionTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    
    func configureCell(cell: Competition) {
        longNameLabel.text = cell.name
        shortNameLabel.text = cell.code ?? "No Avaiable Code"
        numberOfTeamsLabel.text = "\(cell.numberOfAvailableSeasons ?? 0) teams"
        numberOfGamesLabel.text = "\(cell.currentSeason?.currentMatchday ?? 0) games"
    }
    
}
