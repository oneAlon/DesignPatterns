//
//  YANewFile.swift
//  9组合模式
//
//  Created by xygj on 2018/11/19.
//  Copyright © 2018 xygj. All rights reserved.
//

import Foundation

protocol Component {
    
    var name: String{ get set }
    
    
    func add(_ component: Component)
    func getChild(i: Int) -> Component?
    func killVirus()
    
}

extension Component {
    func add(_ component: Component) {
        print("不支持此方法")
    }
    func getChild(i: Int) -> Component? {
        print("不支持此方法")
        return nil
    }
    func killVirus() {
        
    }
}

// 叶子
class Leaf: Component {
    
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func killVirus() {
        print("对\(name)杀毒了哦")
    }
}

// 容器
class Composite: Component {
    
    var componentList: [Component] = [Component]()
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func add(_ component: Component) {
        componentList.append(component)
    }
    func getChild(i: Int) -> Component? {
        return componentList[i]
    }
    func killVirus() {
        print("对\(name)文件夹杀毒")
        for component in componentList {
            component.killVirus()
        }
    }
}
