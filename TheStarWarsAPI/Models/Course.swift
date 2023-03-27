//
//  Course.swift
//  TheStarWarsAPI
//
//  Created by Игорь Солодянкин on 27.03.2023.
//

import Foundation

struct Course: Codable {
    let name: String
    let imageUrl: String
    let numberOfLessons: Int
    let numberOfTests: Int
}
