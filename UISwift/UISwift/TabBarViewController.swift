//
//  TabBarViewController.swift
//  UISwift
//
//  Created by huangshuimei on 16/9/25.
//  Copyright © 2016年 huangshuimei. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController,UITabBarDelegate {
    var tabs = ["公开课","全栈课","设置"]
    let tabImages = ["tuan","wang","me"];
    var tabBar:UITabBar!
    var contentView:UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar = UITabBar(frame: CGRect(x: 0,y: self.view.bounds.height-49,width: self.view.bounds.width,height: 49))
        var items :[UITabBarItem] = []
        for index in 0...2 {
            let tabBarItem = UITabBarItem()
            tabBarItem.title = tabs[index]
            
            var tabBarItemImage = UIImage(named: tabImages[index])
            tabBarItemImage = tabBarItemImage?.withRenderingMode(.alwaysOriginal);
            tabBarItem.image = tabBarItemImage
            
            var tabBarItemSelectImage =  UIImage(named: "\(tabImages[index])_select")
            tabBarItemSelectImage = tabBarItemSelectImage?.withRenderingMode(.alwaysOriginal)
            tabBarItem.selectedImage = tabBarItemSelectImage
            items.append(tabBarItem)
        }
        tabBar.setItems(items, animated: true)
        
        tabBar.delegate = self
        self.view.addSubview(tabBar)
        
        contentView = UIView(frame: CGRect(x: 0,y: 0,width: self.view.bounds.width,height: self.view.bounds.height-49))
        self.view.addSubview(contentView)
        let lb1 = UILabel(frame:  CGRect(x: 100,y: 200,width: 100,height: 100))
        lb1.tag = 1
        lb1.text = tabs[0]
        contentView.addSubview(lb1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.navigationBar.isTranslucent = true;
    }
    
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        (contentView.viewWithTag(1) as! UILabel).text = item.title
    }
}
