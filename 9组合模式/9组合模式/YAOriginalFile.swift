//
//  YAOriginalFile.swift
//  9组合模式
//
//  Created by xygj on 2018/11/19.
//  Copyright © 2018 xygj. All rights reserved.
//

import Foundation

// 图像文件(叶子)
class ImageFile {
    
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func killVirus() {
        print("对图像文件\(self.name)进行杀毒")
    }
    
}

// 文本文件(叶子)
class TextFile {
    
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func killVirus() {
        print("对文本文件\(self.name)进行杀毒")
    }
}

// 文件夹(容器)
class Folder {
    
    var imageList: [ImageFile] = [ImageFile]()
    var textList: [TextFile] = [TextFile]()
    var floderList: [Folder] = [Folder]()
    
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    // 添加
    func addImageFile(imageFile: ImageFile) {
        self.imageList.append(imageFile)
    }
    func addTextFile(textFile: TextFile) {
        self.textList.append(textFile)
    }
    func addFloder(floder: Folder) {
        self.floderList.append(floder)
    }
    
    // 杀毒
    func killVirus() {
        print("对文件夹\(name)进行杀毒")
        
        for imageFile in imageList {
            imageFile.killVirus()
        }
        
        for textFile in textList {
            textFile.killVirus()
        }
        
        for floder in floderList {
            floder.killVirus()
        }
    }
    
    
}
