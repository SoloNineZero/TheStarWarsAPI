//
//  StarshipTableViewController.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 24.03.2023.
//

import UIKit

class StarshipTableViewController: UITableViewController {

    private var starships: [Starship] = []
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Star Wars Starships"
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        starships.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)


        return cell
    }
}
