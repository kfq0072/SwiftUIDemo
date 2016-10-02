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
        let path = Bundle.main.path(forResource: "UIname.plist", ofType:nil)
        print(path)
        let dic = NSMutableDictionary(contentsOfFile: path!)
        print(dic)

        self.uiNameArray = ["base","datePick","webView","searchVC",
            "SearchDisplay","scrollView","coreMotion","tabBar",
            "tabBarController","collectView","tableView"]

        self.mainTableView!.register(UITableViewCell.self, forCellReuseIdentifier: "swiftCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.uiNameArray!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identify="swiftCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
        
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = self.uiNameArray![(indexPath as NSIndexPath).row]
//        cell.backgroundColor = UIColor.yellowColor()
//        let imageName = NSString(format: "%ld.jpg", indexPath.row)
//        cell.imageView?.image = UIImage(named: imageName as String)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        var baseVC:UIViewController?
        var baseVCName:String!
        switch (indexPath as NSIndexPath).row {
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
        case 5:
            baseVCName = "scrollViewVC"
        case 6:
            baseVCName = "coreMotionVC"
        case 7:
            baseVCName = "tabBarVC"
        case 8:
            baseVCName = "tabBarController"
        case 9:
            baseVCName = "collectVC"
        case 10:
            baseVCName = "tableViewVC"
        default:
             baseVCName = "baseVC"
        }
        baseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: baseVCName)
        
        self.navigationController?.pushViewController(baseVC!, animated: true)
        
        
    }

}
