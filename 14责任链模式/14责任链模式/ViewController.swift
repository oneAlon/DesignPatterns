//
//  ViewController.swift
//  14责任链模式
//
//  Created by xygj on 2018/11/21.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     请求的链式处理-责任链模式
     
     */

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

