//
//  DetailsView.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import SwiftUI
import PokeClient

struct DetailsView: View {
    
    // MARK: Properties
    
    @ObservedObject private var viewModel: DetailsViewModel
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameter viewModel: A DetailsViewModel instance
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: View
    
    var body: some View {
        List {
            if !viewModel.sprites.isEmpty {
                Section(header: HeaderView(title: "sprites")) {
                    ForEach(viewModel.sprites, id: \.id) { viewModel in
                        SpriteView(viewModel: viewModel)
                    }
                }
            }
            
            if !viewModel.identity.isEmpty {
                section(withTitle: "identity", items: viewModel.identity)
            }

            if !viewModel.measures.isEmpty {
                section(withTitle: "measures", items: viewModel.measures)
            }
            
            if !viewModel.types.isEmpty {
                section(withTitle: "types", items: viewModel.types)
            }
            
            if !viewModel.stats.isEmpty {
                section(withTitle: "stats", items: viewModel.stats)
            }
            
            if !viewModel.games.isEmpty {
                section(withTitle: "games", items: viewModel.games)
            }

            if !viewModel.abilities.isEmpty {
                section(withTitle: "abilities", items: viewModel.abilities)
            }
            
            Section(footer: FooterView(viewModel: viewModel.footerViewModel)) {
                CustomButton(title: viewModel.isFavorited ? "remove from favorites" : "add to favorites") {
                    self.viewModel.isFavorited ? self.viewModel.removeFromFavorites() : self.viewModel.addToFavorites()
                }
            }
        }.onAppear {
            self.viewModel.fetchPokemonDetails()
        }
        .navigationBarTitle(viewModel.pokemonName)
    }
    
    // MARK: Private methods
    
    private func section(withTitle title: String, items: [InfoViewModel]) -> some View {
        Section(header: HeaderView(title: title)) {
            ForEach(items, id: \.id) { viewModel in
                InfoView(viewModel: viewModel)
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonViewModel = PokemonViewModel(pokemon: Pokemon(name: "bulbasaur", url: ""), favorited: false)
        let viewModel = DetailsViewModel(provider: PokemonDetailsProviderMock(), pokemonViewModel: pokemonViewModel, listViewModel: nil)
        
        return DetailsView(viewModel: viewModel)
    }
}
