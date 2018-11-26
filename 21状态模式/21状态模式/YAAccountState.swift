//
//  YAAccountState.swift
//  21状态模式
//
//  Created by xygj on 2018/11/26.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

class YAAccountState: NSObject {
    
    var account: YAAccount
    
    init(account: YAAccount) {
        self.account = account
    }
    
    // 存钱
    func deposit(amount: Double) {
        account.balance += amount
        changeState()
    }
    
    // 取钱
    func withDraw(amount: Double) {
        account.balance -= amount
        changeState()
    }
    
    // 计算利息
    func computeInterest() {
        
    }
    
    // 改变状态
    func changeState() {
        if account.balance >= Double(0) {
            account.accountState = YANormalAccountState(account: account)
        }else if account.balance > Double(-2000) {
            account.accountState = YAOverdrafeState(account: account)
        }else {
            account.accountState = YARestrictedState(account: account)
        }
    }

}

/// 正常状态
class YANormalAccountState: YAAccountState {
    
}


/// 透支状态
class YAOverdrafeState: YAAccountState {
    
    // 取钱
    override func withDraw(amount: Double) {
        account.balance -= amount
        super.deposit(amount: amount)
    }
    
    override func computeInterest() {
        print("YAOverdrafeState--计算利息!")
    }
}

/// 受限状态
class YARestrictedState: YAAccountState {
    
    // 取钱
    override func withDraw(amount: Double) {
        print("账号受限, 不能取钱")
    }
    
    override func computeInterest() {
        print("YARestrictedState--计算利息!")
    }
    
}
