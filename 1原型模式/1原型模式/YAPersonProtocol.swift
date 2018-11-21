//
//  YAPersonProtocol.swift
//  1原型模式
//
//  Created by xygj on 2018/11/12.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

protocol YAPersonProtocol {
    
    // MARK: - 属性
    // 协议的属性: 协议要求一个属性必须明确指定是可读的或者可写的
    var name: String { get set }
    var readOnlyProperty: String { get }
    
    // MARK: - 方法
    func personProtocolInstanceMethod()
    static func personProtocolClassMethod()
    
}
