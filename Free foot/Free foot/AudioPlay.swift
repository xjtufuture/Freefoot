//
//  audioPlay.swift
//  Free foot
//
//  Created by 任五岳 on 2019/6/13.
//  Copyright © 2019 任五岳. All rights reserved.
//

import UIKit
import AVFoundation



class Localmusic: UIViewController {

    var player:AVAudioPlayer?







    func playMusic() {
        var audioPlayer = AVAudioPlayer()

        let path = Bundle.main.path(forResource: "bgm", ofType: "mp3")
        let soundUrl = URL(fileURLWithPath: path!)

        do{

            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)


            try audioPlayer = AVAudioPlayer(contentsOf: soundUrl)

            audioPlayer.volume = 1.0
            //-1 = infinite Loop
            audioPlayer.numberOfLoops = 1
            audioPlayer.play()



        }catch{
            print(error)
        }
    }

    func stopMusic() {
        var audioPlayer = AVAudioPlayer()

        let path = Bundle.main.path(forResource: "bgm", ofType: "mp3")
        let soundUrl = URL(fileURLWithPath: path!)

        do{

            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)


            try audioPlayer = AVAudioPlayer(contentsOf: soundUrl)

            audioPlayer.stop()
        }catch{
            print(error)
        }
    }


}
