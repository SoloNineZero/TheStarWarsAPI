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
    
    var description: String {
        return """
            model: \(model)
            manufacturer: \(manufacturer)
            cost in credits: \(costInCredits)
            """
    }
}

struct StarWarsStarshipInfo: Decodable {
    let results: [Starship]
}
