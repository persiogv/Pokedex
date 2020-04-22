//
//  HeaderView.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    
    // MARK: Constants
    
    private enum Constants {
        static let fontSize: CGFloat = 16
        static let marginTop: CGFloat = 24
    }
    
    // MARK: Properties
    
    let title: String
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameter title: The header title
    init(title: String) {
        self.title = title
    }
    
    // MARK: View
    
    var body: some View {
        VStack {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.fromAsset(.tint))
                .font(.system(size: Constants.fontSize, weight: .light, design: .default))
            
            Divider()
        }
        .padding(EdgeInsets(top: Constants.marginTop, leading: .margin, bottom: .margin, trailing: .margin))
        .listRowInsets(EdgeInsets(top: .zero, leading: .zero, bottom: .zero, trailing: .zero))
        .background(Color.fromAsset(.background))
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "sprites")
    }
}
