//
//  YAVideoBuilder.swift
//  6建造者模式
//
//  Created by 刘君威 on 2019/5/22.
//  Copyright © 2019 OneAlon. All rights reserved.
//

import UIKit

// 视频播放软件
class YAVideo: NSObject {
    
    var menu: Bool = true              // 菜单
    var displayList: Bool = true       // 展示列表
    var homeWindow:  Bool = true       // 主窗口
    var controlLine:  Bool = true      // 控制条
    var collectionList:  Bool = true   // 收藏列表
}

// 抽象建造者
protocol YAVideoBuilder {

    var video: YAVideo { get }
    
    func setupMenu()
    func setupDisplayList()
    func setupHomeWindow()
    func setupControlLine()
    func setupCollectionList()

    func createVideo() -> YAVideo
}

// 完整模式建造者
class YAAllVideoBuilder: YAVideoBuilder {
    
    var video: YAVideo = YAVideo()
    
    func setupMenu() {
        video.menu = true
    }
    
    func setupDisplayList() {
        video.displayList = true
    }
    
    func setupHomeWindow() {
        video.homeWindow = true
    }
    
    func setupControlLine() {
        video.controlLine = true
    }
    
    func setupCollectionList() {
        video.collectionList = true
    }
    
    func createVideo() -> YAVideo {
        return video
    }
}

// 精简模式建造者
class YASimpleVideoBuilder: YAVideoBuilder {
    
    var video: YAVideo = YAVideo()
    
    func setupMenu() {
        video.menu = false
    }
    
    func setupDisplayList() {
        video.displayList = false
    }
    
    func setupHomeWindow() {
        video.homeWindow = true
    }
    
    func setupControlLine() {
        video.controlLine = true
    }
    
    func setupCollectionList() {
        video.collectionList = false
    }
    
    func createVideo() -> YAVideo {
        return video
    }
}

// 指挥者
class YAVideoController: NSObject {
    
    class func construct(videoBuilder: YAVideoBuilder) -> YAVideo {
        videoBuilder.setupMenu()
        videoBuilder.setupDisplayList()
        videoBuilder.setupHomeWindow()
        videoBuilder.setupControlLine()
        videoBuilder.setupCollectionList()
        
        return videoBuilder.createVideo()
    }
}
