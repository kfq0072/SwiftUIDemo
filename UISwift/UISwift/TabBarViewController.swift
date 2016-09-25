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
    var tabBar:UITabBar!
    var contentView:UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.translucent = false;
        
        tabBar = UITabBar(frame: CGRectMake(0,CGRectGetHeight(self.view.bounds)-49,CGRectGetWidth(self.view.bounds),49))
        var items :[UITabBarItem] = []
        for tab in tabs {
            let tabBarItem = UITabBarItem()
            tabBarItem.title = tab
            items.append(tabBarItem)
        }
        tabBar.setItems(items, animated: true)
        
        tabBar.delegate = self
        self.view.addSubview(tabBar)
        
        contentView = UIView(frame: CGRectMake(0,0,CGRectGetWidth(self.view.bounds),CGRectGetHeight(self.view.bounds)-49))
        self.view.addSubview(contentView)
        let lb1 = UILabel(frame:  CGRectMake(100,200,100,100))
        lb1.tag = 1
        lb1.text = tabs[0]
        contentView.addSubview(lb1)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.navigationBar.translucent = true;
    }
    
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        (contentView.viewWithTag(1) as! UILabel).text = item.title
    }
}
