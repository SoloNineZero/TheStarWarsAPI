//
//  NetworkManager.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 24.03.2023.
//

import Foundation
import Alamofire

enum Link {
    case apiCharacterURL
    case coursesURL
    
    var url: URL {
        switch self {
        case .apiCharacterURL:
            return URL(string: "https://swapi.dev/api/people/")!
        case .coursesURL:
            return URL(string: "https://swiftbook.ru//wp-content/uploads/api/api_courses")!
        }
    }
}

enum NetworkError: Error {
    case noData
    case decoding
}

final class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

//    func fetch<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping(Result<T, NetworkError>) -> Void)  {
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data else {
//                completion(.failure(.noData))
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//
//            do {
//                let dataModel = try decoder.decode(T.self, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(dataModel))
//                }
//            } catch {
//                completion(.failure(.decoding))
//            }
//        }.resume()
//    }
    func fetchCharacters(from url: URL, completion: @escaping(Result<[StarWarsCharactersInfo], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let results = StarWarsCharactersInfo.getStarWars(from: value)
                    completion(.success(results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
//    func fetchCharacter(from url: URL, completion: @escaping(Result<[Character], AFError>) -> Void) {
//        AF.request(url)
//            .validate()
//            .responseJSON { dataResponse in
//                switch dataResponse.result {
//                case .success(let value):
//                    let results = Character.getCharacter(from: value)
//                    completion(.success(results))
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }
//    }
    
}
