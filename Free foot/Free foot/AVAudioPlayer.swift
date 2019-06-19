//
//  AVAudioPlayer.swift
//  Free foot
//
//  Created by 任五岳 on 2019/6/15.
//  Copyright © 2019 任五岳. All rights reserved.
//

import UIKit
import AVFoundation


class audioPlayer: UIViewController {

    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()



        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "bgm", ofType: "mp3")!)


        player = try? AVAudioPlayer(contentsOf: url)

        if player!.prepareToPlay(){
            player?.play()
        }

        // Do any additional setup after loading the view.
    }
    
    func play() {
        if player!.isPlaying{
            return
        }
        player?.play()
    }
    
    func pause() {
        if player == nil{
            player?.pause()
        }
        if player!.isPlaying {
           player?.pause()
        }
        
//           player?.prepareToPlay()
    
    }
    
    func volumeup(){
        player?.volume += 0.2
    }
    
    func volumedown(){
        player?.volume -= 0.2
    }
    
//    func bgmlist(){
//        var bgmUrl = 0
//
//        switch bgmUrl {
//        case 1:  URL(fileURLWithPath: Bundle.main.path(forResource: "bgm", ofType: "mp3")!)
//        case 2:  URL(fileURLWithPath: Bundle.main.path(forResource: "bgm2", ofType: "mp3")!)
//        default:
//            return
//        }
//
//    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
