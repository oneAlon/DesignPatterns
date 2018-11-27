//
//  ViewController.swift
//  4抽象工厂模式
//
//  Created by xygj on 2018/11/14.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

/*
 在工厂方法模式中一个具体工厂只生产一种具体产品, 但是有时候我们需要一个工厂能够生产多个具体产品对象, 而不是一个单一的具体对象
 这就引入了抽象工厂模式
 
 需求:
    1. 创建多种皮肤
    2. button textField label
    3. spring风格 summer风格
 
 在抽象工厂模式中需要引入两个新概念: 产品等级结构和产品族
 产品等级结构: 就是产品的继承结构, 比如button会有springButton summerButton
 产品族: 在抽象工厂模式中, 一个产品族就是有一个具体工厂创建的, 比如springButton springTextField springLabel
 
 优点:
 
 
 缺点:
    1. 在增加新的产品时, 比如增加Image, 必须修改抽象工厂, 具体的工厂方法也需要做修改
    2. 开闭原则的倾斜性, 增加新的产品等级简单(比如新增加一种皮肤, 只需要实现具体的工厂, 增加具体的产品, 不需要修改抽象工厂), 增加新的产品时比较麻烦(同1)
 
 使用场景:
    系统中存在产品族
 
 三种工厂模式之间的转换:
    当抽象工厂模式中每一个具体工厂类只创建一个产品对象，也就是只存在一个产品等级结构时，抽象工厂模式退化成工厂方法模式；
    当工厂方法模式中抽象工厂与具体工厂合并，提供一个统一的工厂来创建产品对象，并将创建对象的工厂方法设计为静态方法时，工厂方法模式退化成简单工厂模式。
 
 */

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建一个产品族
        let springButton = YASkinSpringFactory.createButton()
        let springTextFiled = YASkinSpringFactory.createTextFiled()
        let springLabel = YASkinSpringFactory.createLabel()
        
        print("\(springButton) + \(springTextFiled) + \(springLabel)")
        
    }


}

