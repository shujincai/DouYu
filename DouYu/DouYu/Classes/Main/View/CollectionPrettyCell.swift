//
//  CollectionPrettyCell.swift
//  DouYu
//
//  Created by pingtong on 2017/6/20.
//  Copyright © 2017年 PTDriver. All rights reserved.
//

import UIKit
import Kingfisher
class CollectionPrettyCell: UICollectionViewCell {

    @IBOutlet weak var cityBtn: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var iconImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:- 定义模型属性
    var anchor: AnchorPrettyList? {
        didSet {
            guard let anchor = anchor else {
                return
            }
            // 1.取出在线人数显示的文字
            var onlineStr: String = ""
            
            if anchor.online! >= 10000 {
                onlineStr = "\(Int(anchor.online!/10000))万在线"
            }else {  
                onlineStr = "\(anchor.online!)在线"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
            // 2.昵称的显示
            nickNameLabel.text = anchor.nickname
            // 3.所在城市
            cityBtn.setTitle(anchor.anchor_city, for: .normal)
            // 4.设置封面的图片
            guard let iconUrl = URL(string: anchor.vertical_src!) else {
                return
            }
            iconImageView.kf.setImage(with: iconUrl)
        }
    }
    
}
