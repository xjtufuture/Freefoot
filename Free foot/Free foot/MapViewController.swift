//
//  MapViewController.swift
//  Free foot
//
//  Created by 任五岳 on 2019/5/23.
//  Copyright © 2019 任五岳. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapPage = UIImageView()
        mapPage.frame = self.view.bounds
        mapPage.image = #imageLiteral(resourceName: "Pic2")
        self.view.addSubview(mapPage)
        
        
        
        let guiLinParkButton = UIButton(type: .system)
        guiLinParkButton.frame = CGRect(x: 170, y: 300, width: 50, height: 50)
        guiLinParkButton.setBackgroundImage(#imageLiteral(resourceName: "Button1"), for: .normal)
//        guiLinParkButton.setImage(#imageLiteral(resourceName: "Button1"), for: .normal)
//        guiLinParkButton.setTitle("桂林公园", for: .normal)
//        guiLinParkButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        guiLinParkButton.addTarget(self, action: #selector(clickParkButton), for: .touchUpInside)
        self.view.addSubview(guiLinParkButton)
        
        
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @objc func clickParkButton(){
        let areaViewController = GuiLinParkViewController()
        self.navigationController?.pushViewController(areaViewController, animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
    }
    
    func pinchGestureRecognizer() {
        let pinch = UIPinchGestureRecognizer()
        pinch.delegate = self
        pinch.addTarget(self, action: #selector(pinchAction))
    }
    
    
    @objc func pinchAction(){

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
