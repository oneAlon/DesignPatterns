//
//  YAOperationSystem.swift
//  8桥接模式
//
//  Created by xygj on 2018/11/16.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

// 实现类
protocol YAOperationSystem {
    func operationSystemDisply()
}

class YAWindowsSystem: YAOperationSystem {
    func operationSystemDisply() {
        print("在Windows操作系统上显示")
    }
}

class YALinuxSystem: YAOperationSystem {
    func operationSystemDisply() {
        print("在Linux操作系统上显示")
    }
}

class YAUnixSystem: YAOperationSystem {
    func operationSystemDisply() {
        print("在Unix操作系统上显示")
    }
}
