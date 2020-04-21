//
//  HeaderView.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    
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
                .font(.system(size: 16, weight: .light, design: .default))
            
            Divider()
        }
        .padding(EdgeInsets(top: 24, leading: 16, bottom: 16, trailing: 16))
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .background(Color.fromAsset(.background))
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "sprites")
    }
}
