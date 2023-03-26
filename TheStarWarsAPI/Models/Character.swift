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
    let birthYear: String
    let gender: String
    
    init(name: String, height: String, mass: String, hairColor: String, eyeColor: String, birthYear: String, gender: String) {
        self.name = name
        self.height = height
        self.mass = mass
        self.hairColor = hairColor
        self.eyeColor = eyeColor
        self.birthYear = birthYear
        self.gender = gender
    }
    
    init(characterData: [String: Any]) {
        name = characterData["name"] as? String ?? ""
        height = characterData["height"] as? String ?? ""
        mass = characterData["mass"] as? String ?? ""
        hairColor = characterData["hairColor"] as? String ?? ""
        eyeColor = characterData["eyeColor"] as? String ?? ""
        birthYear = characterData["birthYear"] as? String ?? ""
        gender = characterData["gender"] as? String ?? ""
    }
    
    static func getCharacter(from value: Any) -> [Character] {
        guard let characterData = value as? [[String: Any]] else { return [] }
        return characterData.map { Character(characterData: $0) }
    }

    var description: String {
        return """
            height: \(height)
            mass: \(mass)
            hair color: \(hairColor)
            eye color: \(eyeColor)
            birth year: \(birthYear)
            gender: \(gender)
            """
    }
}

struct StarWarsCharactersInfo: Decodable {
    let results: [Character]
}
