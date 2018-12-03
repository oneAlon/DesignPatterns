//
//  ViewController.swift
//  9组合模式
//
//  Created by xygj on 2018/11/16.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

/*
 需求:
    Sunny软件公司欲开发一个杀毒(AntiVirus)软件，该软件既可以对某个文件夹(Folder)杀毒，也可以对某个指定的文件(File)进行杀毒。
    该杀毒软件还可以根据各类文件的特点，为不同类型的文件提供不同的杀毒方式，例如图像文件(ImageFile)和文本文件(TextFile)的杀毒方式就有所差异。现需要提供该杀毒软件的整体框架设计方案。
 
 分析:
    有文件和文件夹两种不同的元素, 文件夹中还可以包含文件和文件夹, 文件为最后一级
    文件夹称为容器, 文件称为叶子
 
 YAOriginalFile中存在问题:
 1. Folder文件夹设计太复杂, 系统维护困难
 2. 扩展性差, 如果需要增加新的类型的额叶子和容器都需要修改原来的代码
 
 组合模式优点:
    1. 层次结构清晰
    2. 增加新的容器或者叶子都很方便, 不需要修改原有代码(客户端需要修改)
    3. 组合模式为树形结构的面向对象提供了一种灵活的解决方案
 缺点:
    对容器中增加文件的类型很难控制, 比如某个文件夹容器中只能增加文件类型, 在增加的时候对文件类型不好判断控制
 
 使用场景:
    树状结构
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newTest()
        
    }
    
    func newTest() {
        var folder1, folder2, folder3: Composite
        
        folder1 = Composite("OneAlon的资料")
        folder2 = Composite("图像文件")
        folder3 = Composite("文本文件")
        
        folder1.add(folder2)
        folder1.add(folder3)
        
        folder2.add(Leaf("小龙女.jpg"))
        folder2.add(Leaf("杨过.gif"))
        
        folder3.add(Leaf("九阳真经.txt"))
        folder3.add(Leaf("独孤九剑.doc"))
        
        folder1.killVirus()
    }
    
    /*
     存在的问题:
     */
    func originalTest() {
        var folder1, folder2, folder3: Folder
        
        folder1 = Folder("OneAlon的资料")
        folder2 = Folder("图像文件")
        folder3 = Folder("文本文件")
        
        folder1.addFloder(floder: folder2)
        folder1.addFloder(floder: folder3)
        
        folder2.addImageFile(imageFile: ImageFile("小龙女.jpg"))
        folder2.addImageFile(imageFile: ImageFile("杨过.gif"))
        
        folder3.addTextFile(textFile: TextFile("九阳真经.txt"))
        folder3.addTextFile(textFile: TextFile("独孤九剑.doc"))
        
        folder1.killVirus()
    }

}

