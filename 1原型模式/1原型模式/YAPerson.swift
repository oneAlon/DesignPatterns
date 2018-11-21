//
//  YAPerson.swift
//  1原型模式
//
//  Created by xygj on 2018/11/12.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

class YAPerson: NSObject , YAPersonProtocol {
    
    var name: String = ""
    var readOnlyProperty: String {
        return "这是只读属性"
    }
    
    // 初始化: 准备实例的过程, 这个过程里为每一个存储属性设置初始值并在新实例使用之前执行任何其他所必须的配置.
    init(withName name: String){
        self.name = name
    }
    
    convenience init(withName name: String, testParam: String){
        self.init(withName: name)
    }
    
    func personProtocolInstanceMethod() {
        print("实例方法")
    }
    
    static func personProtocolClassMethod() {
        print("类方法")
    }

}

extension YAPerson: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return YAPerson(withName: self.name)
    }
    
}
