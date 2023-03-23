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

    var number = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func characterButtonAction(_ sender: Any) {
//        fetchCharacter()
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showInfo" {
            guard let infoVC = segue.destination as? InfoTableViewController else { return }
            infoVC.fetchCharacter()
            infoVC.number = "cdbhcbhsbcw"
        }
    }
}

// MARK: - Networking
extension MainViewController {
    private func fetchCharacter() {
        URLSession.shared.dataTask(with: Link.apiCharacterURL.url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                
                let swInfo = try decoder.decode(StarWarsCharactersInfo.self, from: data)
                for character in swInfo.results {
                    print("""
                    name: \(character.name)
                    height: \(character.height)
                    mass: \(character.mass)
                    hair color: \(character.hair_color)
                    eye color: \(character.eye_color)
                    gender: \(character.gender)

                    """)
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    private func fetchStarship() {
        URLSession.shared.dataTask(with: Link.apiStarshipURL.url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                
                let swInfo = try decoder.decode(StarWarsStarshipInfo.self, from: data)
                for starship in swInfo.results {
                    
                    print("""
                        name: \(starship.name)
                        model: \(starship.model)
                        manufacturer: \(starship.manufacturer)
                        cost in credits: \(starship.cost_in_credits)

                        """)
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }

}

