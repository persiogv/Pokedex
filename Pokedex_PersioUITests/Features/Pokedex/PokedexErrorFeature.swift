//
//  PokedexErrorFeature.swift
//  Pokedex_PersioUITests
//
//  Created by Pérsio on 21/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import XCTest
import CoreUITests

class PokedexErrorFeature: Feature {
    
    private let dynamicStubs = DynamicStubs(initialStubs: [
        HTTPStubInfo(url: "/pokemon", jsonFilename: "pokemon_list_error", method: .GET)
    ])
    
    private lazy var pokedexScreen = PokedexScreen(feature: self)
    
    override func setUp() {
        dynamicStubs.setUp()
        super.setUp()
    }
    
    override func tearDown() {
        dynamicStubs.tearDown()
        super.tearDown()
    }

    func testPokedex() {
        dynamicStubs.setupStub(url: "/pokemon", filename: "pokemon_list_error")
        
        XCTAssertTrue(pokedexScreen.errorText.isVisible)
        XCTAssertTrue(pokedexScreen.errorButton.isVisible)
    }
}
