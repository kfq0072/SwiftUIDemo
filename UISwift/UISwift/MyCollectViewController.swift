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
        layout.itemSize = CGSize(width: SCREEN_WIDTH/2-10, height: SCREEN_HEIGHT/5)
        //滑动方向 默认方向是垂直
        layout.scrollDirection = .vertical
        //每个Item之间最小的间距
        layout.minimumInteritemSpacing = 5
        //每行之间最小的间距  
        layout.minimumLineSpacing = 5
        
        myCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.backgroundColor = UIColor.orange;
        myCollectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        self.view.addSubview(myCollectionView)
    }
    
    //返回多少个组
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as!MyCollectionViewCell
        let text = String("\(indexPath.section)")
        let name = "buttonImage.jpg"
        cell.setupView(text!, imageName: name)
//        cell.myImageView.image = UIImage(named: name)
        return cell;
    }
    
    //返回cell 上下左右的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
    // #MARK: --UICollectionViewDelegate的代理方法
    /**
    Description:当点击某个Item之后的回应
    */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("(\((indexPath as NSIndexPath).section),\((indexPath as NSIndexPath).row))")
    }
}
