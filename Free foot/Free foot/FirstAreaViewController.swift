//
//  FirstAreaViewController.swift
//  Free foot
//
//  Created by 任五岳 on 2019/5/30.
//  Copyright © 2019 任五岳. All rights reserved.
//

import UIKit

class FirstAreaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstAreaPage = UIImageView()
        firstAreaPage.image = #imageLiteral(resourceName: "Pic2")
        self.view.addSubview(firstAreaPage)

        // Do any additional setup after loading the view.
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
