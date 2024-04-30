//
//  MainPage.swift
//  nano1
//
//  Created by Joshua Wenata Sunarto on 29/04/24.
//

import SwiftUI

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

var arraydata: [[String: String]] = [
    ["image": "winter_forest_placeholder", "space": "WinterForestSpace"],
    ["image": "beach_placeholder", "space": "BeachSpace"],
    ["image": "mountain_cloud_placeholder", "space": "MountainCloudSpace"],
    ["image": "magic_night_placeholder", "space": "MagicNightSpace"],
    ["image": "island_placeholder", "space": "WinterForestSpace"],
    ["image": "forest_house_placeholder", "space": "WinterForestSpace"],
]

struct MainPage: View {
    
    @Binding var showImmersiveSpace: Bool
    @Binding var immersiveSpaceIsShown: Bool
    @Binding var setSpace: String
    @Binding var bgMusic: String
    @Binding var immersiveSpaceId: String
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
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
        .padding()
        .padding(.top, 30)
        .padding(.bottom, 30)
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

