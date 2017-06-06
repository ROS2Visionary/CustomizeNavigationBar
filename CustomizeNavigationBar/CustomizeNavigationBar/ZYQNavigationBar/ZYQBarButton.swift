//
//  ZYQBarButton.swift
//  RedWine_Swift
//
//  Created by anjubao on 16/9/8.
//  Copyright © 2016年 anjubao. All rights reserved.
//

import UIKit

/// 按钮字体大小
let ButtonFont:CGFloat = 15.0

/// 回调闭包（相当于block）
typealias TapHandler = ( _ sender:UIButton) -> ()

class ZYQBarButton: UIButton {
    
    ///  回调属性
    fileprivate var handler:TapHandler?
    
    /// 便利构造函数
    ///
    /// - parameter btnSize:    button大小
    /// - parameter title:   button文字
    /// - parameter handler: button点击回调
    ///
    /// - returns: ZYQBarButton
    convenience init(btnSize:CGSize, title:String, handler:@escaping TapHandler){
        
        self.init()
        
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: ButtonFont)
        
        if btnSize.equalTo(CGSize.zero) {
            sizeToFit()
        }else{
            size = btnSize
        }
        
        self.handler = handler
        
        addTarget(self, action: #selector(ZYQBarButton.btnTap(_:)), for: .touchUpInside)
        
    }
    
    /// 便利构造函数
    ///
    /// - parameter btnSize:   button大小
    /// - parameter imageName: button图片
    /// - parameter handler:   button点击回调
    ///
    /// - returns: ZYQBarButton
    convenience init(btnSize:CGSize, imageName:String, handler:@escaping TapHandler){
        self.init()
        
        setImage(UIImage(named: imageName), for: UIControlState())
        
        if btnSize.equalTo(CGSize.zero) {
            sizeToFit()
        }else{
            size = btnSize
        }
        
        self.handler = handler
        
        addTarget(self, action: #selector(ZYQBarButton.btnTap(_:)), for: .touchUpInside)
    }
    
    /// 便利构造函数
    ///
    /// - parameter btnSize:   button大小
    /// - parameter title:     button文字
    /// - parameter iamgeName: butto图片
    /// - parameter handler:   button点击回调
    ///
    /// - returns: ZYQBarButton
    convenience init(btnSize:CGSize, title:String, iamgeName:String, handler:@escaping TapHandler){
        self.init()
        
        setImage(UIImage(named: iamgeName), for: UIControlState())
        
        setTitle(title, for: UIControlState())
        
        titleLabel?.font = UIFont.systemFont(ofSize: ButtonFont)
        
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 0)
        
        if btnSize.equalTo(CGSize.zero) {
            sizeToFit()
            width = width + 3
        }else {
            size = btnSize
        }
        
        self.handler = handler
        
        addTarget(self, action: #selector(ZYQBarButton.btnTap(_:)), for: .touchUpInside)
    }
    
    func btnTap(_ sender:UIButton){
        
        if self.handler != nil {
            self.handler!(sender)
        }
    }
}
