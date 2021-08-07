//
//  Pokemon.swift
//  Pokemon
//
//  Created by Macbook Pro on 13/06/21.
//

import SwiftUI

struct Pokemon: Decodable, Identifiable{
    var id: Int
    var name: String
    var imageUrl: String
    var type: String
    var description: String
    var attack: Int
    var defense: Int
    var height: Int
    var weight: Int
    
}

let dummyPokemon: [Pokemon] = [
    .init(id: 0, name: "Pikachu", imageUrl: "pikachu", type: "electric", description: "Grande", attack: 6, defense: 5, height: 12, weight: 3),
    .init(id: 1, name: "Pikachu", imageUrl: "pikachu", type: "electric", description: "Grande", attack: 6, defense: 5, height: 12, weight: 3),
    .init(id: 2, name: "Pikachu", imageUrl: "pikachu", type: "electric", description: "Grande", attack: 6, defense: 5, height: 12, weight: 3),
    .init(id: 3, name: "Pikachu", imageUrl: "pikachu", type: "electric", description: "Grande", attack: 6, defense: 5, height: 12, weight: 3)
]
