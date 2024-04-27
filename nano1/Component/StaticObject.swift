//
//  3DModel.swift
//  nano1
//
//  Created by Joshua Wenata Sunarto on 25/04/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct StaticObject {
    var name: String
    
    func makeEntity() -> Entity? {
        guard let entity = try? Entity.load(named: name, in: realityKitContentBundle) else {
            return nil
        }
        
        entity.availableAnimations.forEach { animation in
            entity.playAnimation(animation.repeat(), transitionDuration: 0.5)
        }
        
        return entity
    }

}
