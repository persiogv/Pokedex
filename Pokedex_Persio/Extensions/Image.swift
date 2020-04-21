//
//  Image.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import SwiftUI

extension Image {
    
    // MARK: Enums
    
    /// Assets enum
    enum Asset: String {
        case star
    }
    
    // MARK: Public methods
    
    /// Returns an Image from the given asset
    static func fromAsset(_ asset: Asset) -> Image {
        return Image(asset.rawValue)
    }
}
