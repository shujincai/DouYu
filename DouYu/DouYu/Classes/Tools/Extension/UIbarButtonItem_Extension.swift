//
//  UIbarButtonItem_Extension.swift
//  DouYu
//
//  Created by pingtong on 2017/6/16.
//  Copyright © 2017年 PTDriver. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    /*
    class func createItem(imageName: String, hightImageName: String, size: CGSize) -> UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: hightImageName), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        return UIBarButtonItem(customView: btn)
    }
   */
    convenience init(imageName: String, hightImageName: String = "", size: CGSize = CGSize.zero) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        if hightImageName != "" {
           btn.setImage(UIImage(named: hightImageName), for: .highlighted)
        }
        if size == CGSize.zero {
            btn.sizeToFit()
        }else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        self.init(customView: btn)
    }
}
