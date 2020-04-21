//
//  ListViewModel.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import Foundation
import PokeClient

class ListViewModel {
    
    // MARK: Published
    
    /// The pokemons list
    @Published var pokemons: [PokemonViewModel]
    
    /// A FooterViewModel instance
    @Published var footerViewModel = FooterViewModel()
    
    /// The view's title
    @Published private(set) var title: String
    
    // MARK: Properties
    
    /// A PokemonListProvider & FavoritePokemonProvider adopter
    private(set) var provider: PokemonListProvider & FavoritePokemonProvider
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameters:
    ///   - provider: A PokemonListProvider & FavoritePokemonProvider adopter
    ///   - title: The view title
    init(provider: PokemonListProvider & FavoritePokemonProvider, title: String) {
        self.provider = provider
        self.title = title
        
        pokemons = []
    }
    
    // MARK: Public methods
    
    /// Fetches the pokemons
    func fetchPokemons() {
        /* To be overrided */
    }
    
    /// Refreshes the pokemons list
    func refreshList() {
        pokemons.removeAll()
        fetchPokemons()
    }
}
