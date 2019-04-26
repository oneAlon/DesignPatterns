//
//  YAOldMovieTicket.swift
//  22策略模式
//
//  Created by xygj on 2019/4/25.
//  Copyright © 2019 xygj. All rights reserved.
//

import UIKit

class YAOldMovieTicket: NSObject {
    
    var price: CGFloat = 0.0// 电影票价
    var type: String = ""// 客户类型
    
    func getMovieTicketPrice() -> CGFloat {
        var finalPrice = 0.0
        if type == "student" {
            print("学生票")
            finalPrice = Double(price * 0.8)
        }else if type == "children" && price >= 20 {
            print("儿童票")
            finalPrice = Double(price - 10)
        }else if type == "vip" {
            print("会员票")
            print("会员积分")
            finalPrice = Double(price * 0.5)
        }
        return CGFloat(finalPrice)
    }
}
