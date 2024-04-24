//
//  nano1App.swift
//  nano1
//
//  Created by Joshua Wenata Sunarto on 23/04/24.
//

import SwiftUI

@main
struct nano1App: App {
    
    @State private var style: ImmersionStyle = .full
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "WinterForestSpace") {
            ImmersiveView(skyboxAssets: "winter_forest")
        }
        .immersionStyle(selection: $style, in: .full)
        
        ImmersiveSpace(id: "MagicNightSpace") {
            ImmersiveView(skyboxAssets: "magic_night")
        }
        .immersionStyle(selection: $style, in: .full)
    }
}
