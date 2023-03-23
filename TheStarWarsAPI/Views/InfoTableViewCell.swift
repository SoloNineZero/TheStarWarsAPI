//
//  InfoTableViewCell.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 23.03.2023.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    func configure(with character: Character) {
        nameLabel.text = character.name
        descriptionLabel.text = character.description
    }

}
