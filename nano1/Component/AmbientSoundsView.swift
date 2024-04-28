//
//  AmbientSoundsView.swift
//  nano1
//
//  Created by Michelle Chau on 28/04/24.
//

import SwiftUI
import AVFAudio

let myScene = Scenes.winterForest

struct AmbientSoundViewModel: View {
    
    var body: some View {
        
        ambientSoundsView(
            icon1: "tree",
            icon2: "bird",
            icon3: "water.waves",
            sound1: "beach",
            sound2: "magic_night",
            sound3: "winter_forest")
        
    }
}

#Preview {
    AmbientSoundViewModel()
}


struct ambientSoundsView: View {
    
    @State var player: AVAudioPlayer?
    
    var icon1, icon2, icon3: String
    var sound1, sound2, sound3: String
    
    var body: some View {
        HStack {
            Button(action: {
                //insert sounds here
                playAmbientSound(ambientSound: sound1)
                
            }, label: {
                Image(systemName: icon1)
            })
            
            Button(action: {
                //insert sounds here
                playAmbientSound(ambientSound: sound2)
            }, label: {
                Image(systemName: icon2)
            })
            
            Button(action: {
                //insert sounds here
                playAmbientSound(ambientSound: sound3)
            }, label: {
                Image(systemName: icon3)
            })
        }
    }
    
    //audioplayer
    func playAmbientSound(ambientSound: String) {

        print("Playing sound...")
        guard let url = Bundle.main.url(forResource: ambientSound, withExtension: "mp3") else {
            print("Failed to find sound file")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Failed to play music: \(error)")
        }
    }
}




