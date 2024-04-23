//
//  nano1App.swift
//  nano1
//
//  Created by Joshua Wenata Sunarto on 23/04/24.
//

import SwiftUI

@main
struct nano1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView(skyboxAssets: "winter_forest")
        }
        
        ImmersiveSpace(id: "MagicNightSpace") {
            ImmersiveView(skyboxAssets: "night_magic")
        }
    }
}
