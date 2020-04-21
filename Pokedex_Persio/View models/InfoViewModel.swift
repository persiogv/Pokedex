//
//  InfoViewModel.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import Foundation

struct InfoViewModel: Identifiable {
    
    // MARK: Properties
    
    /// A random id
    let id = UUID()
    
    /// The info title
    let title: String
    
    /// The info value
    let value: String
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameters:
    ///   - title: The title of the info
    ///   - value: The value of the info
    init(name: String, value: String = String()) {
        self.title = name
        self.value = value
    }
}
