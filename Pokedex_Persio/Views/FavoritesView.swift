//
//  FavoritesView.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    
    // MARK: Properties
    
    @ObservedObject private var viewModel: FavoritesViewModel
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameter viewModel: A FavoritesViewModel instance
    init(viewModel: FavoritesViewModel) {
        self.viewModel = viewModel
    }

    // MARK: View

    var body: some View {
        NavigationView {
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
        }.onAppear {
            self.viewModel.fetchPokemons()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FavoritesViewModel(provider: PokemonListProviderMock())
        return FavoritesView(viewModel: viewModel)
    }
}
