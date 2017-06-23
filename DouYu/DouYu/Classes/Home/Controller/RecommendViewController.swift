//
//  RecommendViewController.swift
//  DouYu
//
//  Created by pingtong on 2017/6/20.
//  Copyright © 2017年 PTDriver. All rights reserved.
//

import UIKit
import SDCycleScrollView

fileprivate let KNormalCellID = "KNormalCellID"
fileprivate let KHeaderViewID = "KHeaderViewID"
fileprivate let KPrettyCellID = "CollectionPrettyCell"

fileprivate let KCycleViewH = KScreenW * 3 / 8

fileprivate let KItemMargin: CGFloat = 10.0
fileprivate let KItemW = (KScreenW - 3*KItemMargin)/2
fileprivate let KNormalItemH = KItemW * 3/4
fileprivate let KPrettyItemH = KItemW * 4/3
fileprivate let KHeaderViewH: CGFloat = 50
fileprivate let KGameViewH: CGFloat = 90
class RecommendViewController: UIViewController {
    //MARK:- 懒加载属性
    fileprivate lazy var recommendVM: RecommendViewModel = RecommendViewModel()
    fileprivate lazy var cycleScrollView: SDCycleScrollView = {
        let cycleScrollView = SDCycleScrollView(frame: CGRect(x: 0, y: -(KCycleViewH+KGameViewH), width: KScreenW, height: KCycleViewH))
        cycleScrollView.currentPageDotColor = UIColor.orange
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
        return cycleScrollView
    }()
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
    fileprivate lazy var gameView: RecommendGameView = {
        let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -KGameViewH, width: KScreenW, height: KGameViewH)
        return gameView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置UI界面
        setupUI()
        //发送网络请求
        loadData()
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
        // 2.将cycleScrollVIew添加到UICollectionView
        collectionView.addSubview(cycleScrollView)
        // 3.将gameView添加collectionView中
        collectionView.addSubview(gameView)
        // 3.设置collectionView的内边距
        collectionView.contentInset = UIEdgeInsets(top: KCycleViewH + KGameViewH, left: 0, bottom: 0, right: 0)
        
    }
}
// MARK:- 遵守UICollectionView的数据源协议
extension RecommendViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if recommendVM.cycleGroup == nil {
            return 0
        }
        return (recommendVM.cycleGroup?.data?.count)! + 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return (recommendVM.bigDataGroup?.data?.count)!
        }else if (section == 1) {
            return (recommendVM.prettyGroup?.data?.count)!
        }else {
            return (recommendVM.cycleGroup?.data![section-2].room_list?.count)!
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KPrettyCellID, for: indexPath) as? CollectionPrettyCell
            cell?.anchor = recommendVM.prettyGroup?.data?[indexPath.item]
            return cell!
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KNormalCellID, for: indexPath) as? CollectionNormalCell
            if indexPath.section == 0 {
                cell?.anchorHot = recommendVM.bigDataGroup?.data?[indexPath.item]
            }else {
                cell?.anchor = recommendVM.cycleGroup?.data?[indexPath.section-2].room_list?[indexPath.item]
            }
            return cell!
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: KHeaderViewID, for: indexPath) as! CollectionHeaderView
        if indexPath.section == 0 {
            headerView.titleLbael.text = "热门"
            headerView.iconImageView.image = #imageLiteral(resourceName: "home_header_hot")
        } else if (indexPath.section == 1) {
            headerView.titleLbael.text = "颜值"
            headerView.iconImageView.image = #imageLiteral(resourceName: "home_header_phone")
        }else {
            headerView.titleLbael.text = recommendVM.cycleGroup?.data?[indexPath.section-2].tag_name
            headerView.iconImageView.image = #imageLiteral(resourceName: "home_header_normal")
        }
        
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
// MARK:- 请求数据
extension RecommendViewController {
    fileprivate func loadData() {
        //请推荐数据
        recommendVM.requsetData {
            // 1. 显示推荐数据
            self.collectionView.reloadData()
            // 2.将数据传递给GameView
            self.gameView.groups = self.recommendVM.cycleGroup
        }
        //请求轮播数据
        recommendVM.requestCycleData { (cycle) in
            var imageGroup = [String]()
            var titleGroup = [String]()
            for data in cycle.data! {
                imageGroup.append(data.pic_url!)
                titleGroup.append(data.title!)
            }
            self.cycleScrollView.imageURLStringsGroup = imageGroup
            self.cycleScrollView.titlesGroup = titleGroup
        }
    }
}
