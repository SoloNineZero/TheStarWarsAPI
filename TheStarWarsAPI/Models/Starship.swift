//
//  Starship.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 23.03.2023.
//

import Foundation

struct Starship: Decodable {
    let name: String
    let model: String
    let manufacturer: String
    let cost_in_credits: String
}

struct StarWarsStarshipInfo: Decodable {
    let results: [Starship]
}
