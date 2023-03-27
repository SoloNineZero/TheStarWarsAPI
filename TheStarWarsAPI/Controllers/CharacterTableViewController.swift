//
//  InfoTableViewController.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 23.03.2023.
//

import UIKit
import Alamofire

final class CharacterTableViewController: UITableViewController {
    
    //MARK: - Private properties
    private var characters: [Character] = []
    private var starWars: [StarWarsCharactersInfo] = []
    private let networkManager = NetworkManager.shared

    
    
    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacters()
        title = "Star Wars"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        guard let cell = cell as? CharacterTableViewCell else { return UITableViewCell() }
        let character = characters[indexPath.row]
        cell.configure(with: character)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoVC = segue.destination as? InfoViewController else { return }
        guard let index = tableView.indexPathForSelectedRow else { return }
        infoVC.character = characters[index.row]
    }
    
    
    @IBAction func reload(_ sender: UIBarButtonItem) {
        getStarWars()
    }
}
//MARK: - Private functions
extension CharacterTableViewController {
//    private func fetchCharacter() {
//        networkManager.fetch(StarWarsCharactersInfo.self, from: Link.apiCharacterURL.url) { [weak self] result in
//            switch result {
//            case .success(let characters):
//                self?.characters = characters.results
//                self?.tableView.reloadData()
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    private func fetchCharacters() {
        networkManager.fetchCharacters(from: Link.apiCharacterURL.url) { [weak self] result in
            switch result {
            case .success(let value):
                self?.starWars = value
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getStarWars() {
        starWars.forEach { starWarsCharactersInfo in
            print(starWarsCharactersInfo.results.count)
        }
    }
    
//    private func fetchCharacter() {
//        networkManager.fetchCharacter(from: Link.apiCharacterURL.url) { [weak self] result in
//            switch result {
//            case .success(let value):
//                self?.characters = value
//                self?.tableView.reloadData()
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
//    private func fetchCourses() {
//        AF.request(Link.coursesURL.url)
//            .validate()
//            .responseJSON { dataResponse in
//                switch dataResponse.result {
//                case .success(let value):
//                    guard let coursesData = value as? [[String: Any]] else { return }
//                    for courseDate in coursesData {
//                        let course = Course(
//                            name: courseDate["name"] as? String ?? "",
//                            imageUrl: courseDate["imageUrl"] as? String ?? "",
//                            numberOfLessons: courseDate["number_of_lessons"] as? Int ?? 0,
//                            numberOfTests: courseDate["number_of_tests"] as? Int ?? 0
//                        )
//
//                    }
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }
}
