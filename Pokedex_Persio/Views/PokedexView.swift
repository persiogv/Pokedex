//
//  PokedexView.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 19/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import SwiftUI
import PokeClient

struct PokedexView: View {
    
    // MARK: Identifiers
    
    private enum Identifiers: String {
        case pokedex_list
    }
    
    // MARK: Properties
    
    @ObservedObject private var viewModel: PokedexViewModel
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameter viewModel: A PokemonListViewModel instance
    init(viewModel: PokedexViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: View

    var body: some View {
        NavigationView {
            if viewModel.errorViewModel != nil {
                ErrorView(viewModel: viewModel.errorViewModel!)
                    .navigationBarTitle(viewModel.title)
            } else {
                List {
                    Section(footer: FooterView(viewModel: viewModel.footerViewModel)) {
                        ForEach(viewModel.pokemons, id: \.id) { viewModel in
                            NavigationLink(destination: DetailsView(viewModel: DetailsViewModel(pokemonViewModel: viewModel, listViewModel: self.viewModel))) {
                                PokemonView(viewModel: viewModel)
                            }
                        }
                    }
                }
                .navigationBarTitle(viewModel.title)
                .accessibility(identifier: Identifiers.pokedex_list.rawValue)
            }
        }.onAppear {
            self.viewModel.fetchPokemons()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
