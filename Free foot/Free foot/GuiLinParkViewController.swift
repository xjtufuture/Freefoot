//
//  GuiLinParkViewController.swift
//  Free foot
//
//  Created by 任五岳 on 2019/5/24.
//  Copyright © 2019 任五岳. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

var imageZoomView = ImageZoomView()

let audioplay = audioPlayer()

var playOrPauseCount = 0






class GuiLinParkViewController: UIViewController,UIGestureRecognizerDelegate{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let parkPage = UIImageView()
        parkPage.frame = self.view.bounds
        parkPage.image = #imageLiteral(resourceName: "Map1")
        self.view.addSubview(parkPage)
        

        
        
        let firstAreaButton = UIButton()
        firstAreaButton.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        firstAreaButton.setImage(#imageLiteral(resourceName: "Button1"), for: .normal)
        self.view.insertSubview(firstAreaButton, at: 2)
        firstAreaButton.addTarget(self, action: #selector(clickFirstAreaButton), for: .touchUpInside)
        
        let secondAreaButton = UIButton()
        secondAreaButton.frame = CGRect(x: 200, y: 200, width: 50, height: 50)
        secondAreaButton.setImage(#imageLiteral(resourceName: "Button1"), for: .normal)
        self.view.insertSubview(secondAreaButton, at: 2)
        secondAreaButton.addTarget(self, action: #selector(clickSecondAreaButton), for: .touchUpInside)

        
        let swiperight = UISwipeGestureRecognizer()
        swiperight.addTarget(self, action: #selector(hswipe(recognizer:)))
        swiperight.direction = .right
        view.addGestureRecognizer(swiperight)
        
        
        
        
//        openSwipe()

        // Do any additional setup after loading the view.
    }
    
    
    func playButton(){
        
        
//        self.removeFromParentViewController()
        
        let playButtonView = UIButton(type: .custom)
        playButtonView.setBackgroundImage(#imageLiteral(resourceName: "Button1"), for: .normal)
        playButtonView.setBackgroundImage(#imageLiteral(resourceName: "Button2"), for: .selected)
        playButtonView.frame = CGRect(x: screenWidth + screenWidth - 150, y: screenHeight - 150, width: 100, height: 100)

        
//        switch playButtonView.currentImage {
//        case #imageLiteral(resourceName: "Button2"):
//            playButtonView.setImage(#imageLiteral(resourceName: "Button1"), for: .normal)
//        case #imageLiteral(resourceName: "Button1"):
//            playButtonView.setImage(#imageLiteral(resourceName: "Button2"), for: .normal)
//        default:
//            playButtonView.setImage(#imageLiteral(resourceName: "Button1"), for: .normal)
//        }
        


        
        UIView.animate(withDuration: 0.5){
            playButtonView.frame = CGRect(x: screenWidth - 150, y: screenHeight - 150, width: 100, height: 100)
        }
        playButtonView.addTarget(self, action: #selector(playOrPause), for: .touchDown)
        self.view.addSubview(playButtonView)
//        self.view.insertSubview(playButtonView, at: 4)
        

    }
    
    @objc func playOrPause(){
        
        
        playOrPauseCount += 1
        
        if playOrPauseCount == 1{
            audioplay.viewDidLoad()
        }else if playOrPauseCount % 2 != 0{
            audioplay.play()
        }else{
            audioplay.pause()
            
        }
    }
    
//    Reflesh the UI
//    func updateUI(){
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
//        RunLoop.main.add(timer!, forMode: .commonModes)
//    }
    
    
    
    
    @objc func clickFirstAreaButton(){
        let firstAreaView = UIImageView()
        firstAreaView.frame = CGRect(x: screenWidth, y: 0, width: screenWidth - 60, height: screenHeight)
        firstAreaView.image = #imageLiteral(resourceName: "Pic3")
        firstAreaView.layer.cornerRadius = 15
        self.view.insertSubview(firstAreaView, at: 3)
        UIView.animate(withDuration: 0.5){
            firstAreaView.frame = CGRect(x: 30, y: 0, width: screenWidth - 30, height: screenHeight)
        }
        
        self.playButton()
        
//        audioplay.viewDidLoad()
        

        
        

        
    }
    
    @objc func clickSecondAreaButton(){
        let secondAreaView = UIImageView()
        secondAreaView.frame = CGRect(x: screenWidth, y: 0, width: screenWidth - 60, height: screenHeight)
        secondAreaView.image = #imageLiteral(resourceName: "Pic4")
        secondAreaView.layer.cornerRadius = 15
        self.view.insertSubview(secondAreaView, at: 3)
        UIView.animate(withDuration: 0.5){
            secondAreaView.frame = CGRect(x: 30, y: 0, width: screenWidth - 30, height: screenHeight)
        }
        
        self.playButton()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func pinchView(recognizer:UIPinchGestureRecognizer){
        
        
    }
    
    
    
    @objc func hswipe(recognizer:UISwipeGestureRecognizer) {
        
        if recognizer.direction == .right{
            let firstAreaViewController = GuiLinParkViewController()
            self.navigationController?.pushViewController(firstAreaViewController, animated: false)
            self.navigationController?.navigationBar.barTintColor = UIColor.clear
            
            if playOrPauseCount > 0{
                audioplay.pause()
            }
//            是否继续前段落音频
            playOrPauseCount = 0
        }
//        if recognizer.direction == .up{
//            audioplay.volumeup()
//        }
//        if recognizer.direction == .down{
//            audioplay.volumedown()
//        }
        
        
//        let point = recognizer.location(in: view)
        
//        self.navigationController?.pushViewController(mySecondViewController(), animated: true)
        
    }
    
    
    //获取系统音量滑块
    private func getSystemVolumSlider() -> UISlider {
        let systemVolumView = MPVolumeView()
        systemVolumView.frame.size = CGSize.init(width: 200, height: 4)
        systemVolumView.center = self.view.center
        var volumViewSlider = UISlider()
        for subView in systemVolumView.subviews {
            if type(of: subView).description() == "MPVolumeSlider" {
                volumViewSlider = subView as! UISlider
                return volumViewSlider
                }
            
        }
        return volumViewSlider
        }
    //获取系统音量大小
    private func getSystemVolumValue()  -> Float {
        return getSystemVolumSlider().value
        }
    
    //调节系统音量大小
    private func setSysVolumWith(_ value: Float) {
        self.getSystemVolumSlider().value = value
    }
 
    
    
    

    
    
    
    
    
    //支持前翻页
//    func openSwipe() {
//        if (self.navigationController != nil){
//            self.navigationController!.interactivePopGestureRecognizer!.delegate = self
//
//        }
//    }
//
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool{
//        if self.navigationController?.viewControllers.count == 1{
//            return false
//        }
//        return true
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
