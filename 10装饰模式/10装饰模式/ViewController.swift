//
//  ViewController.swift
//  10装饰模式
//
//  Created by xygj on 2018/11/20.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit
/*
 扩展系统功能-装饰模式
 
 需求:
    Sunny软件公司基于面向对象技术开发了一套图形界面构件库VisualComponent，该构件库提供了大量基本构件，如窗体、文本框、列表框等
    由于在使用该构件库时，用户经常要求定制一些特效显示效果，如带滚动条的窗体、带黑色边框的文本框、既带滚动条又带黑色边框的列表框等等，
    因此经常需要对该构件库进行扩展以增强其功能
    如何提高图形界面构件库性的可扩展性并降低其维护成本是Sunny公司开发人员必须面对的一个问题。
 
 装饰模式:
    用于替代继承的技术, 无需定义子类就可以给原来的类增加新的功能, 使用对象关联关系替代继承.
 
 桥接模式和装饰模式的区别?
    桥接模式: 两个不同变化的维度
    装饰模式: 装饰器要继承抽象组件
 
 
 优点:
 
 缺点:
    1. 类的数目多
 
 
 使用场景:
    1. 在不影响其他对象的情况下, 以动态透明的方式给某个对象添加职责
    2. 当不能使用继承的方式为对象扩展功能时, 可以使用装饰器模式.
 
 不能被继承的的情况:
    1. 继承以后产生大量的子类
    2. 类为final
 
 装饰模式和继承最大的区别:
    继承, 子类可以修改父类的行为.
 
 在iOS中如何使用装饰模式?
    OC中是category
    swift中是extension
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ScrollBarDecorator(component: Window()).display()
        
    }
}





