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
    let hair_color: String
    let eye_color: String
    let gender: String
    let starships: [String]
}

struct StarWarsCharactersInfo: Decodable {
    let results: [Character]
}
