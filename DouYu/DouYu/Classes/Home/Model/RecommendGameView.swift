//
//  RecommendGameView.swift
//  DouYu
//
//  Created by pingtong on 2017/6/23.
//  Copyright © 2017年 PTDriver. All rights reserved.
//

import UIKit
import ObjectMapper

fileprivate let KGameCellID = "KGameCellID"

class RecommendGameView: UIView {
    // MARK:- 定义数据的属性
    var groups: AnchorModel? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 让控件不随着父控件的拉伸而拉伸
        autoresizingMask = UIViewAutoresizing()
        // 注册cell
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: KGameCellID)
    }
}
// MARK:- 提供快速创建类方法
extension RecommendGameView {
    class func recommendGameView() -> RecommendGameView {
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
    }
}
// MARK:- 遵守UICollectionView的数据协议
extension RecommendGameView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.data?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let group = groups?.data?[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KGameCellID, for: indexPath) as! CollectionGameCell
        cell.group = group
        return cell
    }
}
