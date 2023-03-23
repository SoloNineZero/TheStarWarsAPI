//
//  InfoTableViewController.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 23.03.2023.
//

import UIKit

final class InfoTableViewController: UITableViewController {

    private var characters: [Character] = []
    var number = "22"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(characters)
        print(number)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)

        return cell
    }
}

extension InfoTableViewController {
    func fetchCharacter() {
        
    }
}
