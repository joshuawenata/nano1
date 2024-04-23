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

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        HStack {
            HStack {
                Image("winter_forest_placeholder")
                    .resizable()
                    .padding()
                    .frame(width: 200, height: 200)
                    .border(Color.white, width: 20)
                
                VStack {
                    Text("Into the snow woods!")
                        .font(.largeTitle)
                    Button(action: {
                        setSpace = "ImmersiveSpace"
                        print("space: ", setSpace)
                        showImmersiveSpace.toggle()
                    }, label: {
                        Text("Show Immersive Space")
                    })
                }
                .padding(.leading, 50)
                
            }
//            HALO TESTING
            Spacer()
            
            HStack {
                Image("magic_night_prev")
                    .resizable()
                    .padding()
                    .frame(width: 200, height: 200)
                    .border(Color.white, width: 20)
                
                VStack {
                    Text("Into the unbelieveable magic night!")
                        .font(.largeTitle)
                    Button(action: {
                        setSpace = "MagicNightSpace"
                        print("space: ", setSpace)
                        showImmersiveSpace.toggle()
                    }, label: {
                        Text("Show The Magic")
                    })
                }
                .padding(.leading, 50)
                
            }
            
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
