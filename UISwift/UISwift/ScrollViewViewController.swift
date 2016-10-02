//
//  ScrollViewViewController.swift
//  UISwift
//
//  Created by huangshuimei on 16/9/24.
//  Copyright © 2016年 huangshuimei. All rights reserved.
//

import UIKit

class ScrollViewViewController: UIViewController {
    var timer:Timer!
    var kk:Int = 0
    var myScrollView:UIScrollView!
    var pageWidth:CGFloat!
    var pageHeight:CGFloat!
    var numOfPage:Int = 3;
    
    func displayType()->Bool{
        return false
    }
    
    func screenBounds()->CGRect{
        return UIScreen.main.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false;
        /**
        UIScrollView
        **/
        if displayType() {
            let scV = UIScrollView(frame: self.view.frame)
            let imageView = UIImageView(image: UIImage(named: "1@2x.png"))
            scV.addSubview(imageView)
            scV.contentSize = imageView.bounds.size
            self.view.addSubview(scV)
            
        }else{
            let tempNumOfPage : CGFloat = (CGFloat)(numOfPage)
            pageWidth = screenBounds().size.width
            pageHeight = screenBounds().size.height-64;
            
            let scrollView = UIScrollView()
            scrollView.frame = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
            scrollView.contentSize = CGSize(width: pageWidth*tempNumOfPage, height: pageHeight)
            scrollView.isPagingEnabled = true
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.showsVerticalScrollIndicator = false
            scrollView.scrollsToTop = false
            for index in 0...2 {
                print(index, terminator: "") //print "01234"
                let pageVC = pageViewController(number: (index+1))
                let indexFloat :CGFloat = CGFloat(index)
                pageVC.view.frame = CGRect(x: pageWidth*indexFloat, y: 0.0, width: pageWidth, height: pageHeight)
                scrollView.addSubview(pageVC.view)
            }
            myScrollView = scrollView
            self.view.addSubview(myScrollView)
            
            initTimer()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        timer.fireDate = NSDate.distantFuture
        timer = nil
        self.navigationController?.navigationBar.isTranslucent = true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - NSTime init
    func initTimer(){
        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector:#selector(ScrollViewViewController.timerFunction), userInfo: nil, repeats: true)
        }
    }
    
    // MARK: - timerFunction
    func timerFunction(){
        kk += 1
        print("\(kk)")
        if (kk < numOfPage) {
            let num:CGFloat = (CGFloat)(kk)
            let offset = CGPoint(x: pageWidth * num, y: 0)
            myScrollView.setContentOffset(offset, animated: true)
        }else {
            //循环播放
            kk = 0
            myScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
            
            //倒叙播放
            
        }
    }
}

class pageViewController: UIViewController {
    var number : Int!
    let colorMap = [
        1:UIColor.orange,
        2:UIColor.red,
        3:UIColor.purple
    ]
    init(number initNumber:Int) {
        self.number = initNumber
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        numberLabel.text = "第"+"\(number)"+"页"
        numberLabel.center = self.view.center
        numberLabel.font = UIFont.systemFont(ofSize: 23)
        self.view.addSubview(numberLabel)
        self.view.backgroundColor = colorMap[number]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
