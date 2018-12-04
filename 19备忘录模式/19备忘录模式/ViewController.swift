//
//  ViewController.swift
//  19备忘录模式
//
//  Created by xygj on 2018/11/23.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

/*
 
 实现撤销功能-备忘录模式
    在不破坏封装的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态，这样可以在以后将对象恢复到原先保存的状态。它是一种对象行为型模式，其别名为Token。
 
 Originator原发器: 是一个普通类(需要保存的对象)
 Memento备忘录:
 Caretaker负责人: 管理类, 负责保存备忘录, 但是不能对备忘录做修改操作, 只负责存储对象.
 
 使用场景:
    需要保存一个对象在某一时刻的状态.
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = YAMementoManager()
        
        let chessman = YAChessman(label: "马", x: 1, y: 1)
        manager.setChessmanMemento(chessmanMemento: chessman.save()) // 保存状态
        log(chessman: chessman)
        
        chessman.x = 2
        manager.setChessmanMemento(chessmanMemento: chessman.save()) // 保存状态
        log(chessman: chessman)
        
        chessman.y = 3
        log(chessman: chessman)
        
        chessman.undo(memento: manager.getChessmanMemento()) // 撤销状态
        print("-------悔棋喽, 你说气人不-------")
        manager.setChessmanMemento(chessmanMemento: chessman.save()) // 保存状态
        log(chessman: chessman)
        
    }

    func log(chessman: YAChessman) {
        print("棋子\(chessman.label)所在的位置x:\(chessman.x) y:\(chessman.y)")
    }

}

