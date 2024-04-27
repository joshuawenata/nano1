//
//  nano1App.swift
//  nano1
//
//  Created by Joshua Wenata Sunarto on 23/04/24.
//

import SwiftUI

@main
struct nano1App: App {
    @Environment(\.openWindow) var openWindow
    @State private var style: ImmersionStyle = .full
    
    var body: some Scene {
        WindowGroup(id: "Main"){
            ContentView()
        }

        ImmersiveSpace(id: "WinterForestSpace") {
            ImmersiveView(skyboxAssets: "winter_forest", bgMusic: "winter_forest", object: StaticObject(name: "Deer").makeEntity()!)
        }
        .immersionStyle(selection: $style, in: .full)
        
        ImmersiveSpace(id: "MagicNightSpace") {
            ImmersiveView(skyboxAssets: "magic_night", bgMusic: "magic_night", object: StaticObject(name: "Bird").makeEntity()!)
        }
        .immersionStyle(selection: $style, in: .full)
        
        ImmersiveSpace(id: "MountainCloudSpace") {
            ImmersiveView(skyboxAssets: "mountain_cloud", bgMusic: "mountain_cloud", object: StaticObject(name: "Dragon").makeEntity()!)
        }
        .immersionStyle(selection: $style, in: .full)
        
        ImmersiveSpace(id: "BeachSpace") {
            ImmersiveView(skyboxAssets: "beach", bgMusic: "beach", object: StaticObject(name: "Bird").makeEntity()!)
        }
        .immersionStyle(selection: $style, in: .full)
    }
}
