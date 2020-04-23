//
//  PokedexFailureFeature.swift
//  Pokedex_PersioUITests
//
//  Created by Pérsio on 21/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import XCTest
import CoreUITests

class PokedexFailureFeature: Feature {
    
    private let dynamicStubs = DynamicStubs(initialStubs: [
        HTTPStubInfo(url: "/pokemon", jsonFilename: "error", method: .GET)
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
        given("I am at Pokedex screen") {
            dynamicStubs.setupStub(url: "/pokemon", filename: "error")
        }
        
        then("I should see its elements properly") {
            XCTAssertTrue(pokedexScreen.errorText.isVisible)
            XCTAssertTrue(pokedexScreen.errorButton.isVisible)
        }
    }
}
