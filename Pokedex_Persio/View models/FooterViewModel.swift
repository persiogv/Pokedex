//
//  FooterViewModel.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import Foundation

class FooterViewModel: ObservableObject {
    
    // MARK: Typealiases
    
    /// Footer action typealias
    typealias FooterAction = (title: String, action: () -> Void)
    
    // MARK: Enums
    
    /// State enum
    enum State {
        /// success state (provide a message and button action)
        case success((message: String, action: FooterAction))
        /// loading state
        case loading
        /// error state (provide a message and button action)
        case error((message: String, action: FooterAction))
        /// completed state (provide a message)
        case completed(String)
        /// none state
        case none
    }
    
    // MARK: Published
    
    /// Current state
    @Published private(set) var state: State {
        didSet {
            isLoading = false
            
            switch state {
            case .success(let values):
                message = values.message
                action = values.action
            case .loading:
                message = nil
                action = nil
                isLoading = true
            case .error(let values):
                message = values.message
                action = values.action
            case .completed(let message):
                self.message = message
                action = nil
            case .none:
                message = nil
                action = nil
            }
        }
    }
    
    // MARK: Properties
    
    /// The footer message
    private(set) var message: String?
    
    /// Action to be executed by button
    private(set) var action: FooterAction?
    
    /// Is loading flag
    private(set) var isLoading = false
    
    // MARK: Initializers
    
    /// Initializer
    required init() {
        self.state = .none
    }
    
    // MARK: Public methods
    
    /// Updates the current state
    /// - Parameter state: The new state
    func updateToState(_ state: State) {
        self.state = state
    }
}
