//
//  IntroductionViewController.swift
//  Free foot
//
//  Created by 任五岳 on 2019/5/23.
//  Copyright © 2019 任五岳. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
let screenSize = CGSize(width: screenWidth, height: screenHeight)

class IntroductionViewController: UIViewController,UIScrollViewDelegate {
    
    var pageCtrl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let scrollView = UIScrollView(frame: CGRect(x: 0,y: 20, width: screenWidth, height: screenHeight))
        scrollView.contentSize = CGSize(width: screenHeight * 3, height: screenHeight)
        scrollView.bounces = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self
        //scrollView.alwaysBounceVertical = true
        //scrollView.alwaysBounceHorizontal = false
        scrollView.isPagingEnabled = true

        
        self.view.addSubview(scrollView)
        let imageView1 = UIImageView(frame: CGRect(origin: CGPoint(x: 0,y: 0), size: screenSize))
        imageView1.image = #imageLiteral(resourceName: "Pic3")
        imageView1.clipsToBounds = true
        imageView1.contentMode = UIViewContentMode.scaleToFill
        scrollView.addSubview(imageView1)
        
        let imageView2 = UIImageView(frame: CGRect(origin: CGPoint(x: screenWidth,y: 0), size: screenSize))
        imageView2.image = #imageLiteral(resourceName: "Pic4")
        imageView2.clipsToBounds = true
        imageView2.contentMode = UIViewContentMode.scaleToFill
        scrollView.addSubview(imageView2)
        
        let imageView3 = UIImageView(frame: CGRect(origin: CGPoint(x: screenWidth*2,y: 0), size: screenSize))
        imageView3.image = #imageLiteral(resourceName: "PIc1")
        imageView3.clipsToBounds = true
        imageView3.contentMode = UIViewContentMode.scaleToFill
        scrollView.addSubview(imageView3)
        
        scrollView.contentSize = CGSize(width: screenWidth * 3, height: 0)
        
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
//        layout.itemSize = view.bounds.size
//        layout.scrollDirection = .horizontal
        
        //分页指示器小红点
        pageCtrl = UIPageControl(frame: CGRect(x: 0,y: screenHeight-30, width: screenWidth, height:  30))
        pageCtrl.numberOfPages = 3
        pageCtrl.currentPageIndicatorTintColor = UIColor.orange
        pageCtrl.pageIndicatorTintColor = UIColor.lightGray
        pageCtrl.currentPage = 0
        self.view.addSubview(pageCtrl)
        self.view.bringSubview(toFront: pageCtrl)
        
        //跳出使用说明skipbutton
        let skipbutton = UIButton(type: .system)
        skipbutton.frame = CGRect(x: screenWidth - 100, y: screenHeight - 100, width: 80, height: 80)
        skipbutton.backgroundColor = UIColor.clear
        skipbutton.setTitle("skip", for:  .normal)
        skipbutton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        skipbutton.addTarget(self, action: #selector(clickSkipbutton), for: .touchUpInside)
        self.view.addSubview(skipbutton)
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        

        let xoffset = scrollView.contentOffset.x
        if xoffset < 0.5 * screenWidth{
            pageCtrl.currentPage = 0
        }else if xoffset > 0.5 * screenWidth && xoffset < 1.5 * screenWidth{
            pageCtrl.currentPage = 1
        }else if xoffset > 1.5 * screenWidth && xoffset < 2.5 * screenWidth{
            pageCtrl.currentPage = 2
        }
    }
    
    
    @objc func clickSkipbutton(){
        let mapViewController = MapViewController()
        self.navigationController?.pushViewController(mapViewController, animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationController?.navigationBar.isHidden = true
    }
    
    

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
