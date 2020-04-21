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
                    .font(.system(size: 14, weight: .bold, design: .default))
                    .padding([.top, .bottom, .trailing], 16)
                Spacer()
                Text(viewModel.value)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 14, weight: .bold, design: .default))
                    .foregroundColor(.fromAsset(.tint))
                    .padding([.top, .bottom, .leading], 16)
            }
            Divider()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = InfoViewModel(name: "name", value: "bulbasaur")
        return InfoView(viewModel: viewModel)
    }
}
