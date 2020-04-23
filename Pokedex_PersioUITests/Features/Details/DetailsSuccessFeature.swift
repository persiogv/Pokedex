//
//  DetailsSuccessFeature.swift
//  Pokedex_PersioUITests
//
//  Created by Pérsio on 23/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import XCTest
import CoreUITests

class DetailsSuccessFeature: Feature {
    
    private let dynamicStubs = DynamicStubs(initialStubs: [
        HTTPStubInfo(url: "/pokemon", jsonFilename: "pokemon_list", method: .GET),
        HTTPStubInfo(url: "/pokemon/butterfree", jsonFilename: "pokemon_details", method: .GET)
    ])
    
    private lazy var pokedexScreen = PokedexScreen(feature: self)
    private lazy var detailsScreen = DetailsScreen(feature: self)

    override func setUp() {
        dynamicStubs.setUp()
        super.setUp()
    }
    
    override func tearDown() {
        dynamicStubs.tearDown()
        super.tearDown()
    }
    
    func testDetailsScreenWithSuccess() {
        given("I am at Pokedex screen") {
            dynamicStubs.setupStub(url: "/pokemon", filename: "pokemon_list")
        }
        
        when("I select a pokemon") {
            dynamicStubs.setupStub(url: "/pokemon/butterfree", filename: "pokemon_details")
            
            pokedexScreen.selectPokemon("butterfree")
        }
        
        then("I shoud see the pokemon details correctly") {
            XCTAssertTrue(detailsScreen.navigationTitle("butterfree").isVisible)
        }
    }
}
