//
//  ContentView.swift
//  nano1
//
//  Created by Joshua Wenata Sunarto on 23/04/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismiss) private var dismiss
    
    @Binding var showImmersiveSpace: Bool
    @Binding var immersiveSpaceIsShown: Bool
    @Binding var setSpace: String
    @Binding var bgMusic: String
    @Binding var immersiveSpaceId: String
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var arraydata: [[String: String]] = [
        ["image": "winter_forest_placeholder", "space": "WinterForestSpace"],
        ["image": "beach_placeholder", "space": "BeachSpace"],
        ["image": "mountain_cloud_placeholder", "space": "MountainCloudSpace"],
        ["image": "magic_night_placeholder", "space": "MagicNightSpace"],
        ["image": "island_placeholder", "space": "WinterForestSpace"],
        ["image": "forest_house_placeholder", "space": "WinterForestSpace"],
    ]
    
    var body: some View {
        ZStack {
            
            Image("background")
                .scaledToFill()
                .opacity(0.5)
            VStack {
                
                if immersiveSpaceIsShown {
                    SoundPage(
                        showImmersiveSpace: $showImmersiveSpace,
                        immersiveSpaceIsShown: $immersiveSpaceIsShown,
                        setSpace: $setSpace,
                        bgMusic: $bgMusic,
                        immersiveSpaceId: $immersiveSpaceId
                    )
                }else{
                    MainPage(showImmersiveSpace: $showImmersiveSpace,
                             immersiveSpaceIsShown: $immersiveSpaceIsShown,
                             setSpace: $setSpace,
                             bgMusic: $bgMusic,
                             immersiveSpaceId: $immersiveSpaceId
                    )
                }
                
            }
        }
    }
}
