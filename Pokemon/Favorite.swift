//
//  Favorite.swift
//  Pokemon
//
//  Created by Héctor Garcíaluna on 13/06/21.
//


import SwiftUI
import FirebaseFirestoreSwift

struct Favorite: Identifiable, Codable {
    
    @DocumentID var id: String?
    var name: String
    var imageUrl: String
    var type: String
    var description: String
    var attack: Int
    var defense: Int
    var height: Int
    var weight: Int
    var favorite: Bool
    enum CodingKeys: String, CodingKey{
        
        case id
        case name
        case imageUrl
        case type
        case description
        case attack
        case defense
        case height
        case weight
        case favorite
    }
}

extension Favorite {
    public static var dummyFavorite = Favorite(name: "Pikachu", imageUrl: "pikachu", type: "electric", description: "Grande", attack: 6, defense: 5, height: 12, weight: 3, favorite: true)
}
