//
//  MyCollectViewController.swift
//  UISwift
//
//  Created by huangshuimei on 16/9/25.
//  Copyright © 2016年 huangshuimei. All rights reserved.
//

import UIKit

class MyCollectViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    var myCollectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //定义collectionView的布局类型，流布局
        let layout = UICollectionViewFlowLayout()
        //设置cell的大小
        layout.itemSize = CGSize(width: SCREEN_WIDTH/2, height: SCREEN_HEIGHT/3)
        //滑动方向 默认方向是垂直
        layout.scrollDirection = .Vertical
        //每个Item之间最小的间距
        layout.minimumInteritemSpacing = 0
        //每行之间最小的间距  
        layout.minimumLineSpacing = 0
        
        myCollectionView = UICollectionView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.backgroundColor = .whiteColor()
        myCollectionView.registerNib(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        self.view.addSubview(myCollectionView)
    }
    
    //返回多少个组
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 2
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:MyCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("myCell", forIndexPath: indexPath) as!MyCollectionViewCell
//        let text = "HI"
        let name = "ball"
//        cell.setupView(text, imageName: name)
        cell.myImageView.image = UIImage(named: name)
        return cell;
    }
    
//    //返回cell 上下左右的间距
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
//        return UIEdgeInsetsMake(5, 10, 5, 10)
//    }
    
    // #MARK: --UICollectionViewDelegate的代理方法
    /**
    Description:当点击某个Item之后的回应
    */
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("(\(indexPath.section),\(indexPath.row))")
    }
}