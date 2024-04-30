//
//  ImmersiveView.swift
//  nano1
//
//  Created by Joshua Wenata Sunarto on 23/04/24.
//

import SwiftUI
import RealityKit
import AVFoundation

struct ImmersiveView: View {
    var skyboxAssets: String
    var bgMusic: String
    var object: Entity
    @State var player: AVAudioPlayer?
    var sceneShowing: String

    var body: some View {
        RealityView { content in
            playMusic()
            let skybox = createSkybox()
            content.add(skybox!)
            content.add(object)
            
            guard let resource = try? await EnvironmentResource(named: "Sunlight") else { return }
            var iblComponent = ImageBasedLightComponent(
                source: .single(resource),
                intensityExponent: 17)

            iblComponent.inheritsRotation = true

            object.components.set(iblComponent)
            object.components.set(ImageBasedLightReceiverComponent(imageBasedLight: object))
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
    
    private func playAudio(_ audioName: String) {
        guard let url = Bundle.main.url(forResource: audioName, withExtension: "mp3") else {
            print("Failed to find audio file")
            return
        }
        
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch {
            print("Failed to play audio: \(error)")
        }
    }
    
    private func playMusic() {
        guard let url = Bundle.main.url(forResource: bgMusic, withExtension: "mp3") else {
            print("Failed to find music file")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            //            player?.delegate = self
            player?.play()
        } catch {
            print("Failed to play music: \(error)")
        }
    }
}

//extension ImmersiveView: AVAudioPlayerDelegate {
//    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
//        if flag {
//            // If music playback finishes, replay the music
//            player.play()
//        }
//    }
//}
