//
//  Helper.swift
//  SpeakUp
//
//  Created by Lonard Steven on 21/05/24.
//

import Foundation
import AVFoundation

class Helper {
    static let sharedHelper = Helper()
    private var audioPlayer: AVAudioPlayer!
    private var sfxPlayer: AVAudioPlayer!
    
    func playBackgroundAudio() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "tense-dark-background-199278", ofType: "mp3")!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
            audioPlayer?.setVolume(0.8, fadeDuration: 5)
            audioPlayer?.play()
        } catch {
            print("The audio file couldn't be played.")
        }
    }
    
    func playSecondBackgroundAudio() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "atmospheric-soundscape-152493", ofType: "mp3")!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.setVolume(0.8, fadeDuration: 5)
            audioPlayer?.play()
        } catch {
            print("The audio file couldn't be played.")
        }
    }
    
    func playClickSfx() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "mouse-click-153941", ofType: "mp3")!)
        
        do {
            sfxPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            sfxPlayer?.setVolume(0.6, fadeDuration: 2)
            sfxPlayer?.play()
        } catch {
            print("The audio file couldn't be played.")
        }
    }
}
