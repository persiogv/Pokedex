//
//  DetailsScreen.swift
//  Pokedex_PersioUITests
//
//  Created by Pérsio on 23/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import XCTest
import CoreUITests

class DetailsScreen: Screen {
    
    var errorLabel: Element {
        return waitForElement(withLabel: "an error has ocurred", query: Queries.staticTexts)
    }
    
    func navigationTitle(_ title: String) -> Element {
        return waitForElement(withIdentifier: title, query: Queries.navigationBars)
    }
}
