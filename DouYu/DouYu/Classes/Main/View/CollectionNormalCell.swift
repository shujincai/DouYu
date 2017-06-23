//
//  CollectionNormalCell.swift
//  DouYu
//
//  Created by pingtong on 2017/6/20.
//  Copyright © 2017年 PTDriver. All rights reserved.
//

import UIKit

class CollectionNormalCell: UICollectionViewCell {

    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var iconImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //热门
    var anchorHot: AnchorHotList? {
        didSet {
            guard let anchorHot = anchorHot else {
                return
            }
            // 1.取出在线人数显示的文字
            var onlineStr: String = ""
            let online = Int(anchorHot.online!)
            
            if online! >= 10000 {
                onlineStr = "\(Int(online!/10000))万在线"
            }else {
                onlineStr = "\(String(describing: anchorHot.online!))在线"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
            // 2.昵称的显示
            nickNameLabel.text = anchorHot.nickname!
            // 3.设置封面的图片
            guard let iconUrl = URL(string: anchorHot.vertical_src!) else {
                return
            }
            iconImageView.kf.setImage(with: iconUrl)
            // 4.房间名称
            roomNameLabel.text = anchorHot.room_name!
        }
    }
    var anchor: AnchorRoomList? {
        didSet {
            guard let anchor = anchor else {
                return
            }
            // 1.取出在线人数显示的文字
            var onlineStr: String = ""
            let online = Int(anchor.online!)
            if online! >= 10000 {
                onlineStr = "\(Int(online!/10000))万在线"
            }else {
                onlineStr = "\(String(describing: anchor.online!))在线"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
            // 2.昵称的显示
            nickNameLabel.text = anchor.nickname!
            // 3.设置封面的图片
            guard let iconUrl = URL(string: anchor.vertical_src!) else {
                return
            }
            iconImageView.kf.setImage(with: iconUrl)
            // 4.房间名称
            roomNameLabel.text = anchor.room_name!
        }
    }
    
}
