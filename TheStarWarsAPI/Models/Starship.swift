//
//  Starship.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 23.03.2023.
//

import Foundation

struct Starship: Codable {
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String
}

struct StarWarsStarshipInfo: Decodable {
    let results: [Starship]
}

extension Starship {
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case model = "model"
        case manufacturer = "manufacturer"
        case costInCredits = "cost_in_credits"
    }
}
