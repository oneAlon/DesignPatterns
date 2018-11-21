//
//  ViewController.swift
//  4抽象工厂模式
//
//  Created by xygj on 2018/11/14.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    /*
     需求:
        1. 创建多种皮肤
        2. button textField label
        3. spring风格 summer风格
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建一个产品族
        let springButton = YASkinSpringFactory.createButton()
        let springTextFiled = YASkinSpringFactory.createTextFiled()
        let springLabel = YASkinSpringFactory.createLabel()
        
        print("\(springButton) + \(springTextFiled) + \(springLabel)")
        
    }


}

