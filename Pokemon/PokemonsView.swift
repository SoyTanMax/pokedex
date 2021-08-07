//
//  PokemonsView.swift
//  Pokemon
//
//  Created by Macbook Pro on 13/06/21.
//

import SwiftUI
import Kingfisher
import SDWebImageSwiftUI

struct PokemonsView: View {
    
    @ObservedObject var media = MediaModel()
    private let gridItems = [GridItem(.flexible()),
                             GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                Text("Pokedex")
                    .foregroundColor(Color("DarkBlue"))
                    .font(.system(size: 32))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                LazyVGrid(columns: gridItems, spacing: 16){
                    ForEach(media.pokemon){ pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon, media: media, isFavorite: false),
                                       label: {
                                        PokemonCellView(pokemon: pokemon, media: media)
                                       })
                        
                    }
                }
            }
            .navigationBarHidden(true)
            .accentColor(.white)
        }
    }
}

struct PokemonsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonsView()
    }
}

struct PokemonCellView: View{
    
    let pokemon: Pokemon
    var media = MediaModel()
    
    var body: some View{
        ZStack{
            VStack{
                Text(pokemon.name.capitalized)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .padding(.top, 24)
                    .padding(.bottom, -12)
                HStack{
                    Text(pokemon.type.capitalized)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.system(size: 12))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                    ZStack{
                        Image("pokeball")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.25)
                            .frame(width: 110, height: 110)
                            .padding([.bottom, .trailing], -12)
                        WebImage(url: extractImage(url: pokemon.imageUrl))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding([.bottom, .trailing], 4)
                    }
                }
            }
            .frame(minWidth: 180)
        }
        .background(Color(media.background(forType: pokemon.type)).opacity(0.8))
        .cornerRadius(24)
        
    }
    func extractImage(url: String) -> URL{
        
        return URL(string: url)!
    }
}

struct PokemonCellView_Previews: PreviewProvider{
    static var previews: some View{
        PokemonCellView(pokemon: dummyPokemon[0])
    }
}
