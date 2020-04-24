//
//  ErrorView.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    
    // MARK: Identifiers
    
    private enum Identifiers: String {
        case error_text
        case error_button
    }
    
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
                .accessibility(identifier: Identifiers.error_text.rawValue)
                .padding()
            
            Button(viewModel.buttonAction.title) {
                self.viewModel.buttonAction.action()
            }
            .accessibility(identifier: Identifiers.error_button.rawValue)
            .padding()
        }
    }
}
