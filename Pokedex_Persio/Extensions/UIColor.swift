//
//  UIColor.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import UIKit

extension UIColor {
    
    // MARK: Enums
    
    /// Assets enum
    enum Asset: String {
        case tint
    }
    
    // MARK: Public methods
    
    /// Returns a Color from the given asset
    static func fromAsset(_ asset: Asset) -> UIColor {
        return UIColor(named: asset.rawValue) ?? .clear
    }
}
