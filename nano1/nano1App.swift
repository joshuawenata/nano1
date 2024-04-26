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
    
        WindowGroup(id: "deer"){
            Object(name: "deer", size: 0.7)
                .transformEffect(.init(translationX: 400, y: 100))
        }
        .windowStyle(.plain)

        ImmersiveSpace(id: "WinterForestSpace") {
            ImmersiveView(skyboxAssets: "winter_forest", bgMusic: "winter_forest")
                .onAppear(){
                    openWindow(id: "deer")
                }
        }
        .immersionStyle(selection: $style, in: .full)
        
        ImmersiveSpace(id: "MagicNightSpace") {
            ImmersiveView(skyboxAssets: "magic_night", bgMusic: "magic_night")
        }
        .immersionStyle(selection: $style, in: .full)
        
        ImmersiveSpace(id: "MountainCloudSpace") {
            ImmersiveView(skyboxAssets: "mountain_cloud", bgMusic: "mountain_cloud")
        }
        .immersionStyle(selection: $style, in: .full)
        
        ImmersiveSpace(id: "BeachSpace") {
            ImmersiveView(skyboxAssets: "beach", bgMusic: "beach")
        }
        .immersionStyle(selection: $style, in: .full)
    }
}
