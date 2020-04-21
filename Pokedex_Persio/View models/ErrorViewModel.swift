//
//  ErrorViewModel.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import Foundation

struct ErrorViewModel {
    
    // MARK: Typealiases
    
    /// Error action typealias
    typealias ErrorAction = (title: String, action: () -> Void)
    
    // MARK: Properties
    
    /// Message to be displayed
    let message: String
    
    /// The action to be executed
    let buttonAction: ErrorAction
}
