//
//  PokedexViewModel.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 19/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import Foundation
import PokeClient

class PokedexViewModel: ListViewModel, ObservableObject {
    
    // MARK: Constants
    
    private struct Constants {
        static let initialPage = 0
        static let defaultLimit = 20
        static let pageIncrement = 1
    }
    
    // MARK: Published
    
    /// A ErrorViewModel instance
    @Published private(set) var errorViewModel: ErrorViewModel?

    // MARK: Private properties
    
    /// The page limit to request
    private var pageLimit: Int
    private var currentPage = Constants.initialPage

    // MARK: Public properties
    
    /// Last page flag
    private(set) var isLastPage: Bool
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameters:
    ///   - provider: A PokemonListProvider adopter
    ///   - pageLimit: The limit of items on each page
    required init(provider: PokemonListProvider & FavoritePokemonProvider = PokeClient(), pageLimit: Int = Constants.defaultLimit) {
        self.pageLimit = pageLimit
        isLastPage = false

        super.init(provider: provider, title: Localizable.Pokedex.title)
    }
    
    // MARK: Method overrides
    
    override func fetchPokemons() {
        if isLastPage { return }
        
        footerViewModel.updateToState(.loading)
        
        let offset = currentPage * pageLimit
        provider.fetchPokemonList(offset: offset, limit: pageLimit) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let pokemons):
                self.handleSuccess(pokemons: pokemons)
            case .failure:
                self.handleFailure()
            }
        }
    }
    
    override func refreshList() {
        currentPage = Constants.initialPage
        
        super.refreshList()
    }
    
    // MARK: Private methods
    
    private func handleSuccess(pokemons: [Pokemon]) {
        errorViewModel = nil
        isLastPage = pokemons.count < pageLimit
        currentPage += Constants.pageIncrement
        
        self.pokemons.append(contentsOf: pokemons.map { PokemonViewModel(pokemon: $0, favorited: provider.checkForFavorite($0)) })
        
        if isLastPage {
            return footerViewModel.updateToState(.completed(String(format: Localizable.Footer.Message.default, self.pokemons.count)))
        }
        
        let action = (title: Localizable.Footer.Button.default, action: fetchPokemons)
        footerViewModel.updateToState(.success((message: String(format: Localizable.Footer.Message.default, self.pokemons.count), action: action)))
    }
    
    private func handleFailure() {
        if pokemons.isEmpty {
            let action = (title: Localizable.Error.button, action: fetchPokemons)
            return errorViewModel = ErrorViewModel(message: Localizable.Error.message, buttonAction: action)
        }
        
        let action = (title: Localizable.Footer.Button.error, action: fetchPokemons)
        footerViewModel.updateToState(.error((message: Localizable.Footer.Message.error, action: action)))
    }
}
