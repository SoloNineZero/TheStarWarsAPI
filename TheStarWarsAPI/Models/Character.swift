//
//  Character.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 23.03.2023.
//

import Foundation

struct Character: Codable {
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let eye_color: String
    let gender: String
//    let starships: [String]
//
    var description: String {
        return """
            height: \(height)
            mass: \(mass)
            hair color: \(hair_color)
            eye color: \(eye_color)
            gender: \(gender)
            """
    }
}

struct StarWarsCharactersInfo: Decodable {
    let results: [Character]
}
