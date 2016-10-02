//
//  MyTableViewController.swift
//  UISwift
//
//  Created by huangshuimei on 2016/10/2.
//  Copyright © 2016年 huangshuimei. All rights reserved.
//

import UIKit

class MyTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var myTableView:UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
//    func initTableViewHeadView() -> UIView {
//        var <#name#> = <#value#>
//        
//    }
    
    func initTableView() {
        if myTableView == nil {
            myTableView = UITableView(frame: CGRect(x:0,y:0,width: SCREEN_WIDTH,height:SCREEN_HEIGHT), style: .plain)
            myTableView.dataSource = self
            myTableView.delegate = self
            self.view.addSubview(myTableView)
            
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        
        return cell
    }
    
    

}
