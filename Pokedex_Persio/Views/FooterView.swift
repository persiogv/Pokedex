//
//  FooterView.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 19/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import SwiftUI

struct FooterView: View {
    
    // MARK: Properties
    
    @ObservedObject private var viewModel: FooterViewModel
    @State private var isLoading: Bool = true
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameter viewModel: A FooterViewModel instance
    init(viewModel: FooterViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: View
    
    var body: some View {
        VStack {
            if viewModel.message != nil {
                Text(viewModel.message ?? String())
                    .foregroundColor(.gray)
            }
            
            if viewModel.action != nil {
                CustomButton(title: viewModel.action?.title ?? String()) {
                    self.viewModel.action?.action()
                }
                .padding()
                .foregroundColor(.fromAsset(.tint))
                .frame(maxWidth: .infinity)
                .font(.system(size: 16, weight: .bold, design: .default))
            }
            
            if viewModel.isLoading {
                ActivityIndicator(isAnimating: $isLoading, style: .medium)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        let action = FooterViewModel.FooterAction(title: "load more", action: {})
        
        let viewModel = FooterViewModel()
        viewModel.updateToState(.success((message: "20 pokemons loaded", action: action)))
        return FooterView(viewModel: viewModel)
    }
}
