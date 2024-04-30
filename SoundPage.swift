//
//  SoundPage.swift
//  nano1
//
//  Created by Joshua Wenata Sunarto on 29/04/24.
//

import SwiftUI

struct SoundPage: View {
    
    @Binding var showImmersiveSpace: Bool
    @Binding var immersiveSpaceIsShown: Bool
    @Binding var setSpace: String
    @Binding var bgMusic: String
    @Binding var immersiveSpaceId: String
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        switch setSpace {
            case "WinterForestSpace":
                ambientSoundsView (
                    icon1: "cloud.snow.fill",
                    icon2: "figure.walk",
                    icon3: "wind.snow",
                    sound1: "winter_wind",
                    sound2: "footstep_onSnowmp3",
                    sound3: "snow_storm"
                )
            case "BeachSpace":
                ambientSoundsView (
                    icon1: "water.waves",
                    icon2: "bird.fill",
                    icon3: "leaf.fill",
                    sound1: "ocean",
                    sound2: "birds_singing",
                    sound3: "palm_tree"
                )
            case "MountainCloudSpace":
                ambientSoundsView (
                    icon1: "humidity",
                    icon2: "wind",
                    icon3: "bird.fill",
                    sound1: "water_flow",
                    sound2: "cold_wind",
                    sound3: "birds_singing"
                )
            case "MagicNightSpace":
                ambientSoundsView (
                    icon1: "tree",
                    icon2: "tree",
                    icon3: "tree",
                    sound1: "snow_storm",
                    sound2: "footstep_onSnowmp3",
                    sound3: "winter_forest"
                )
                
            default:
                Text("Ambient sounds not available")
        }
        
        Button {
            Task {
                await dismissImmersiveSpace()
                immersiveSpaceIsShown = false
                showImmersiveSpace.toggle()
            }
        } label: {
            Image(systemName: "arrowshape.backward.circle.fill")
                .colorMultiply(.white)
                .frame(width: 200, height: 50)
                .font(.system(size: 30))
        }
        .padding(.top, 30)
    }
}

