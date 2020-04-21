//
//  PokemonView.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 19/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import SwiftUI
import PokeClient

struct PokemonView: View {
    
    // MARK: Properties
    
    private let viewModel: PokemonViewModel
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameter viewModel: A PokemonViewModel instance
    init(viewModel: PokemonViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: View
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.pokemonName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.some(.system(size: 16, weight: .bold, design: .default)))
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 16))
                
                if viewModel.favorited {
                    Image.fromAsset(.star)
                        .padding()
                }
            }
            
            Divider()
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemon = Pokemon(name: "pikachu", url: "")
        let viewModel = PokemonViewModel(pokemon: pokemon, favorited: true)
        
        return PokemonView(viewModel: viewModel)
    }
}
