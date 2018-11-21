//
//  YAImageAbstraction.swift
//  8桥接模式
//
//  Created by xygj on 2018/11/16.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

// 抽象类
protocol YAImageAbstraction {
    
    var operationSystem: YAOperationSystem { get set }
    
    init(operationSystem: YAOperationSystem)
    
    func displayOnSystem()
}

// 提供协议的默认实现
extension YAImageAbstraction {
    
    func displayOnSystem() {
        
    }
}

class YABmpImage: YAImageAbstraction {
    
    var operationSystem: YAOperationSystem
    
    required init(operationSystem: YAOperationSystem) {
        self.operationSystem = operationSystem
    }
    
    func displayOnSystem() {
        print("bmpImage")
        self.operationSystem.operationSystemDisply()
    }
}

class YAJpgImage: YAImageAbstraction {
    
    var operationSystem: YAOperationSystem
    
    required init(operationSystem: YAOperationSystem) {
        self.operationSystem = operationSystem
    }
    
    func displayOnSystem() {
        print("jgpImage")
        self.operationSystem.operationSystemDisply()
    }
}

class YAPngImage: YAImageAbstraction {
    
    var operationSystem: YAOperationSystem
    
    required init(operationSystem: YAOperationSystem) {
        self.operationSystem = operationSystem
    }
    
    func displayOnSystem() {
        print("pngImage")
        self.operationSystem.operationSystemDisply()
    }
}

class YAGifImage: YAImageAbstraction {
    
    var operationSystem: YAOperationSystem
    
    required init(operationSystem: YAOperationSystem) {
        self.operationSystem = operationSystem
    }
    
    func displayOnSystem() {
        print("gifImage")
        self.operationSystem.operationSystemDisply()
    }
}
