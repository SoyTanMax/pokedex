//
//  MediaModel.swift
//  Pokemon
//
//  Created by Macbook Pro on 13/06/21.
//

import SwiftUI
import FirebaseFirestore
class MediaModel: ObservableObject {
    
    
    @Published var pokemon = [Pokemon]()
    private let db = Firestore.firestore()
    @Published var favorites = [Favorite]()
 

    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init(){
        fetchPokemons()
        fetchFavorites()
    }
    
    func fetchPokemons(){
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url){ (data, respnse, error) in
            guard let data = data?.parseData(removeString: "null,") else { return }
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }
    
    func fetchFavorites(){
        
        db.collection("pokedex").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.favorites = documents.compactMap { queryDocumentSnapshot -> Favorite? in
                return try? queryDocumentSnapshot.data(as: Favorite.self)
            }
        }
        
    }
    
    func background(forType type: String) -> UIColor {
        
        switch type {
        case "fire": return .systemRed
        case "poison": return .systemGreen
        case "water": return .systemBlue
        case "electric": return .systemYellow
        case "psychic": return .systemPurple
        case "normal": return .systemOrange
        case "ground": return .systemGray
        case "flying": return .systemTeal
        case "fairy": return .systemPink
            
        default: return.systemIndigo
        }
        
    }
    
    func AddToFavorites(pokemon: Pokemon) {
        
        let p = Favorite(
            id: String(pokemon.id),
            name: pokemon.name,
            imageUrl: pokemon.imageUrl,
            type: pokemon.type,
            description: pokemon.description,
            attack: pokemon.attack,
            defense: pokemon.defense,
            height: pokemon.height,
            weight: pokemon.weight,
            favorite: true)
  
        do {
            
            let _ = try db.collection("pokedex").document(p.id ?? "").setData(from: p)
            
        }
        
        catch {
            
            print(error)
            
        }
        
    }
    func AddToFavorites2(pokemon: Favorite) {
        
        
  
        do {
            
            let _ = try db.collection("pokedex").document(pokemon.id ?? "").setData(from: pokemon)
            
        }
        
        catch {
            
            print(error)
            
        }
        
    }
    
    func removeFavorites(pokemon: Pokemon) {
        
        let p = Favorite(
            id: String(pokemon.id),
            name: pokemon.name,
            imageUrl: pokemon.imageUrl,
            type: pokemon.type,
            description: pokemon.description,
            attack: pokemon.attack,
            defense: pokemon.defense,
            height: pokemon.height,
            weight: pokemon.weight,
            favorite: true)
        
            
        db.collection("pokedex").document(p.id ?? "").delete { (error) in
                
                if let error = error {
                    
                    print("Error in remove document: \(error.localizedDescription)")
                    
                }
                
            }
            
        
    
        
    }
    func removeFavorites2(pokemon: Favorite) {
        
    
        
        if let favoriteID = pokemon.id {
            
            db.collection("pokedex").document(favoriteID).delete { (error) in
                
                if let error = error {
                    
                    print("Error in remove document: \(error.localizedDescription)")
                    
                }
                
            }
            
        }
    
        
    }
    func setFavorite(pokemon: Pokemon) -> Bool {
        let p = Favorite(
            id: String(pokemon.id),
            name: pokemon.name,
            imageUrl: pokemon.imageUrl,
            type: pokemon.type,
            description: pokemon.description,
            attack: pokemon.attack,
            defense: pokemon.defense,
            height: pokemon.height,
            weight: pokemon.weight,
            favorite: true)

       
        
            for favorite in self.favorites {
                if favorite.id == p.id {
                   return true
 
                }
            }
        return false
    }
    func setFavorite2(pokemon: Favorite) -> Bool {
       
       
        
            for favorite in self.favorites {
                if favorite.id == pokemon.id {
                   return true
 
                }
            }
        return false
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}


