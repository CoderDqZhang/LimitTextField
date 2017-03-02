//
//  ViewController.swift
//  LimitTextField
//
//  Created by Zhang on 2017/3/2.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let textField = UITextField.init(frame: CGRect.init(x: 100, y: 100, width: 300, height: 40))
        textField.maxTextLength = 3
        textField.restrictType = LXDRestrictType.onlyNumber
//        let text = ZDQTextRestrict()
//        text.restrictType = .OnlyNumber
//        textField.textRestrict = text
        textField.backgroundColor = UIColor.red
        self.view.addSubview(textField)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

