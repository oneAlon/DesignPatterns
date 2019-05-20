//
//  ViewController.swift
//  5单例模式
//
//  Created by xygj on 2018/11/14.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

/* 
 单例优点:
    提供对唯一实例的访问, 资源共享
 
 缺点:
    单例没有抽象层, 扩展困难
    单例职责过重, 违反单一职责原则
    单例的滥用会带来一些负面问题, 资源问题
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let signleton1 = YASignleton.default
        let signleton2 = YASignleton.default
        let signleton3 = YASignleton.default
        let signleton4 = YASignleton.init()
        
        print(signleton1, signleton2, signleton3, signleton4)
        
    }

}

