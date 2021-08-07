//
//  ContentView.swift
//  Pokemon
//
//  Created by Macbook Pro on 12/06/21.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
            TabView {
                PokemonsView()
                    .tabItem {
                        Label("Pokedex", systemImage: "books.vertical.fill")
                    }
                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "sparkles")
                    }
                    .background(foregroundColor(.black))
                   
            }
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
