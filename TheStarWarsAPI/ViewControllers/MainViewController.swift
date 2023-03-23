//
//  MainViewController.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 23.03.2023.
//

import UIKit

enum Link {
    case apiCharacterURL
    case apiStarshipURL
    
    var url: URL {
        switch self {
        case .apiCharacterURL:
            return URL(string: "https://swapi.dev/api/people/")!
        case .apiStarshipURL:
            return URL(string: "https://swapi.dev/api/starships/")!
        }
    }
}

final class MainViewController: UIViewController {

    private var swInfo: StarWarsCharactersInfo!

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showInfo" {
            guard let infoVC = segue.destination as? InfoTableViewController else { return }
            infoVC.fetchCharacter()
        }
    }
}
