//
//  CustomButton.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 21/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    
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
            .font(.system(size: 16, weight: .bold, design: .default))
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "load more", action: {})
    }
}
