//
//  SoundSettingUtils.swift
//  nano1
//
//  Created by Luthfi Misbachul Munir on 02/05/24.
//

import Foundation
import AVFoundation

var players: [AVAudioPlayer] = []

func funcPlayAudio(ambientSound: String) {
    print("Playing sound of ", ambientSound)
    guard let url = Bundle.main.url(forResource: ambientSound, withExtension: "mp3") else {
        print("Failed to find sound file")
        return
    }

    do {
        let player = try AVAudioPlayer(contentsOf: url)
        player.play()
        players.append(player)
    } catch {
        print("Failed to play music: \(error)")
    }
}

func stopAllPlayers() {
    for player in players {
        player.stop()
    }
}
