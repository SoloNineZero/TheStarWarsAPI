//
//  InfoTableViewController.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 23.03.2023.
//

import UIKit

final class InfoTableViewController: UITableViewController {

    private var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        guard let cell = cell as? InfoTableViewCell else { return UITableViewCell() }
        let character = characters[indexPath.row]
        cell.configure(with: character)

        return cell
    }
}

extension InfoTableViewController {
    func fetchCharacter() {
        URLSession.shared.dataTask(with: Link.apiCharacterURL.url) { [weak self] data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let swInfo = try decoder.decode(StarWarsCharactersInfo.self, from: data)
                self?.characters = swInfo.results
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
