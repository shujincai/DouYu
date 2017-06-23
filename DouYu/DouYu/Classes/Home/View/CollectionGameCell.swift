//
//  CollectionGameCell.swift
//  DouYu
//
//  Created by pingtong on 2017/6/23.
//  Copyright © 2017年 PTDriver. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var group: AnchorGroup? {
        didSet {
            titleLabel.text = group?.tag_name
            iconImageView.kf.setImage(with: URL(string: group?.icon_url ?? ""))
        }
    }
    override func awakeFromNib() {
        // MARK:- 定义模型属性
        
        
        super.awakeFromNib()
        // Initialization code
    }

}
