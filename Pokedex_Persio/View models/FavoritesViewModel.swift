//
//  FavoritesViewModel.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import Foundation
import PokeClient

class FavoritesViewModel: ListViewModel, ObservableObject {
    
    // MARK: Initializer
    
    /// Initializer
    /// - Parameter provider: A PokemonListProvider & FavoritePokemonProvider adopter
    required init(provider: PokemonListProvider & FavoritePokemonProvider = PokeClient()) {
        super.init(provider: provider, title: Localizable.Favorites.title)
    }
    
    // MARK: Method overrides
    
    override func fetchPokemons() {
        footerViewModel.updateToState(.loading)
        
        provider.fetchFavoritedPokemons { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let pokemons):
                self.pokemons = pokemons.map { PokemonViewModel(pokemon: $0, favorited: self.provider.checkForFavorite($0)) }
                self.footerViewModel.updateToState(.none)
            case .failure:
                let action = FooterViewModel.FooterAction(title: Localizable.Footer.Button.error, action: self.fetchPokemons)
                self.footerViewModel.updateToState(.error((message: Localizable.Footer.Message.error, action: action)))
            }
        }
    }
}
