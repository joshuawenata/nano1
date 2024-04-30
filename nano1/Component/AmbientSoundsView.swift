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

struct ambientSoundsView: View {
    
    @State var player1: AVAudioPlayer?
    @State var player2: AVAudioPlayer?
    @State var player3: AVAudioPlayer?
    
    @State private var isPlaying1 = false
    @State private var isPlaying2 = false
    @State private var isPlaying3 = false
    
    @State private var backgroundColor1 = Color.gray
    @State private var backgroundColor2 = Color.gray
    @State private var backgroundColor3 = Color.gray
    
    var icon1, icon2, icon3: String
    var sound1, sound2, sound3: String
    
    var body: some View {
        HStack {
            Button(action: {
                toggleAudio(audioNumber: 1)
            }, label: {
                Image(systemName: icon1)
                    .font(.system(size: 30))
            })
            .colorMultiply(backgroundColor1)
            
            Button(action: {
                toggleAudio(audioNumber: 2)
            }, label: {
                Image(systemName: icon2)
                    .font(.system(size: 30))
            })
            .colorMultiply(backgroundColor2)
            
            Button(action: {
                toggleAudio(audioNumber: 3)
            }, label: {
                Image(systemName: icon3)
                    .font(.system(size: 30))
            })
            .colorMultiply(backgroundColor3)
        }
        .onAppear {
            loadAudio()
        }
    }
    
    func loadAudio() {
        guard let url1 = Bundle.main.url(forResource: sound1, withExtension: "mp3"),
              let url2 = Bundle.main.url(forResource: sound2, withExtension: "mp3"),
              let url3 = Bundle.main.url(forResource: sound3, withExtension: "mp3") else {
            print("Failed to find sound files")
            return
        }
        
        do {
            player1 = try AVAudioPlayer(contentsOf: url1)
            player2 = try AVAudioPlayer(contentsOf: url2)
            player3 = try AVAudioPlayer(contentsOf: url3)
        } catch {
            print("Failed to load audio: \(error)")
        }
    }
    
    func toggleAudio(audioNumber: Int) {
        switch audioNumber {
        case 1:
            if isPlaying1 {
                player1?.stop()
                backgroundColor1 = Color.gray
            } else {
                player1?.play()
                backgroundColor1 = Color.white
            }
            isPlaying1.toggle()
        case 2:
            if isPlaying2 {
                player2?.stop()
                backgroundColor2 = Color.gray
            } else {
                player2?.play()
                backgroundColor2 = Color.white
            }
            isPlaying2.toggle()
        case 3:
            if isPlaying3 {
                player3?.stop()
                backgroundColor3 = Color.gray
            } else {
                player3?.play()
                backgroundColor3 = Color.white
            }
            isPlaying3.toggle()
        default:
            break
        }
    }
}
