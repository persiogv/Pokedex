//
//  PokemonDetailsProviderMock.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import Foundation
import PokeClient
import Core

class PokemonDetailsProviderMock: PokemonDetailsProvider & FavoritePokemonProvider {
    
    func checkForFavorite(_ pokemon: Pokemon) -> Bool {
        return true
    }
    
    func fetchFavoritedPokemons(completion: @escaping PokemonListCompletion) {}
    
    func favoritePokemon(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion) {}
    
    func removeFromFavorites(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion) {}
    
    func fetchPokemonDetails(pokemon: Pokemon, completion: @escaping PokemonDetailsCompletion) {
        let file = FileRepresentation(withFileName: "pokemon_details", fileExtension: .json, fileBundle: Bundle(for: Self.self))
        
        do {
            let pokemonDetails = try file.decoded(to: PokemonDetails.self, using: JSONDecoder())
            completion(.success(pokemonDetails))
        } catch {
            completion(.failure(error))
        }
    }
}
