//
//  ViewController.swift
//  19备忘录模式
//
//  Created by xygj on 2018/11/23.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

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

