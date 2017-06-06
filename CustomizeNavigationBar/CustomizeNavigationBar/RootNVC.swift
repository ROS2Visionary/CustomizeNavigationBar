//
//  RootNavigationVC.swift
//  RedWine_Swift
//
//  Created by anjubao on 16/9/9.
//  Copyright © 2016年 anjubao. All rights reserved.
//

import UIKit

class RootNVC: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    
        viewController.hidesBottomBarWhenPushed = true
        
        super.pushViewController(viewController, animated: animated)
    }
    
}













