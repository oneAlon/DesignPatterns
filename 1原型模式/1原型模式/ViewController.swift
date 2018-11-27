//
//  ViewController.swift
//  1原型模式
//
//  Created by OneAlon on 2018/11/12.
//  Copyright © 2018 OneAlon. All rights reserved.
//

import UIKit

/*
 目的:
    通过一个原型对象克隆出多个一模一样的对象.
 
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建实例原型
        let person1 = YAPerson(withName: "机器人")
        
        // 使用实例原型创建对象
        guard let person2 = person1.copy() as? YAPerson else { return }
        guard let person3 = person1.copy() as? YAPerson else { return }
        
        print(person1, person2, person2)
        print("person1的名字\(person1.name)\n" + "person2的名字\(person2.name)\n" + "person3的名字\(person3.name)\n")
        
        person1.personProtocolInstanceMethod()
        person2.personProtocolInstanceMethod()
        person3.personProtocolInstanceMethod()
    }


}

