//
//  Character.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 23.03.2023.
//

import Foundation

struct Character: Decodable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let eyeColor: String
    let gender: String
    let starships: [String]

    var description: String {
        return """
            height: \(height)
            mass: \(mass)
            hair color: \(hairColor)
            eye color: \(eyeColor)
            gender: \(gender)
            """
    }
}

struct StarWarsCharactersInfo: Decodable {
    let results: [Character]
}
