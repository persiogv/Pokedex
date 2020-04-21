//
//  SpriteView.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import SwiftUI
import CoreSwiftUI

struct SpriteView: View {
    
    // MARK: Properties
    
    @Environment(\.imageCache) var cache: ImageCache
    @State var isLoading: Bool = true

    private let viewModel: InfoViewModel
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameter viewModel: A InfoViewModel instance
    init(viewModel: InfoViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: View
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 14, weight: .bold, design: .default))
                Spacer()
                
                AsyncImage(url: viewModel.value, cache: cache, placeholder: ActivityIndicator(isAnimating: $isLoading, style: .medium), configuration: { $0.resizable() })
                .frame(width: 80, height: 80)
            }
            
            Divider()
        }
    }
}

struct SpriteView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = InfoViewModel(name: "front_default", value: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png")
        return SpriteView(viewModel: viewModel)
    }
}
