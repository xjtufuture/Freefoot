//
//  SecondViewController.swift
//  Free foot
//
//  Created by 任五岳 on 2019/5/22.
//  Copyright © 2019 任五岳. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    let languageChoice = LanguageChoice()
        

    var selectAccent = ""
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {

            return 2
    }

    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0){
            return languageChoice.countryArray.count
        }else {
            if languageChoice.accentlist[selectAccent] != nil{
                return languageChoice.accentlist[selectAccent]!.count
            }else{
                return 0
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0){
            return languageChoice.countryArray[row]
        }else{
            if (languageChoice.accentlist[selectAccent] != nil){
                return (languageChoice.accentlist[selectAccent]?[row])!
            }else{
                return ""
            }
        }
    }
    
    //默认选择picker的第一列
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0){
            selectAccent = languageChoice.countryArray[row]
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray
        
        
        //语言选择界面提示
        let startlabel = UILabel(frame: CGRect(x: 50,y: 150, width: 280, height: 30))
        startlabel.text = "请选择语言/Language"
        startlabel.backgroundColor = UIColor.red
        startlabel.font = UIFont.systemFont(ofSize: 20)
        startlabel.textAlignment = .center
        self.view.addSubview(startlabel)
        // Do any additional setup after loading the view.
        
        //语言选择器控件
        
        
        let languagePicker = UIPickerView(frame: CGRect(x: 20, y: 250, width: 280,height: 150))
        languagePicker.delegate = self
        languagePicker.dataSource = self
        self.pickerView(languagePicker, didSelectRow: 0, inComponent: 0)
        self.view.addSubview(languagePicker)
        
        //初始页面Languagebutton
        let languageConfirmButton = UIButton(type: .system)
        languageConfirmButton.frame = CGRect(x: screenWidth/2 - 25, y: screenHeight - 100, width: 50, height: 50)
        languageConfirmButton.backgroundColor = UIColor.black
        languageConfirmButton.setTitle("start", for:  .normal)
        languageConfirmButton.addTarget(self, action: #selector(clickLanguageConfirm), for: .touchUpInside)
        self.view.addSubview(languageConfirmButton)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func clickLanguageConfirm(){
        let introductionViewController = IntroductionViewController()
        self.navigationController?.pushViewController(introductionViewController, animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationController?.navigationBar.isHidden = true
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
