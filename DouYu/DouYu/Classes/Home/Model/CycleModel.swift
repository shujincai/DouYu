//
//  CycleModel.swift
//  DouYu
//
//  Created by pingtong on 2017/6/22.
//  Copyright © 2017年 PTDriver. All rights reserved.
//

import UIKit
import ObjectMapper

class CycleModel: Mappable {
    var error: String?
    var data: [CycleData]?
    
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        error <- map["error"]
        data <- map["data"]
    }
}
class CycleData: CycleModel {
    var id: Int?
    var title: String?
    var pic_url: String?
    var tv_pic_url: String?
    var room: CycleRoom?
    override func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        pic_url <- map["pic_url"]
        tv_pic_url <- map["tv_pic_url"]
        room <- map["room"]
    }
 
}
class CycleRoom: Mappable {
    var room_id: String?
    var room_src: String?
    var vertical_src: String?
    var isVertical: Int?
    var cate_id: String?
    var room_name: String?
    var vod_quality: String?
    var show_status: String?
    var show_time: String?
    var owner_uid: String?
    var specific_catalog: String?
    var specific_status: String?
    var credit_illegal: String?
    var is_white_list: String?
    var cur_credit: String?
    var low_credit: String?
    var online: Int?
    var nickname: String?
    var url: String?
    var game_url: String?
    var game_name: String?
    var game_icon_url: String?
    var show_details: String?
    var owner_avatar: String?
    var is_pass_player: Int?
    var open_full_screen: Int?
    var owner_weight: String?
    var fans: String?
    var column_id: String?
    var cdnsWithName: [CycleCdns]?
    var cate_limit: CycleLimit?
    
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        room_id <- map["room_id"]
        room_src <- map["room_src"]
        vertical_src <- map["vertical_src"]
        isVertical <- map["isVertical"]
        cate_id <- map["cate_id"]
        room_name <- map["room_name"]
        vod_quality <- map["vod_quality"]
        show_status <- map["show_status"]
        show_time <- map["show_time"]
        owner_uid <- map["owner_uid"]
        specific_catalog <- map["specific_catalog"]
        specific_status <- map["specific_status"]
        credit_illegal <- map["credit_illegal"]
        is_white_list <- map["is_white_list"]
        cur_credit <- map["cur_credit"]
        low_credit <- map["low_credit"]
        online <- map["online"]
        nickname <- map["nickname"]
        url <- map["url"]
        game_url <- map["game_url"]
        game_name <- map["game_name"]
        game_icon_url <- map["game_icon_url"]
        show_details <- map["show_details"]
        owner_avatar <- map["owner_avatar"]
        is_pass_player <- map["is_pass_player"]
        open_full_screen <- map["open_full_screen"]
        owner_weight <- map["owner_weight"]
        fans <- map["fans"]
        column_id <- map["column_id"]
        cdnsWithName <- map["cdnsWithName"]
        cate_limit <- map["cate_limit"]
    }
}
class CycleCdns: CycleRoom {
    var name: String?
    var cdn: String?
    override func mapping(map: Map) {
        name <- map["name"]
        cdn <- map["cdn"]
    }
}
class CycleLimit: Mappable {
    var limit_type: Int?
    var limit_num: Int?
    var limit_threshold: Int?
    var limit_time: Int?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        limit_type <- map["limit_type"]
        limit_num <- map["limit_num"]
        limit_threshold <- map["limit_threshold"]
        limit_time <- map["limit_time"]
    }
}
