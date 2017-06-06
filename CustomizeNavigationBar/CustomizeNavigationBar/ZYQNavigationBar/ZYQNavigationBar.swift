//
//  ZYQNavigationBar.swift
//  RedWine_Swift
//
//  Created by anjubao on 16/9/9.
//  Copyright © 2016年 anjubao. All rights reserved.
//

import UIKit

class ZYQNavigationBar: UIView {
    
    /// 是否隐藏自定义NavigationBar(默认显示)
    var isHiddenNavBar:Bool = false{
        didSet{
            isHidden = isHiddenNavBar
        }
    }
    /// 设置NavigationBar的背景色(默认黑灰色)
    var navBarColor:UIColor = UIColor.darkGray{
        didSet{
            backgroundColor = navBarColor
        }
    }
    /// 设置NavigationBar的透明度(默认1.0)
    var navBarAlpha:CGFloat = 1.0{
        didSet{
            alpha = navBarAlpha
        }
    }
    /// 设置NavigationBar不影响子视图显示的透明度
    var navBarSuperAlpha:CGFloat = 1.0{
        didSet{
        backgroundColor?.withAlphaComponent(navBarAlpha)
        }
    }
    
    /// 设置NavigationBar的背景图片
    var barBackImage:UIImage? {
        
        didSet{
        
            let imageView = UIImageView(frame: self.bounds)
            imageView.image = barBackImage!
            self.addSubview(imageView)
            self.sendSubview(toBack: imageView)
        }
    }
    
    /// navigationController栈中的所有视图
    fileprivate lazy var viewArrays:NSArray = NSArray()
    
    var navigationItem:ZYQNavigationItem?
    
}



extension ZYQNavigationBar {


    convenience init(viewArrays:NSArray){
        self.init()
        
        self.frame = CGRect(x: 0, y: 0, width: ScreenWith, height: NavBarHeight + StatusBarHeight)
        
        self.viewArrays = NSArray(array: viewArrays)
        
        self.navigationItem = ZYQNavigationItem(viewArrays: self.viewArrays)
        
        addSubview(navigationItem!)
        
        backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        
        let lastVC = viewArrays.lastObject as? UIViewController
        
        lastVC?.view.addSubview(self)
    }
    
}






