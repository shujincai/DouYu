//
//  PageTitleView.swift
//  DouYu
//
//  Created by pingtong on 2017/6/19.
//  Copyright © 2017年 PTDriver. All rights reserved.
//

import UIKit
protocol PageTitleViewDelegate {
    func pageTitleView(titleView: PageTitleView,selectdIndex index: Int)
}
//定义常量
let KScrollLineH: CGFloat = 2.0
let KNormalColor:(CGFloat,CGFloat,CGFloat) = (85,85,85)
let KSelectColor:(CGFloat,CGFloat,CGFloat) = (255,128,0)



class PageTitleView: UIView {
    var titles : [String]
    var currentIndex: Int = 0
    var delegate: PageTitleViewDelegate?
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    lazy var scrollLine: UIView = {
        let scrollLine  = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    lazy var titleLabels: [UILabel] = [UILabel]()
    // MARK:- 自定义构造函数
    init(frame: CGRect,titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK:- 设置UI界面
extension PageTitleView {
    func setupUI() {
        addSubview(scrollView)
        scrollView.frame = bounds
        //添加title对应的label
        setupTitleLabels()
        //设置底线和滚动的滑块
        setupBottomLineAndScrollLine()
    }
    func setupTitleLabels() {
        
        let labelW: CGFloat = frame.width/CGFloat(titles.count)
        let labelH: CGFloat = frame.height - KScrollLineH
        let labelY: CGFloat = 0
        
        for (index,title) in titles.enumerated() {
            //创建UILabel
            let label = UILabel()
            //设置Label的属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor(r: KNormalColor.0, g: KNormalColor.1, b: KNormalColor.2)
            label.textAlignment = .center
            //设置label的frame
            
            let labelX: CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            scrollView.addSubview(label)
            titleLabels.append(label)
            //给label添加手势
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action:#selector(self.titleLabelClick(tapGes:)))
            label.addGestureRecognizer(tapGes)
        }
    }
    func setupBottomLineAndScrollLine() {
        //添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH: CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        //添加scrollLIne
        //获取第一个label
        guard let firstLabel = titleLabels.first else {return}
        firstLabel.textColor = UIColor(r: KSelectColor.0, g: KSelectColor.1, b: KSelectColor.2)
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - KScrollLineH, width: firstLabel.frame.width, height: KScrollLineH)
        
    }
}
// MARK:- 监听label的点击
extension PageTitleView {
    @objc func titleLabelClick(tapGes: UITapGestureRecognizer){
    //获取当前label的下标值
        guard let currentLabel = tapGes.view as? UILabel else {return}
        let oldLabel = titleLabels[currentIndex]
        //保存最新的label的下标值
        currentIndex = currentLabel.tag
        //切换文字的颜色
        currentLabel.textColor = UIColor(r: KSelectColor.0, g: KSelectColor.1, b: KSelectColor.2)
        oldLabel.textColor = UIColor(r: KNormalColor.0, g: KNormalColor.1, b: KNormalColor.2)
        //滚动条位置发生变化
        let scrollLineX = CGFloat(currentLabel.tag) * scrollLine.frame.width
        UIView.animate(withDuration: 0.15) { 
            self.scrollLine.frame.origin.x = scrollLineX
        }
        //通知代理
        delegate?.pageTitleView(titleView: self, selectdIndex: currentIndex)
        
    }
}
extension PageTitleView {
    func setTitleWithProgress(progress: CGFloat,sourceIndex: Int,targetIndex: Int) {
        let sourceLabel = titleLabels[sourceIndex]
        let targetLabel = titleLabels[targetIndex]
       //处理滑块的逻辑
        let moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * progress
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        //颜色的渐变
        //取出变化的范围
        let colorDelta = (KSelectColor.0 - KNormalColor.0,KSelectColor.1-KNormalColor.1,KSelectColor.2-KNormalColor.2)
        //
        sourceLabel.textColor = UIColor(r: KSelectColor.0 - colorDelta.0*progress, g: KSelectColor.1 - colorDelta.1*progress, b: KSelectColor.2 - colorDelta.2*progress)
        targetLabel.textColor = UIColor(r: KNormalColor.0 + colorDelta.0 * progress, g: KNormalColor.1 + colorDelta.1 * progress, b: KNormalColor.2 + colorDelta.2 * progress)
        currentIndex = targetIndex
    }
}
