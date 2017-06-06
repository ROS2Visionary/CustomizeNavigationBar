//
//  UIView+Extension.swift
//  RedWine_Swift
//
//  Created by anjubao on 16/9/8.
//  Copyright © 2016年 anjubao. All rights reserved.
//

import UIKit

extension UIView {
    public var x:CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var tempFrame = self.frame
            tempFrame.origin.x = newValue
            self.frame = tempFrame
        }
    }
    
    public var y:CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            var tempFrame = self.frame
            tempFrame.origin.y = newValue
            self.frame = tempFrame
        }
    }
    
    public var width:CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            var tempFrame = self.frame
            tempFrame.size.width = newValue
            self.frame = tempFrame
        }
    }
    
    public var height:CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            var tempFrame = self.frame
            tempFrame.size.height = newValue
            self.frame = tempFrame
        }
    }
    
    public var origin:CGPoint{
        get{
            return self.frame.origin
        }
        set{
            self.x = newValue.x
            self.y = newValue.y
        }
    }
    
    public var size:CGSize{
        get{
            return self.frame.size
        }
        set{
            self.width = newValue.width
            self.height = newValue.height
        }
    }
    
    public var centerX:CGFloat{
        get{
            return self.center.x
        }
        set{
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    public var centerY:CGFloat{
        get{
            return self.center.y
        }
        set{
        self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    
}



















