//
//  YAColleague.swift
//  18中介者模式
//
//  Created by xygj on 2018/11/23.
//  Copyright © 2018 xygj. All rights reserved.
//

import Foundation

// 抽象同事类
class YAPane: NSObject {
    
    // 维护一个中介者对象, 子类可以使用这个对象和中介者通信
    var window: YAWindow?
    
    func display() {
        window?.paneSelect(pane: self)
    }
    
}

class YATextPane: YAPane {
    // 每一个同事对象需要和另一个同事对象通信时, 先和终结者通信, 通过中介者调用其他同事对象.
    func setSelect() {
        print("选中textPane")
    }
    func setUnselect() {
        print("取消textPane")
    }
}

class YAListPane: YAPane {
    func setSelect() {
        print("选中textPane")
    }
    func setUnselect() {
        print("取消listPane")
    }
}

class YAGraphicPane: YAPane {
    func setSelect() {
        print("选中textPane")
    }
    func setUnselect() {
        print("取消graphicPane")
    }
}

class YAButtonPane: YAPane {
    func setSelect() {
        print("选中buttonPane")
    }
    func setUnselect() {
        print("取消buttonPane")
    }
}
