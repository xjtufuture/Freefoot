//
//  ViewController.swift
//  Free foot
//
//  Created by 任五岳 on 2019/5/21.
//  Copyright © 2019 任五岳. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let page1 = UIImageView()
        page1.frame = self.view.bounds
        page1.image = #imageLiteral(resourceName: "Pic2")
        self.navigationController!.setToolbarHidden(true, animated: false)
        self.view.addSubview(page1)
        
        
        //初始页面标签
        let startlabel = UILabel(frame: CGRect(x: screenWidth/2 - 140,y: 150, width: 280, height: 30))
        startlabel.text = "跟着耳朵去旅行"
        startlabel.backgroundColor = UIColor.clear
        startlabel.font = UIFont.systemFont(ofSize: 30)
        startlabel.textAlignment = .center
        self.view.addSubview(startlabel)
        
        //初始页面logbutton
        let logobutton = UIButton(type: .system)
        logobutton.frame = CGRect(x: screenWidth/2 - 50, y: screenHeight - 150, width: 100, height: 100)
        logobutton.setBackgroundImage(#imageLiteral(resourceName: "Button1"), for: .normal)
//        logobutton.setTitle("start", for:  .normal)
        logobutton.addTarget(self, action: #selector(clicklogo), for: .touchUpInside)
        self.view.addSubview(logobutton)
        
        self.navigationController?.navigationBar.isHidden = true

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func clicklogo(){
        let languageselectView = SecondViewController()
        self.navigationController?.pushViewController(languageselectView, animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationController?.navigationBar.isHidden = true
    }

}

