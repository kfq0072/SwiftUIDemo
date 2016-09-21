//
//  MainViewController.swift
//  UISwift
//
//  Created by huangshuimei on 15/8/1.
//  Copyright (c) 2015年 huangshuimei. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
 
    
    @IBOutlet weak var mainTableView: UITableView!
    
    var uiNameArray:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView!.delegate = self
        mainTableView!.dataSource = self
        
        //初始化数据，这一次数据，我们放在属性列表文件里
        let path = NSBundle.mainBundle().pathForResource("UIname.plist", ofType:nil)
        print(path)
        let dic = NSMutableDictionary(contentsOfFile: path!)
        print(dic)

        self.uiNameArray = ["base","datePick","webView","searchVC","SearchDisplay"]

        self.mainTableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "swiftCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65.0
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.uiNameArray!.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identify="swiftCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath)
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text = self.uiNameArray![indexPath.row]
//        cell.backgroundColor = UIColor.yellowColor()
//        let imageName = NSString(format: "%ld.jpg", indexPath.row)
//        cell.imageView?.image = UIImage(named: imageName as String)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView .deselectRowAtIndexPath(indexPath, animated: true)
        var baseVC:UIViewController?
        var baseVCName:String!
        switch indexPath.row {
        case 0:
             baseVCName = "baseVC"
           
        case 1:
             baseVCName = "datePick"
        case 2:
             baseVCName = "webViewVC"
        case 3:
            baseVCName = "searchVC"
        case 4:
            baseVCName = "SearchDisplay"
        default:
             baseVCName = "baseVC"
        }
        baseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(baseVCName)
        
        self.navigationController?.pushViewController(baseVC!, animated: true)
        
        
    }

}
