//
//  DetailsViewModel.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import Foundation
import PokeClient

class DetailsViewModel: ObservableObject {
    
    // MARK: Published
    
    /// A PokemonDetails instance
    @Published private(set) var pokemonDetails: PokemonDetails?
    
    /// A FooterViewModel instance
    @Published private(set) var footerViewModel = FooterViewModel()
    
    /// Favorited flag
    @Published private(set) var isFavorited: Bool

    // MARK: Properties

    private let provider: PokemonDetailsProvider & FavoritePokemonProvider
    private let pokemonViewModel: PokemonViewModel
    private weak var listViewModel: ListViewModel?

    /// Returns the pokemon name
    var pokemonName: String {
        return pokemonViewModel.pokemonName
    }
    
    /// Returns the pokemon sprites
    var sprites: [InfoViewModel] {
        if let value = pokemonDetails?.sprites?.frontDefault {
            return [InfoViewModel(name: Localizable.Details.Sprites.name, value: value)]
        }
        
        return []
    }
    
    /// Returns the pokemon identity
    var identity: [InfoViewModel] {
        let nameInfo = InfoViewModel(name: Localizable.Details.Identity.name, value: pokemonViewModel.pokemonName)
        
        return [nameInfo, number]
    }
    
    /// Returns the pokemon measures
    var measures: [InfoViewModel] {
        return [height, weight]
    }
    
    /// Returns the pokemon abilities
    var abilities: [InfoViewModel] {
        return pokemonDetails?.abilities?.map { InfoViewModel(name: $0.ability?.name ?? Localizable.Details.General.unavailable, value: String(format: Localizable.Details.Formats.slot, $0.slot ?? .zero)) } ?? []
    }
    
    /// Return the pokemon types
    var types: [InfoViewModel] {
        return pokemonDetails?.types?.map { InfoViewModel(name: $0.type?.name ?? Localizable.Details.General.unavailable, value: String(format: Localizable.Details.Formats.slot, $0.slot ?? .zero)) } ?? []
    }
    
    /// Returns the pokemom stats
    var stats: [InfoViewModel] {
        return pokemonDetails?.stats?.map {
            let value = String(format: Localizable.Details.Formats.stats, $0.effort ?? .zero, $0.baseStat ?? .zero)
            return InfoViewModel(name: $0.stat?.name ?? String(), value: value)
        } ?? []
    }
    
    /// Return the pokemon games
    var games: [InfoViewModel] {
        return pokemonDetails?.gameIndices?.map { InfoViewModel(name: $0.version?.name ?? Localizable.Details.General.unavailable, value: String(format: Localizable.Details.Formats.games, $0.gameIndex ?? .zero)) } ?? []
    }
    
    // MARK: Private properties
    
    private var number: InfoViewModel {
        if let order = pokemonDetails?.order {
            return InfoViewModel(name: Localizable.Details.Number.name, value: String(format: Localizable.Details.Formats.number, order))
        }
        
        return InfoViewModel(name: Localizable.Details.Number.name, value: Localizable.Details.General.unavailable)
    }
    
    private var height: InfoViewModel {
        if let height = pokemonDetails?.height {
            return InfoViewModel(name: Localizable.Details.Height.name, value: String(format: Localizable.Details.Formats.height, height))
        }
        
        return InfoViewModel(name: Localizable.Details.Height.name, value: Localizable.Details.General.unavailable)
    }
    
    private var weight: InfoViewModel {
        if let weight = pokemonDetails?.weight {
            return InfoViewModel(name: Localizable.Details.Weight.name, value: String(format: Localizable.Details.Formats.weight, weight))
        }
        
        return InfoViewModel(name: Localizable.Details.Weight.name, value: Localizable.Details.General.unavailable)
    }
    
    // MARK: Initializer
    
    /// Initializer
    /// - Parameters:
    ///   - provider: A PokemonDetailsProvider & FavoritePokemonProvider adopter
    ///   - pokemonViewModel: A PokemonViewModel instance
    ///   - listViewModel: A ListViewModel instance
    required init(provider: PokemonDetailsProvider & FavoritePokemonProvider = PokeClient(), pokemonViewModel: PokemonViewModel, listViewModel: ListViewModel?) {
        self.provider = provider
        self.pokemonViewModel = pokemonViewModel
        self.listViewModel = listViewModel
        
        isFavorited = provider.checkForFavorite(pokemonViewModel.pokemon)
    }
    
    // MARK: Public methods
    
    /// Fetches the pokemon details
    func fetchPokemonDetails() {
        footerViewModel.updateToState(.loading)
                
        provider.fetchPokemonDetails(pokemon: pokemonViewModel.pokemon) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let pokemonDetails):
                self.footerViewModel.updateToState(.none)
                self.pokemonDetails = pokemonDetails
            case .failure:
                let action = FooterViewModel.FooterAction(title: Localizable.Footer.Button.error, action: self.fetchPokemonDetails)
                self.footerViewModel.updateToState(.error((message: Localizable.Footer.Message.error, action: action)))
            }
        }
    }
    
    /// Removes the pokemon from favorites
    func removeFromFavorites() {
        footerViewModel.updateToState(.loading)
                
        provider.removeFromFavorites(pokemon: pokemonViewModel.pokemon) { [weak self] result in
            guard let self = self else { return }
            
            self.handleResult(result: result)
        }
    }
    
    /// Adds the pokemon to favorites
    func addToFavorites() {
        footerViewModel.updateToState(.loading)
                
        provider.favoritePokemon(pokemon: pokemonViewModel.pokemon) { [weak self] result in
            guard let self = self else { return }
            
            self.handleResult(result: result)
        }
    }
    
    // MARK: Private methods
    
    private func handleResult(result: Result<Pokemon, Error>) {
        switch result {
        case .success:
            self.footerViewModel.updateToState(.none)
            self.isFavorited.toggle()
            self.listViewModel?.refreshList()
        case .failure:
            self.footerViewModel.updateToState(.completed(Localizable.Footer.Message.error))
        }
    }
}
