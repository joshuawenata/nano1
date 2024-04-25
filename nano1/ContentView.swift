//
//  ContentView.swift
//  nano1
//
//  Created by Joshua Wenata Sunarto on 23/04/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

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

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var arraydata: [[String: String]] = [
        ["image": "winter_forest_placeholder", "space": "WinterForestSpace"],
        ["image": "magic_night_placeholder", "space": "MagicNightSpace"],
        ["image": "mountain_cloud_placeholder", "space": "MountainCloudSpace"],
        ["image": "winter_forest_placeholder", "space": "WinterForestSpace"],
        ["image": "winter_forest_placeholder", "space": "WinterForestSpace"],
        ["image": "winter_forest_placeholder", "space": "WinterForestSpace"],
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
                        showImmersiveSpace.toggle()
                    }
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
