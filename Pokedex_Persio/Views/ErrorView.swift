//
//  ErrorView.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    
    // MARK: Properties
    
    private let viewModel: ErrorViewModel
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameter viewModel: A ErrorViewModel instance
    init(viewModel: ErrorViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: View
    
    var body: some View {
        VStack {
            Text(viewModel.message)
                .foregroundColor(.gray)
                .padding()
            
            Button(viewModel.buttonAction.title) {
                self.viewModel.buttonAction.action()
            }
            .padding()
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    
    static var previews: some View {
        let action = (title: "try again", action: {})
        let viewModel = ErrorViewModel(message: "Ooops! An error has ocurred :(", buttonAction: action)
        
        return ErrorView(viewModel: viewModel)
    }
}
