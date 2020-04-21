//
//  ActivityIndicator.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    // MARK: Properties
    
    /// Animating flag
    @Binding var isAnimating: Bool
    
    /// Activity indicator style
    let style: UIActivityIndicatorView.Style
    
    // MARK: View representable
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
