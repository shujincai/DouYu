//
//  NetworkTools.swift
//  DouYu
//
//  Created by pingtong on 2017/6/20.
//  Copyright © 2017年 PTDriver. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}
class NetworkTools {
    class func requestData(type: MethodType,URLString: String,parameters:[String:String]? = nil,finishedCallBack : @escaping (_ result : AnyObject) -> ()) {
        //获取类型
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        //发送网络请求
        Alamofire.request(URLString,method:method,parameters:parameters).responseJSON { (response) in
            //获取结果
            guard let result = response.result.value else{return}
            //将结果回调出来
            finishedCallBack(result as AnyObject)
        }
    }
}
