//
//  AudioPlayViewController.swift
//  Free foot
//
//  Created by 任五岳 on 2019/6/15.
//  Copyright © 2019 任五岳. All rights reserved.
//

import UIKit



class AudioPlayViewController: UIViewController {
    
    func audioPlay(){
        let audioPlayButton = UIImageView()
        audioPlayButton.frame = CGRect(x: 150, y: 250, width: 100, height: 100)
        audioPlayButton.image = #imageLiteral(resourceName: "Button1")
        self.view.addSubview(audioPlayButton)
    }


}
