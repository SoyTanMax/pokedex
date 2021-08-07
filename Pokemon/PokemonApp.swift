//
//  PokemonApp.swift
//  Pokemon
//
//  Created by Macbook Pro on 12/06/21.
//

import SwiftUI
import Firebase

@main
struct PokemonApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
