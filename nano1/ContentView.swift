//
//  ContentView.swift
//  nano1
//
//  Created by Joshua Wenata Sunarto on 23/04/24.
//

import SwiftUI
import RealityKit

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

struct ContentView: View {
    
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    @State private var setSpace = ""
    @State private var bgMusic = ""
    @State private var immersiveSpaceId = ""
    
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
                ScrollView {
                    VStack {
                        ForEach(arraydata.chunked(into: 3), id: \.self) { chunk in
                            HStack {
                                ForEach(chunk, id: \.self) { data in
                                    Card(
                                        card: CardModel(
                                            image: data["image"]!,
                                            action: {
                                                setSpace = data["space"]!
                                                showImmersiveSpace.toggle()
                                                
                                            }
                                        )
                                    )
                                    .padding(20)
                                }
                            }
                        }
                    }
                }
                
                if immersiveSpaceIsShown {
//                    ambient sounds button view
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
                            Text("Close immersive space")
                        }
                        .padding(.top, 30)
                    }
                }
                    .padding()
                    .padding(.top, 30)
                    .padding(.bottom, 30)
                    .frame(width: 500, height: 600)
                    .onChange(of: showImmersiveSpace) { _, newValue in
                        Task {
                            if newValue {
                                switch await openImmersiveSpace(id: setSpace) {
                                case .opened:
                                    immersiveSpaceIsShown = true
                                    
                                case .error, .userCancelled:
                                    fallthrough
                                @unknown default:
                                    immersiveSpaceIsShown = false
                                    showImmersiveSpace = false
                                }
                            } else if immersiveSpaceIsShown {
                                await dismissImmersiveSpace()
                                immersiveSpaceIsShown = false
                                showImmersiveSpace = false
                            }
                        }
                    }
            }
        }
    }
    
    #Preview(windowStyle: .automatic) {
        ContentView()
    }
