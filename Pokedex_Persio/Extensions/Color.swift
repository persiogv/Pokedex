//
//  Color.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import SwiftUI

extension Color {
    
    // MARK: Enums
    
    /// Assets enum
    enum Asset: String {
        case tint
        case background
    }
    
    // MARK: Public methods
    
    /// Returns a Color from the given asset
    static func fromAsset(_ asset: Asset) -> Color {
        return Color(asset.rawValue)
    }
}
