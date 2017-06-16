//
//  HomeViewController.swift
//  DouYu
//
//  Created by pingtong on 2017/6/16.
//  Copyright © 2017年 PTDriver. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置UI界面
        setupUI()
    }
}

// MARK: -设置UI界面
extension HomeViewController {
    func setupUI() {
        //设置导航栏
        setNavigationBar()
    }
    private func setNavigationBar() {
        //设置左侧Item
        let btn = UIButton()
        btn.setImage(UIImage(named: "logo"), for: .normal)
        btn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        //设置右侧Item
        let size = CGSize(width: 40, height: 40)
        
        let historyItem = UIBarButtonItem(imageName: "viewHistoryIcon", hightImageName: "viewHistoryIconHL", size: size)
        
        let searchItem = UIBarButtonItem(imageName: "searchBtnIcon", hightImageName: "searchBtnIconHL", size: size)

        let qrcodeItem = UIBarButtonItem(imageName:"scanIcon" , hightImageName: "scanIconHL", size: size)
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
        
    }
}
