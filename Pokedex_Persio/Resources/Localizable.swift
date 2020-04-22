//
//  Localizable.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 20/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import Foundation

struct Localizable {
    
    // MARK: Pokedex
    struct Pokedex {
        static let title = "pokedex.title".localized
    }
    
    // MARK: Favorites
    struct Favorites {
        static let title = "favorites.title".localized
    }
    
    // MARK: Details
    struct Details {
        struct Sections {
            static let sprites = "details.sections.sprites".localized
            static let identity = "details.sections.identity".localized
            static let measures = "details.sections.measures".localized
            static let types = "details.sections.types".localized
            static let stats = "details.sections.stats".localized
            static let games = "details.sections.games".localized
            static let abilities = "details.sections.abilities".localized
        }
        
        struct Button {
            static let add = "details.button.add".localized
            static let remove = "details.button.remove".localized
        }
        
        struct Sprites {
            static let name = "details.sprites.name".localized
        }
        
        struct Identity {
            static let name = "details.identity.name".localized
        }
        
        struct Formats {
            static let slot = "details.formats.slot".localized
            static let stats = "details.formats.stats".localized
            static let games = "details.formats.games".localized
            static let number = "details.formats.number".localized
            static let height = "details.formats.height".localized
            static let weight = "details.formats.weight".localized
        }
        
        struct General {
            static let unavailable = "details.general.unavailable".localized
        }
        
        struct Number {
            static let name = "details.number.name".localized
        }
        
        struct Height {
            static let name = "details.height.name".localized
        }
        
        struct Weight {
            static let name = "details.weight.name".localized
        }
    }
    
    // MARK: Footer
    struct Footer {
        struct Message {
            static let `default` = "footer.message.default".localized
            static let error = "footer.message.error".localized
        }
        
        struct Button {
            static let `default` = "footer.button.default".localized
            static let error = "footer.button.error".localized
        }
    }
    
    // MARK: Error
    struct Error {
        static let message = "error.message".localized
        static let button = "error.button".localized
    }
}
