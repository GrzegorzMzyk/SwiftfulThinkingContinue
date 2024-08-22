//
//  SoundBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 22/08/2024.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager() // singleton
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
    case tada
    case badum
    }
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("error playing \(error)")
        }
    }
}
struct SoundBootcamp: View {
    
    var body: some View {
        VStack(spacing:20) {
            Button("play sound 1") {
                SoundManager.instance.playSound(sound: .tada)
            }
            Button("play sound 2") {
                SoundManager.instance.playSound(sound: .badum)
            }
        }
    }
}

#Preview {
    SoundBootcamp()
}
