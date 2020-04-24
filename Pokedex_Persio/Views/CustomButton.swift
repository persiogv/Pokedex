//
//  CustomButton.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 21/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    
    // MARK: Constants
    
    private enum Constants {
        static let fontSize: CGFloat = 16
    }
    
    // MARK: Properties
    
    private let title: String
    private let action: () -> Void
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameters:
    ///   - title: The button title
    ///   - action: The button action
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    // MARK: View
    
    var body: some View {
        Button(title, action: action)
            .padding()
            .foregroundColor(.fromAsset(.tint))
            .frame(maxWidth: .infinity)
            .font(.system(size: Constants.fontSize, weight: .bold, design: .default))
    }
}
