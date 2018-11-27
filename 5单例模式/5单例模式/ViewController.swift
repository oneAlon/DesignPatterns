//
//  ViewController.swift
//  5单例模式
//
//  Created by xygj on 2018/11/14.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let signleton1 = YASignleton.default
        let signleton2 = YASignleton.default
        let signleton3 = YASignleton.default
        let signleton4 = YASignleton()
        
        print(signleton1, signleton2, signleton3, signleton4)
        
        
    }


}

