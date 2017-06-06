//
//  ViewController.swift
//  CustomizeNavigationBar
//
//  Created by anjubao on 2017/6/6.
//  Copyright © 2017年 zhang_yan_qing. All rights reserved.
//

import UIKit


class ViewController: RootVC { // 让其继承自 RootVC

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置标题
        navItem.title = "这是一个自定义导航栏"
        navItem.textColor = UIColor.white
        
        // 设置导航栏backgroundColor
        navBar.backgroundColor = UIColor.orange
        
        // 设置右item
        weak var weakSelf = self  // 这里需要使用弱引用
        
        let rightItem = ZYQBarButton(btnSize: CGSize.zero, title: "item") { (_) in
            // 实现按钮的点击事件
            weakSelf?.navigationController?.pushViewController(OtheController(), animated: true)
        }
        
        navItem.rightButtons = [rightItem]
    }

   


}

