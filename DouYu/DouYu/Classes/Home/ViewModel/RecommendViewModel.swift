//
//  RecommendViewModel.swift
//  DouYu
//
//  Created by pingtong on 2017/6/21.
//  Copyright © 2017年 PTDriver. All rights reserved.
//

import UIKit
import ObjectMapper

class RecommendViewModel {
    var bigDataGroup:AnchorHot?
    var prettyGroup:AnchorPretty?
    var cycleGroup:AnchorModel?
}

//MARK:- 发送网络请求
extension RecommendViewModel {
    func requsetData(_ finishCallback : @escaping () -> ()) {
        // 1.定义参数
        let parameters = ["limit":"4","offset":"0","time": NSDate.getCurrentTime()]
        // 2.创建Group
        let dGroup = DispatchGroup()
        
        // 3.请求第一部分推荐数据
        dGroup.enter()
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom",parameters: ["time": NSDate.getCurrentTime()]) { (result) in
            guard let resultDict = result as? [String : Any] else{return}
            let info = Mapper<AnchorHot>().map(JSONObject: resultDict)
            self.bigDataGroup = info
            dGroup.leave()
        }
        // 4.请求第二部分颜值数据
        dGroup.enter()
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom",parameters: parameters) { (result) in
            guard let resultDict = result as? [String : Any] else{return}
            let info = Mapper<AnchorPretty>().map(JSONObject: resultDict)
            self.prettyGroup = info
            dGroup.leave()
        }
        // 5.请求后面部分游戏数据
        dGroup.enter()
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: parameters) { (result) in
            //将result转成字典类型
            
            guard let resultDict = result as? [String : NSObject] else{return}
            let info = Mapper<AnchorModel>().map(JSONObject: resultDict)
            self.cycleGroup = info
            dGroup.leave()
        }
        // 6.所有的数据都请求到,之后进行排序
        dGroup.notify(queue: DispatchQueue.main) {
            finishCallback()
        }
    }
    //请求无线轮播数据
    func requestCycleData(finishCallback: @escaping (CycleModel) -> ()) {
        NetworkTools.requestData(type: .GET, URLString: "http://www.douyutv.com/api/v1/slide/6", parameters: ["version" : "2.300"]) { (result) in
            guard let resultDict = result as? [String : Any] else{return}
            let info = Mapper<CycleModel>().map(JSONObject: resultDict)
            finishCallback(info!)
        }
    }
}
