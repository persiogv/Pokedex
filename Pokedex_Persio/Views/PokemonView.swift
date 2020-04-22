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
                    .font(.some(.system(size: .margin, weight: .bold, design: .default)))
                    .padding(EdgeInsets(top: .margin, leading: .zero, bottom: .margin, trailing: .margin))
                
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
