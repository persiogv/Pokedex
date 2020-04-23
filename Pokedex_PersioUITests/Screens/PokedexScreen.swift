//
//  PokedexScreen.swift
//  Pokedex_PersioUITests
//
//  Created by Pérsio on 21/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import XCTest
import CoreUITests

class PokedexScreen: Screen {
    
    var errorText: Element {
        return waitForElement(withIdentifier: "error_text", query: Queries.staticTexts)
    }
    
    var errorButton: Element {
        return waitForElement(withIdentifier: "error_button", query: Queries.buttons)
    }

    var navigationTitle: Element {
        return waitForElement(withIdentifier: "Pokédex", query: Queries.navigationBars)
    }
    
    var list: Element {
        return waitForElement(withIdentifier: "pokedex_list", query: Queries.otherElements)
    }
    
    func selectPokemon(_ name: String) {
        waitForElement(withLabel: name, query: Queries.buttons).tap()
    }
}
