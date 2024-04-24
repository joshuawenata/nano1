//
//  ImmersiveView.swift
//  nano1
//
//  Created by Joshua Wenata Sunarto on 23/04/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var skyboxAssets : String
    
    var body: some View {
        RealityView { content in
            let skybox = createSkybox()
            content.add(skybox!)
        }
    }
    
    private func createSkybox() -> Entity? {
            let largeSphere = MeshResource.generateSphere(radius: 2)
            var skyboxMaterial = UnlitMaterial()
            
            do {
                let texture = try TextureResource.load(named: skyboxAssets)
                skyboxMaterial.color = .init(texture: .init(texture))
            } catch {
                print("Failed to create skybox material: \(error)")
                return nil
            }
            
            let skyboxEntity = Entity()
            skyboxEntity.components.set(ModelComponent(mesh: largeSphere, materials: [skyboxMaterial]))
            
            skyboxEntity.scale = .init(x: -1, y: 1, z: 1)
            return skyboxEntity
        }
}
