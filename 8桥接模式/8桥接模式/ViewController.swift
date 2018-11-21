//
//  ViewController.swift
//  8桥接模式
//
//  Created by xygj on 2018/11/15.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     需求:
        Sunny软件公司欲开发一个跨平台图像浏览系统，要求该系统能够显示BMP、JPG、GIF、PNG等多种格式的文件，并且能够在Windows、Linux、Unix等多个操作系统上运行。
        系统首先将各种格式的文件解析为像素矩阵(Matrix)，然后将像素矩阵显示在屏幕上，在不同的操作系统中可以调用不同的绘制函数来绘制像素矩阵。
        系统需具有较好的扩展性以支持新的文件格式和操作系统。
     
     UIImage
     bmpImage                                               jpgImage    gifImage    pngImage
     bmpWindowsImage bmpLinuxImage bmpUnixImage     ......
     
     存在的问题:
        存在多层继承类的个数急剧增加
        扩展比较麻烦, 如果要增加一种图片格式或者增加一种系统, 都需要增加大量的类
     
     问题分析:
        可以发现, 这个跨平台图像浏览系统存在两个不同变化的维度, 一个是图片格式, 一个是操作系统
        使用桥接模式可以完美解决这个问题.
     
     桥接模式:
        如果一个系统存在两个独立变化的维度, 可以使用这个模式x将两个维度分离出来, 是两者独立扩展, 让系统符合单一职责原则.
     
     UIImage
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let system = YAWindowsSystem()
//        let image = YABmpImage(operationSystem: system)
        let image = YAPngImage(operationSystem: system)
        image.displayOnSystem()
        
        
    }
}

