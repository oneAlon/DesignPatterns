//
//  YANewMovieTicket.swift
//  22策略模式
//
//  Created by xygj on 2019/4/26.
//  Copyright © 2019 xygj. All rights reserved.
//

import UIKit

class YANewMovieTicket: NSObject {
    var price: CGFloat = 0.0 // 原价
    func getMovieTicketPrice() -> CGFloat {
        return price
    }
}

class YANewStudentMovieTicket: YANewMovieTicket {
    
    override func getMovieTicketPrice() -> CGFloat {
        print("学生票")
        return price * 0.8
    }
    
}

class YANewChildrenMovieTicket: YANewMovieTicket {
    
    override func getMovieTicketPrice() -> CGFloat {
        print("儿童票")
        return price - 10
    }
    
}

class YANewVipMovieTicket: YANewMovieTicket {
    
    override func getMovieTicketPrice() -> CGFloat {
        print("会员票")
        print("会员积分")
        return price * 0.5
    }
    
}
