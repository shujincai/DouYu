//
//  HomeViewController.swift
//  DouYu
//
//  Created by pingtong on 2017/6/16.
//  Copyright © 2017年 PTDriver. All rights reserved.
//

import UIKit

private let KTitleViewH: CGFloat = 40

class HomeViewController: UIViewController {
    //MARK: -懒加载属性
    lazy var pageTitleView: PageTitleView = {
        let titleFrame = CGRect(x: 0, y: KStatusBarH+KNavigationBarH, width: KScreenW, height: KTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
    }()
    lazy var pageContentView : PageContentView = {[weak self] in
        //确定内容的frame
        let contentH = KScreenH - KStatusBarH - KNavigationBarH - KTitleViewH - KTabBarH
        let contentFrame = CGRect(x: 0, y: KStatusBarH + KNavigationBarH + KTitleViewH, width: KScreenW, height: contentH)
        //确定所有的子控制器
        var childVcs = [UIViewController]()
        childVcs.append(RecommendViewController())
        for _ in 0..<3 {
            let vc  = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        contentView.delegate = self
        return contentView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置UI界面
        setupUI()
    }
}

// MARK: -设置UI界面
extension HomeViewController {
    func setupUI() {
        //不需要调整UIscrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        //设置导航栏
        setNavigationBar()
        view.addSubview(pageTitleView)
        //添加ContentView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.purple
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
//MARK:- 遵守PageTitleViewDelegate协议
extension HomeViewController: PageTitleViewDelegate {
    func pageTitleView(titleView: PageTitleView, selectdIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}
//MARK:- 遵守PageContentViewDelegate协议
extension HomeViewController: PageContentViewDelegate {
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
