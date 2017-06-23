//
//  AnchorModel.swift
//  DouYu
//
//  Created by pingtong on 2017/6/21.
//  Copyright © 2017年 PTDriver. All rights reserved.
//

import UIKit
import ObjectMapper

//MARK:- 其他
class AnchorModel: Mappable {
    var error: String?
    var data: [AnchorGroup]?
    
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        error <- map["error"]
        data <- map["data"]
    }
}

class AnchorGroup:  AnchorModel{
    var push_vertical_screen: String?
    var icon_url: String?
    var small_icon_url: String?
    var push_nearby: String?
    var tag_name: String?
    var tag_id: String?
    var room_list: [AnchorRoomList]?
    override func mapping(map: Map) {
        push_vertical_screen <- map["push_vertical_screen"]
        icon_url <- map["icon_url"]
        small_icon_url <- map["small_icon_url"]
        push_nearby <- map["push_nearby"]
        tag_name <- map["tag_name"]
        tag_id <- map["tag_id"]
        room_list <- map["room_list"]
    }
}

class AnchorRoomList: AnchorGroup {
    var specific_catalog: String?
    var vertical_src: String?
    var owner_uid: Int?
    var ranktype: String?
    var nickname: String?
    var room_src: String?
    var cate_id: Int?
    var specific_status: Int?
    var game_name: String?
    var avatar_small: String?
    var online: String?
    var avatar_mid: String?
    var room_name: String?
    var room_id: String?
    var show_time: Int?
    var isVertical: Int?
    var show_status: Int?
    var jumpUrl: String?
    
    override func mapping(map: Map) {
        specific_catalog <- map["specific_catalog"]
        vertical_src <- map["vertical_src"]
        owner_uid <- map["owner_uid"]
        ranktype <- map["ranktype"]
        nickname <- map["nickname"]
        room_src <- map["room_src"]
        cate_id <- map["cate_id"]
        specific_status <- map["specific_status"]
        game_name <- map["game_name"]
        avatar_small <- map["avatar_small"]
        online <- map["online"]
        avatar_mid <- map["avatar_mid"]
        room_name <- map["room_name"]
        room_id <- map["room_id"]
        show_time <- map["show_time"]
        isVertical <- map["isVertical"]
        show_status <- map["show_status"]
        jumpUrl <- map["jumpUrl"]
    }
}
//MARK:- 热门
class AnchorHot: Mappable {
    var error: String?
    var data: [AnchorHotList]?
    
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        error <- map["error"]
        data <- map["data"]
    }
}

class AnchorHotList: AnchorHot {
    var specific_catalog: String?
    var vertical_src: String?
    var extra: String?
    var ranktype: String?
    var nickname: String?
    var room_src: String?
    var cate_id: Int?
    var specific_status: Int?
    var game_name: String?
    var avatar_small: String?
    var online: String?
    var avatar_mid: String?
    var room_name: String?
    var room_id: String?
    var show_time: Int?
    var isVertical: Int?
    var show_status: Int?
    var jumpUrl: String?
    var push_ios: String?
    var show_type: String?
    var src: String?
    var vod_quality: String?
    var rpos: String?
    
    override func mapping(map: Map) {
        specific_catalog <- map["specific_catalog"]
        vertical_src <- map["vertical_src"]
        extra <- map["extra"]
        ranktype <- map["ranktype"]
        nickname <- map["nickname"]
        room_src <- map["room_src"]
        cate_id <- map["cate_id"]
        specific_status <- map["specific_status"]
        game_name <- map["game_name"]
        avatar_small <- map["avatar_small"]
        online <- map["online"]
        avatar_mid <- map["avatar_mid"]
        room_name <- map["room_name"]
        room_id <- map["room_id"]
        show_time <- map["show_time"]
        isVertical <- map["isVertical"]
        show_status <- map["show_status"]
        jumpUrl <- map["jumpUrl"]
        push_ios <- map["push_ios"]
        show_type <- map["show_type"]
        src <- map["src"]
        vod_quality <- map["vod_quality"]
        rpos <- map["rpos"]
    }
}
//MARK:- 颜值
class AnchorPretty: Mappable {
    var error: String?
    var data: [AnchorPrettyList]?
    
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        error <- map["error"]
        data <- map["data"]
    }
}

class AnchorPrettyList: AnchorPretty {
    var room_id: String?
    var room_src: String?
    var vertical_src: String?
    var isVertical: Int?
    var cate_id: Int?
    var room_name: String?
    var show_status: Int?
    var subject: Int?
    var show_time: String?
    var owner_uid: String?
    var specific_catalog: String?
    var specific_status: String?
    var vod_quality: String?
    var nickname: String?
    var online: Int?
    var game_name: Int?
    var child_id: Int?
    var avatar_mid: String?
    var avatar_small: String?
    var jumpUrl: String?
    var ranktype: Int?
    var show_type: Int?
    var is_noble_rec: Int?
    var anchor_city: String?
    
    override func mapping(map: Map) {
        room_id <- map["room_id"]
        room_src <- map["room_src"]
        vertical_src <- map["vertical_src"]
        isVertical <- map["isVertical"]
        cate_id <- map["cate_id"]
        room_name <- map["room_name"]
        show_status <- map["show_status"]
        subject <- map["subject"]
        show_time <- map["show_time"]
        owner_uid <- map["owner_uid"]
        specific_catalog <- map["specific_catalog"]
        specific_status <- map["specific_status"]
        vod_quality <- map["vod_quality"]
        nickname <- map["nickname"]
        online <- map["online"]
        game_name <- map["game_name"]
        child_id <- map["child_id"]
        avatar_mid <- map["avatar_mid"]
        avatar_small <- map["avatar_small"]
        jumpUrl <- map["jumpUrl"]
        ranktype <- map["ranktype"]
        show_type <- map["show_type"]
        is_noble_rec <- map["is_noble_rec"]
        anchor_city <- map["anchor_city"]
    }
}

