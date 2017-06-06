//
//  ZYQNavigationItem.swift
//  RedWine_Swift
//
//  Created by anjubao on 16/9/9.
//  Copyright © 2016年 anjubao. All rights reserved.
//

import UIKit

let NavBarHeight:CGFloat = 44.0

let StatusBarHeight:CGFloat = 20.0

let LabelFont:CGFloat = 17.0

let ScreenWith:CGFloat = UIScreen.main.bounds.width

let ScreenHeight:CGFloat = UIScreen.main.bounds.height

let ScreenBounds:CGRect = UIScreen.main.bounds

let Space:CGFloat = 10.0

let ButtonsHeight:CGFloat = 22.0

class ZYQNavigationItem: UIView {
    
    /// 判断是否居中标题视图 (默认不居中)
    var titleViewIsCenter:Bool = false
    
    /// 标题
    var title:String?{
        
        didSet{
            
            titleLabel!.text = title
            
            titleLabel!.sizeToFit()
            
            titleLabel?.font = UIFont.systemFont(ofSize: LabelFont)
            
            titleLabel!.center = CGPoint(x: centerX, y: height / 2)
           
            var leftWidths:CGFloat = Space
            if let leftBtns = leftButtons {
                leftBtns.enumerateObjects({ (obj, index, _) in
                    
                    let btn:UIButton = obj as! UIButton
                    
                    leftWidths = btn.width + Space + leftWidths
                    
                })
            }
            
            var rightWidths:CGFloat = Space
            if let rightBtns = rightButtons {
                rightBtns.enumerateObjects({ (obj, index, _) in
                    
                    let btn:UIButton = obj as! UIButton
                    
                    rightWidths = btn.width + Space + rightWidths

                })
            }
            
            let maxWidth:CGFloat = rightWidths > leftWidths ? rightWidths : leftWidths
            
            let tempWidth:CGFloat = ScreenWith - 2 * maxWidth
            
            if titleLabel?.width ?? 0.0 > tempWidth {
                titleLabel?.width = tempWidth
                titleLabel!.center = CGPoint(x: centerX, y: height / 2)
            }
        }
    }
    
    /// 标题视图
    var titleView:UIView?{
        
        didSet{
            
            if titleLabel != nil {
                
                titleLabel?.removeFromSuperview()
            }
            
            var leftSpace:CGFloat = Space
            
            var rightSpace:CGFloat = Space
            
            if backButton != nil && !(backButton?.isHidden)! {
                
                leftSpace = 2 * Space + (backButton?.width)!
            }
            
            if let leftButtons = leftButtons {
            
                leftButtons.enumerateObjects({ (obj, index, _) in
                    let btn = obj as! UIButton
                    
                    leftSpace = Space + btn.width
                })
            }
            
            
            if let rightButtons = rightButtons {
                rightButtons.enumerateObjects({ (obj, index, _) in
                    let btn = obj as! UIButton
                    
                    rightSpace = Space + btn.width
                })
            }
            
           
            
            if titleView?.width == 0 || titleView?.height == 0 {
                
                if leftSpace > rightSpace {
                
                    titleView?.frame = CGRect(x: leftSpace, y: 0, width: ScreenWith - 2 * leftSpace, height: NavBarHeight)
                    
                }else{
                
                    titleView?.frame = CGRect(x: rightSpace, y: 0, width: ScreenWith - 2 * rightSpace, height: NavBarHeight)
                }
                
            }
            
            if !titleViewIsCenter {
                titleView?.frame = CGRect(x: leftSpace, y: 0, width: ScreenWith - leftSpace - rightSpace, height: NavBarHeight)
            }
            
            addSubview(titleView!)
        }
    }
    
    /// 返回按钮（默认隐藏）
    var backButton:UIButton? = {
        
        let btn = UIButton(type: UIButtonType.custom)
        
        btn.frame = CGRect(x: Space, y: 10, width: 50, height: ButtonsHeight)
        
        btn.setImage(UIImage(named:"back"), for: UIControlState())
        
        btn.addTarget(self, action: #selector(ZYQNavigationItem.pop), for: .touchUpInside)
        
        return btn
        
    }()
    
    /// 所以本界面的文本颜色(默认为白色)
    var textColor:UIColor = UIColor.white{
        
        didSet{
            
            // 遍历按钮设置文字颜色
            if let leftArray:NSArray = self.leftButtons {
                
                for obj in leftArray{
                    let btn = obj as! UIButton
                    btn.setTitleColor(self.textColor, for: UIControlState())
                }
            }
            
            titleLabel?.textColor = textColor
            
            // 遍历按钮设置文字颜色
            if let rightArray:NSArray = self.rightButtons {
                
                for obj in rightArray{
                    let btn = obj as! UIButton
                    btn.setTitleColor(self.textColor, for: UIControlState())
                }
            }
        }
    }
    
    /// 分割线颜色(默认为透明)
    var lineColor:UIColor?{
        
        didSet{
            separatorLine.image = nil
            separatorLine.backgroundColor = lineColor
        }
    }
    
    /// 分割线图片名称
    var lineImageName:String?
    
    /// 左按钮集合
    var leftButtons:NSArray?{
        
        willSet{
            backButton?.removeFromSuperview()
            if let leftButtons = leftButtons {
                leftButtons.enumerateObjects({ (obj, index, _) in
                    let btn = obj as! UIButton
                    btn.removeFromSuperview()
                })
            }

        }
        
        didSet{
            
            if let leftArray = leftButtons {
                
                leftArray.enumerateObjects({ (obj, index, _) in
                    
                    let btn = obj as! UIButton
                    
                    btn.setTitleColor(textColor, for: .normal)
                    
                    btn.frame = CGRect(x: self.leftButtonsX, y: 0, width: btn.width, height: btn.height)
                    
                    let tempX:CGFloat = btn.width + Space
                    
                    self.leftButtonsX = self.leftButtonsX + tempX
                    
                    self.titleLabel?.textColor = self.textColor
                    
                    btn.centerY = self.height / 2
                    
                    self.addSubview(btn)
                })
            }
            
            if titleViewIsCenter {
                if leftButtonsX > rightButtonsX {
                    
                    titleView?.frame = CGRect(x: leftButtonsX, y: 0, width: ScreenWith - 2 * leftButtonsX, height: NavBarHeight)
                    
                }else{
                    
                    titleView?.frame = CGRect(x: rightButtonsX, y: 0, width: ScreenWith - 2 * rightButtonsX, height: NavBarHeight)
                }
            }else{
                titleView?.frame = CGRect(x: leftButtonsX, y: 0, width: ScreenWith - leftButtonsX - rightButtonsX, height: NavBarHeight)
            }
            
        }
    }
    
    /// 右按钮集合
    var rightButtons:NSArray?{
        
        willSet{
            if let rightArray = rightButtons {
                
                rightArray.enumerateObjects({ (obj, index, _) in
                    let btn = obj as! UIButton
                    btn.removeFromSuperview()
                })
            }
        }
        
        didSet{
            
            self.rightButtonsX = 0.0
            
            if let rightArray = rightButtons {
                
                rightArray.enumerateObjects({ (obj, index, _) in
                    
                    let btn = obj as! UIButton
                    
                    btn.setTitleColor(textColor, for: .normal)
                    
                    let tempX:CGFloat = btn.width + Space
                    
                    self.rightButtonsX = self.rightButtonsX + tempX
                    
                    btn.frame = CGRect(x: ScreenWith - self.rightButtonsX, y: 0, width: btn.width, height: btn.height)
                    
                    
                    btn.titleLabel?.textColor = self.textColor
                    
                    btn.centerY = self.height / 2
                    
                    self.addSubview(btn)
                })
            }
            
            if titleViewIsCenter {
                if leftButtonsX > rightButtonsX {
                    
                    titleView?.frame = CGRect(x: leftButtonsX, y: 0, width: ScreenWith - 2 * leftButtonsX, height: NavBarHeight)
                    
                }else{
                    
                    titleView?.frame = CGRect(x: rightButtonsX, y: 0, width: ScreenWith - 2 * rightButtonsX, height: NavBarHeight)
                }
            }else{
             titleView?.frame = CGRect(x: leftButtonsX, y: 0, width: ScreenWith - leftButtonsX - rightButtonsX, height: NavBarHeight)
            }
        }
    }
    
    /// navigationController栈中的所有视图
    fileprivate lazy var viewArrays:NSArray = NSArray()
    
    /// 左边按钮集合的X
    fileprivate var leftButtonsX:CGFloat = Space
    
    /// 右边按钮集合的X
    fileprivate var rightButtonsX:CGFloat = 0
    
    /// 分割线
    var separatorLine:UIImageView = UIImageView(frame: CGRect(x: 0, y: NavBarHeight - 1, width: ScreenWith, height: 1))
    
    /// 文本标题
    fileprivate var titleLabel:UILabel? = UILabel()
    
}


extension ZYQNavigationItem {
    
    /// 便利构造函数
    ///
    /// - parameter viewArrays: navigationController栈中的所有视图
    ///
    /// - returns: ZYQNavigationItem
    convenience init(viewArrays:NSArray){
        self.init()
        
        self.viewArrays = NSArray(array: viewArrays)
        
        frame = CGRect(x: 0, y: StatusBarHeight, width: ScreenWith, height: NavBarHeight)
        
        if viewArrays.count > 1 {
            backButton!.centerX = height / 2
            addSubview(backButton!)
        }else{
            backButton = nil
        }
        
        self.textColor = UIColor.white
        
        addSubview(self.separatorLine)
        addSubview(self.titleLabel!)
    }
    
    
    func pop(){
        
        let vc = viewArrays.lastObject as! UIViewController
        
        vc.navigationController!.popViewController(animated: true)
        
    }
    
}

















