//
//  PokemonViewModel.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 19/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import Foundation
import PokeClient

struct PokemonViewModel: Identifiable {
    
    // MARK: Properties
    
    /// A Pokemon instance
    private(set) var pokemon: Pokemon
    
    /// Favorited flag
    let favorited: Bool
    
    /// A random ID
    let id = UUID()
    
    /// Returns the pokemon name
    var pokemonName: String {
        return pokemon.name
    }
    
    /// Returns the pokemon url
    var pokemonUrl: String? {
        return pokemon.url
    }
    
    // MARK: Initializer
    
    /// Initializer
    /// - Parameters:
    ///   - pokemon: A Pokemon instance
    ///   - favorited: Favorite boolean
    init(pokemon: Pokemon, favorited: Bool) {
        self.pokemon = pokemon
        self.favorited = favorited
    }
}
