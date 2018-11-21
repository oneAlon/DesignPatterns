//
//  YASkinComponent.swift
//  4抽象工厂模式
//
//  Created by xygj on 2018/11/14.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

protocol YASkinComponent{
//    func display()
}


// MARK: - Button

class YASkinSpringButton: UIButton, YASkinComponent {
//    func display() {
//
//    }
}

class YASkinSummerButton: UIButton, YASkinComponent {
    
}

// MARK: - TextField

class YASkinSpringTextField: UITextField, YASkinComponent {
    
}

class YASkinSummerTextField: UITextField, YASkinComponent {
    
}

// MARK: - Label

class YASkinSpringLabel: UILabel, YASkinComponent {
    
}

class YASkinSummerLabel: UILabel, YASkinComponent {
    
}
