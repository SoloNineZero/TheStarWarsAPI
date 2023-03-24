//
//  StarshipTableViewCell.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 24.03.2023.
//

import UIKit

class StarshipTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var cellView: UIView! {
        didSet {
            cellView.layer.cornerRadius = 10
        }
    }
    
    func configure(with starship: Starship) {
        nameLabel.text = starship.name
        descriptionLabel.text = starship.description
    }
}
