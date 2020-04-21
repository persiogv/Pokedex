//
//  SceneDelegate.swift
//  Pokedex_Persio
//
//  Created by Pérsio on 19/04/20.
//  Copyright © 2020 Persio Vieira. All rights reserved.
//

import UIKit
import SwiftUI
import PokeClient

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let tabView = TabView {
            PokedexView(viewModel: PokedexViewModel())
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text(Localizable.Pokedex.title)
            }

            FavoritesView(viewModel: FavoritesViewModel())
                .tabItem {
                    Image(systemName: "star.fill")
                    Text(Localizable.Favorites.title)
            }
        }
        .accentColor(.fromAsset(.tint))
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: tabView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
