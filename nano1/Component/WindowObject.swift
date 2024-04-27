//
//  WindowObject.swift
//  nano1
//
//  Created by Joshua Wenata Sunarto on 27/04/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct WindowObject: View {
    var name: String
    var size: Float = 1.0
    
//    @State private var audioController: AudioPlaybackController?
    
    var body: some View {
        RealityView { content in
            if let entity = try? await Entity(named: name, in: realityKitContentBundle) {
                
                entity.availableAnimations.forEach { animation in
                    entity.playAnimation(animation.repeat(), transitionDuration: 0.5)
                }
                
//                let spatialAudioEntity = entity.findEntity(named: "SpatialAudio")
//                
//                guard let resource = try? await AudioFileResource(named: "/Root/deer/SpatialAudio", from: "Scene.usda") else {
//                    fatalError("Unable to load audio resource")
//                }
                
                content.add(entity)
            }
        }
    }
}

