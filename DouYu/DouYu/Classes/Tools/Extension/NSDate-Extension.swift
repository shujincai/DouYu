
//
//  NSDate-Extension.swift
//  DouYu
//
//  Created by pingtong on 2017/6/21.
//  Copyright © 2017年 PTDriver. All rights reserved.
//

import Foundation

extension NSDate {
    class func getCurrentTime() -> String {
        let nowDate = NSDate()
        let interval = Int(nowDate.timeIntervalSince1970)
        return "\(interval)"
    }
}
