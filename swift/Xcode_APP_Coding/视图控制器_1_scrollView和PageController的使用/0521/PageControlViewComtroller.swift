//
//  PageControlViewComtroller.swift
//  0521
//
//  Created by 祝正杰 on 2017/5/21.
//  Copyright © 2017年 aaa. All rights reserved.
//

import UIKit

//UIScrollViewDelegate  滚动视图的代理
class PageControlViewComtroller: UIViewController ,UIScrollViewDelegate {
    var mScroll = UIScrollView();  // 滚动视图
    var mPagecontrl = UIPageControl();  // 滚动翻页的属性
    var mIsPageControlUse = false // 添加滑动状态
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var mFrame = UIScreen.main.bounds  // 获得屏幕尺寸
        let mWidth = mFrame.size.width     // 宽高
        let mHeight = mFrame.size.height
        mScroll.frame = mFrame  // 为scroll添加区域frame
        mScroll.isPagingEnabled = true // 设置滚动为分页模式
        
        // 有两个视图 设置滚动页面的宽度为 2 倍宽度
        mScroll.contentSize = CGSize(width: mWidth * 2 , height: mHeight)
        
        mScroll.backgroundColor = UIColor.blue
// 设置滚动视图的代理类为当前类 那么就可以在当前类中添加滚动事件的处理方法
        mScroll.delegate = self
        
        let pcHeight:CGFloat = 50.0 // 高度常量 页面控制器对象的高度
        let mRect = CGRect(x: 0, y: mHeight - pcHeight , width:mWidth, height: pcHeight)   //创建一个区域 用于显示 控制器对象
        mPagecontrl.frame = mRect; // 页面控制器 对象的显示区域
        mPagecontrl.numberOfPages = 2; // 控制的页面总数
        mPagecontrl.currentPage = 0; // 控制的当前页编号
        mPagecontrl.backgroundColor = UIColor.gray
        mPagecontrl.addTarget(self, action: #selector(PageControlViewComtroller.mPagecontrolDidChanged(_:)), for: UIControlEvents.valueChanged)
        
      let firstView = FirstSubViewController()  // 创建第一个试图对象
      mFrame.origin.x = 0
      firstView.view.frame = mFrame // 第一个试图对象的显示区域
        
        
      let secondView = SecondSubViewController()
      mFrame.origin.x = mFrame.size.width  // 设置第二个视图控制器的x为屏幕宽度 显示在屏幕之外
      secondView.view.frame = mFrame
      mScroll.addSubview(firstView.view) //把两个视图控制器的根视图添加到ScrollView中
        
      mScroll.addSubview(secondView.view)
        
        self.view.addSubview(mScroll) //把滚动对象 和 页面控制器对象 加到根视图
        self.view.addSubview(mPagecontrl)
    }
    
    
    func mPagecontrolDidChanged(_ sneder: AnyObject) {
           let curpage = (CGFloat)(mPagecontrl.currentPage) // 获得试图控制器当前页码
            var frame = mScroll.frame // 获得滚动视图当前显示区域
        //依据滚动页面 计算下一视图显示的区域
        frame.origin.x = frame.size.width * curpage
        frame.origin.y = 0
        
        mScroll.scrollRectToVisible(frame, animated: true) // 滚动到目标区域
        mIsPageControlUse = true  // 页面切换标志
    }
    
    //滚动视图 滚动事件的代理方法
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(!mIsPageControlUse){  // 如果通过页面控制器切换 则不执行后面的代码
          let pageWidth = scrollView.frame.size.width // 获得滚动视图的宽度
            
            // 根据 滚动视图的宽度 横向位移量计算页面
          let page = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth) + 1
        mPagecontrl.currentPage = Int(page) //设置页面控制器页面为当前计算得到的页码
            
            
        }
    }
   
    // 滚动视图的滚动减速事件的代理方法
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        mIsPageControlUse = false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

