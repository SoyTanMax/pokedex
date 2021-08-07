//
//  SwiftUIView.swift
//  Pokemon
//
//  Created by Héctor Garcíaluna on 13/06/21.
//

import SwiftUI
import Kingfisher
import SDWebImageSwiftUI

struct PokemonDetailView: View {
    
    var pokemon: Pokemon
    var media = MediaModel()
    @State var isFavorite: Bool 
   
    
    
    var body: some View {
        
        
        
        ZStack{
           
            Color(media.background(forType: pokemon.type))
                .opacity(0.8)
            VStack{
                HStack {
                    VStack(alignment: .leading){
                        Text(pokemon.name.capitalized)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 40))
                            .padding(.top, 24)
                            .padding(.bottom, 0)
                        
                        HStack {
                            
                            Text(pokemon.type.capitalized)
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 20))
                                .padding(.vertical, 8)
                                .padding(.horizontal, 20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.white.opacity(0.35))
                                )
                        }
                        
                    }
                    Spacer()
                    VStack {
                        if media.setFavorite(pokemon: pokemon) == false {
                            Button(action: {
                                media.AddToFavorites(pokemon: pokemon)
                                self.isFavorite = true
                                   }, label: {
                                Image(systemName: "heart" )
                                    .foregroundColor(.white)
                                    .font(.system(size: 24))
                                    .padding(.top, 15)
                            })
                           
                               
                            
                        } else  {
                            
                            Button(action: {
                                    media.removeFavorites(pokemon: pokemon)
                                    self.isFavorite = false}, label: {
                                Image(systemName: "heart.fill" )
                                    .foregroundColor(.white)
                                    .font(.system(size: 24))
                                    .padding(.top, 15)
                            })
                        }
                       
                        Text("#\(pokemon.id)")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .padding(.top, 15)
                            .frame(alignment: .trailing)
                    }
                    
                }
                .padding(.bottom, 140)
                .padding(.top, 30)
                .frame(maxWidth: 380)
                .padding(.horizontal, 20)
                
                ZStack{
                    Image("pokeball")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.25)
                        .frame(width: 250, height: 250)
                        .padding(.trailing, -200)
                        .padding(.top, -520)
                    VStack {
                        VStack(alignment: .leading){
                            Text("About")
                                .foregroundColor(Color("DarkBlue"))
                                .fontWeight(.bold)
                                .font(.system(size: 30))
                                .padding(.top, -40)
                            HStack {
                                Text(pokemon.description)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("DarkBlue"))
                                    .padding()
                            }
                            .padding(.leading, -15)
                            
                            HStack{
                                Text("Attack:")
                                    .foregroundColor(.gray)
                                    .fontWeight(.bold)
                                    .font(.system(size: 20))
                                Spacer()
                                Text("\(pokemon.attack)")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("DarkBlue"))
                                    .padding()
                            }
                            .frame(maxWidth: 180)
                            
                            HStack{
                                Text("Defense:")
                                    .foregroundColor(.gray)
                                    .fontWeight(.bold)
                                    .font(.system(size: 20))
                                Spacer()
                                Text("\(pokemon.defense)")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("DarkBlue"))
                                    .padding()
                            }
                            .frame(maxWidth: 180)
                            HStack{
                                Text("Weight:")
                                    .foregroundColor(.gray)
                                    .fontWeight(.bold)
                                    .font(.system(size: 20))
                                Spacer()
                                Text("\(pokemon.weight)")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("DarkBlue"))
                                    .padding()
                            }
                            .frame(maxWidth: 180)
                            HStack{
                                Text("Height:")
                                    .foregroundColor(.gray)
                                    .fontWeight(.bold)
                                    .font(.system(size: 20))
                                Spacer()
                                Text("\(pokemon.height)")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("DarkBlue"))
                                    .padding()
                            }
                            .frame(maxWidth: 180)
                            
                            
                            
                            
                            
                            
                            
                        }
                        .padding(.leading, 20)
                        
                    }
                    .frame(width: 400, height: 480)
                    .background(Color(.white))
                    .cornerRadius(50)
                    
                    WebImage(url: extractImage(url: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 220)
                        .padding(.top, -380)
                        .padding(.trailing, -100)
                    
                }
                
            }
            
        }
        .ignoresSafeArea(.all)
    }
    func extractImage(url: String) -> URL{
        
        return URL(string: url)!
    }
    
    
    
    
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: dummyPokemon[0], isFavorite: false)
    }
}
