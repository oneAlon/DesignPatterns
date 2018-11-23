//
//  YAMementoManager.swift
//  19备忘录模式
//
//  Created by xygj on 2018/11/23.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

// 备忘录管理类, 只负责备忘录的保存和获取
class YAMementoManager: NSObject {
    
    var chessmanMementoArray: [YAChessmanMemento] = [YAChessmanMemento]()
    
    func setChessmanMemento(chessmanMemento: YAChessmanMemento) {
        chessmanMementoArray.append(chessmanMemento)
    }
    
    func getChessmanMemento(index: Int) -> YAChessmanMemento {
        return chessmanMementoArray[index]
    }
    
    func getChessmanMemento() -> YAChessmanMemento {
        return chessmanMementoArray.last!
    }

}
