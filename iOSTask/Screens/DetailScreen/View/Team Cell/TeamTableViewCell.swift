//
//  TeamTableViewCell.swift
//  iOSTask
//
//  Created by sherif on 10/06/2024.
//

import UIKit
import Kingfisher


class TeamTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var teamLongName: UILabel!
    @IBOutlet weak var teamShortName: UILabel!
    @IBOutlet weak var teamImageView: UIImageView!
    
    
    static let identifier = String(describing: TeamTableViewCell.self)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func configureCell(cell: Team) {
        
        teamLongName.text = cell.name
        teamShortName.text = cell.tla
        
        if let teamImageUrlString = cell.crestURL {
            guard let url = URL(string: teamImageUrlString) else { return  }
            teamImageView.kf.setImage(with: url, options: [.processor(SVGImgProcessor())])
        }else {
            teamImageView.image = UIImage(named: "default")
        }
        
    }

}
