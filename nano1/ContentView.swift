//
//  ContentView.swift
//  nano1
//
//  Created by Joshua Wenata Sunarto on 23/04/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    @State private var setSpace = ""
    @State private var bgMusic = ""

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {
            Card(
                card: CardModel(
                    image: "winter_forest_placeholder",
                    action: {
                        setSpace = "WinterForestSpace"
                        bgMusic = "music1"
                        showImmersiveSpace.toggle()
                    }
                )
            )
            
            Card(
                card: CardModel(
                    image: "magic_night_placeholder",
                    action: {
                        setSpace = "MagicNightSpace"
                        showImmersiveSpace.toggle()
                    }
                )
            )

        }
        .padding()
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
                    showImmersiveSpace.toggle()
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
