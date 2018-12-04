//
//  ViewController.swift
//  13代理模式
//
//  Created by xygj on 2018/11/20.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

/*
 简介:
 代理模式是常用的结构型设计模式之一，当无法直接访问某个对象或访问某个对象存在困难时可以通过一个代理对象来间接访问，
 为了保证客户端使用的透明性，所访问的真实对象与代理对象需要实现相同的接口。根据代理模式的使用目的不同，
 代理模式又可以分为多种类型，例如保护代理、远程代理、虚拟代理、缓冲代理等，它们应用于不同的场合，满足用户的不同需求。
 
 客户端不想或者不能直接访问摸一个对象, 使用代理实现第三方访问, 称为代理模式(iOS中的代理模式, delegate)
 
 需求:
     某软件公司承接了某信息咨询公司的收费商务信息查询系统的开发任务，该系统的基本需求如下：
     (1) 在进行商务信息查询之前用户需要通过身份验证，只有合法用户才能够使用该查询系统；
     (2) 在进行商务信息查询时系统需要记录查询日志，以便根据查询次数收取查询费用。
     该软件公司开发人员已完成了商务信息查询模块的开发任务，现希望能够以一种松耦合的方式向原有系统增加身份验证和日志记录功能，客户端代码可以无区别地对待原始的商务信息查询模块和增加新功能之后的商务信息查询模块，而且可能在将来还要在该信息查询模块中增加一些新的功能。
 
 优点:
 1. 协调调用者和被调用者, 降低系统之间的耦合
 2. 客户端针对抽象层(协议)编码, 更换代理不需要修改源码, 符合开闭原则, 具有良好的灵活性和扩展性
 
 缺点:
 1. 实现代理模式需要额外的工作
 
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let result = RealSearch(delegate: ProxySearch()).doSearch(userID: "OneAlon", password: "123456")
        print(result)
    }

}

// 定义抽象类, 协议
protocol Search {
    func doSearch(userID: String, password: String) -> String
}

class RealSearch: Search {
    
    let delegate: Search
    
    init(delegate: Search) {
        self.delegate = delegate
    }
    
    // 身份验证
    func validate() -> Bool {
        print("验证身份信息")
        return true
    }
    
    func doSearch(userID: String, password: String) -> String {
        validate()
        let result = delegate.doSearch(userID: userID, password: password)
        log()
        return result
    }
    
    // 日志记录
    func log() {
        
    }
}

class ProxySearch: Search {
    func doSearch(userID: String, password: String) -> String {
        return "查询结果"
    }
}





