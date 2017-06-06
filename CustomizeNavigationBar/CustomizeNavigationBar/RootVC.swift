//
//  RootViewController.swift
//  RedWine_Swift
//
//  Created by anjubao on 16/10/8.
//  Copyright © 2016年 zhang_yan_qing. All rights reserved.
//

import UIKit


class RootVC: UIViewController{

    // MARK: - 定义以及初始化导航栏
    lazy var navBar: ZYQNavigationBar = ZYQNavigationBar(viewArrays: self.navigationController?.viewControllers as NSArray? ?? [self])
    
    var navItem:ZYQNavigationItem {
        get{
            return navBar.navigationItem!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
    }
    
    
}




















