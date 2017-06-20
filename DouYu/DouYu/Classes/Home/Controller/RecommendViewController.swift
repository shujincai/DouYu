//
//  RecommendViewController.swift
//  DouYu
//
//  Created by pingtong on 2017/6/20.
//  Copyright © 2017年 PTDriver. All rights reserved.
//

import UIKit

fileprivate let KNormalCellID = "KNormalCellID"
fileprivate let KHeaderViewID = "KHeaderViewID"
fileprivate let KPrettyCellID = "CollectionPrettyCell"

fileprivate let KItemMargin: CGFloat = 10.0
fileprivate let KItemW = (KScreenW - 3*KItemMargin)/2
fileprivate let KNormalItemH = KItemW * 3/4
fileprivate let KPrettyItemH = KItemW * 4/3
fileprivate let KHeaderViewH: CGFloat = 50
class RecommendViewController: UIViewController {
    //MARK:- 懒加载属性
    fileprivate lazy var collectionView: UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: KItemW, height: KNormalItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = KItemMargin
        layout.headerReferenceSize = CGSize(width: KScreenW, height: KHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        //创建UICollectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: KNormalCellID)
        collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: KPrettyCellID)
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: KHeaderViewID)
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
// MARK:- 设置ui界面
extension RecommendViewController {
    fileprivate func setupUI() {
        // 1.将UICollectionView添加到控制器的View中
        view.addSubview(collectionView)
    }
}
// MARK:- 遵守UICollectionView的数据源协议
extension RecommendViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }else {
            return 4
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: UICollectionViewCell!
        if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: KPrettyCellID, for: indexPath)
        }else{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: KNormalCellID, for: indexPath)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: KHeaderViewID, for: indexPath)
        return headerView
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: KItemW, height: KPrettyItemH)
        }else{
            return CGSize(width: KItemW, height: KNormalItemH)
        }
    }
}
