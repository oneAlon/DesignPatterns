//
//  ViewController.swift
//  14责任链模式
//
//  Created by xygj on 2018/11/21.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

/*
 请求的链式处理-责任链模式
 
 需求:
    Sunny软件公司承接了某企业SCM(Supply Chain Management，供应链管理)系统的开发任务，其中包含一个采购审批子系统。
    该企业的采购审批是分级进行的，即根据采购金额的不同由不同层次的主管人员来审批，主任可以审批5万元以下（不包括5万元）的采购单，副董事长可以审批5万元至10万元（不包括10万元）的采购单，董事长可以审批10万元至50万元（不包括50万元）的采购单，50万元及以上的采购单就需要开董事会讨论决定
 
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 调用顺序: A->C->B
        
        // 配置责任链(由客户端配置责任链)
        let handlerB = HandlerB()
        let handlerC = HandlerC(nextHandler: handlerB)
        let handlerA = HandlerA(nextHandler: handlerC)
        
        
        handlerA.handleRequest()
    }

}

protocol Handler {
    var nextHandler: Handler? { get set }
    
    init(nextHandler: Handler?)
    
    func handleRequest()
}

class HandlerA: Handler {
    var nextHandler: Handler?
    
    required init(nextHandler: Handler?) {
        self.nextHandler = nextHandler
    }
    
    func handleRequest() {
        guard let nextHandler = nextHandler else {
            // 如果没有配置下一个责任链, 就是自己处理罗
            print("A 处理事件")
            return
        }
        // 转发请求
        nextHandler.handleRequest()
    }
    
}

class HandlerB: Handler {
    var nextHandler: Handler?
    
    required init(nextHandler: Handler?) {
        self.nextHandler = nextHandler
    }
    
    init(){
        self.nextHandler = nil
    }
    
    func handleRequest() {
        guard let nextHandler = nextHandler else {
            print("B 处理事件")
            return
        }
        nextHandler.handleRequest()
    }
    
}

class HandlerC: Handler {
    var nextHandler: Handler?
    
    required init(nextHandler: Handler?) {
        self.nextHandler = nextHandler
    }
    
    func handleRequest() {
        guard let nextHandler = nextHandler else {
            print("C 处理事件")
            return
        }
        nextHandler.handleRequest()
    }
    
}

