//
//  YAAccount.swift
//  21状态模式
//
//  Created by xygj on 2018/11/26.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

// 账户类
class YAAccount: NSObject {
    
    lazy var accountState: YAAccountState = {
        YAAccountState(account: self)
    }()
    var owner: String
    var balance: Double
    
    init(owner: String, balance: Double) {
        self.owner = owner
        self.balance = balance
        print("创建账户\(owner), 账户余额\(balance)")
        print("---------------------------------")
    }
    
    // 功能方法
    // 存钱
    func deposit(amount: Double) {
        print("\(owner)存入\(amount)")
        accountState.deposit(amount: amount)
        print("账户余额\(balance)")
        print("现在状态为\(accountState.self)")
        print("---------------------------------")
    }
    
    // 取钱
    func withDraw(amount: Double) {
        print("\(owner)取出\(amount)")
        accountState.withDraw(amount: amount)
        print("账户余额\(balance)")
        print("现在状态为\(accountState.self)")
        print("---------------------------------")
    }
    
    // 计算利息
    func computeInterest() {
        accountState.computeInterest()
    }
    
}
