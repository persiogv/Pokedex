//
//  PokemonListProviderMock.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import Foundation
import PokeClient
import Core

class PokemonListProviderMock: PokemonListProvider, FavoritePokemonProvider {
    func checkForFavorite(_ pokemon: Pokemon) -> Bool {
        return true
    }
    
    func fetchFavoritedPokemons(completion: @escaping PokemonListCompletion) {}
    
    func favoritePokemon(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion) {}
    
    func removeFromFavorites(pokemon: Pokemon, completion: @escaping PokemonFavoriteCompletion) {}
    
    func fetchPokemonList(offset: Int, limit: Int, completion: @escaping PokemonListCompletion) {
        let file = FileRepresentation(withFileName: "pokemon_list", fileExtension: .json, fileBundle: Bundle(for: Self.self))
        let pokemonResponse = try? file.decoded(to: PokemonResponse.self, using: JSONDecoder())
        
        completion(.success(pokemonResponse?.results ?? []))
    }
}
