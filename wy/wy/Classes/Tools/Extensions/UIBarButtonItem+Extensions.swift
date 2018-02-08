//
//  UIBarButtonItem+Extensions.swift
//  wy
//
//  Created by chu on 07/02/2018.
//  Copyright © 2018 chu. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(title:String, fontSize:CGFloat = 16, target:AnyObject?, action:Selector, isBack: Bool = false) {
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.gray, for: .normal)
        btn.setTitleColor(UIColor.orange, for: .highlighted)
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        if isBack == false {
            let imageName = ""
            //一般情况
            btn.setImage(UIImage(named:""), for: UIControlState(rawValue:0))
            //高亮
            btn.setImage(UIImage(named:imageName+""), for: .highlighted)
            //调整大小
            btn.sizeToFit()
        }
        
        self.init(customView:btn)
    }
}
