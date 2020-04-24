//
//  InfoView.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    
    // MARK: Properties
    
    private let viewModel: InfoViewModel
    
    // MARK: Initializers
    
    /// Initializer
    /// - Parameter viewModel: A InfoViewModel instance
    init(viewModel: InfoViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: .fontSize, weight: .bold, design: .default))
                    .padding([.top, .bottom, .trailing], .margin)
                Spacer()
                Text(viewModel.value)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: .fontSize, weight: .bold, design: .default))
                    .foregroundColor(.fromAsset(.tint))
                    .padding([.top, .bottom, .leading], .margin)
            }
            Divider()
        }
    }
}
