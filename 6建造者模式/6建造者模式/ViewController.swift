//
//  ViewController.swift
//  6建造者模式
//
//  Created by OneAlon on 2018/11/14.
//  Copyright © 2018 OneAlon. All rights reserved.
//

import UIKit

/*
 复杂对象的创建, 一步步构建一个包含多个组成部件的完整对象, 使用相同的构建过程构建不同的产品.
 
 
 
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let actor = YAActorController.construct(builder: YAHeroBuilder())
        print("游戏角色:\(actor.type)")
        print("性别:\(actor.sex)")
        
    }


}

