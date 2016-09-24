//
//  SearchViewController.swift
//  UISwift
//
//  Created by huangshuimei on 1/6/16.
//  Copyright © 2016 huangshuimei. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var mySearchView: UISearchBar!
    
    var reGesRecognizer:UIGestureRecognizer!
    var ctrls:[String] = ["Lable","Button","Switch","Button2"]
    var ctrlsel:[String] = [];
    
//    var ctrls:Array<String> = ["Lable","Button","Switch","Button2"]
//    var ctrlsel:[String] = [];
    
    override func viewDidLoad() {
        self.mySearchView.delegate = self
        self.mySearchView.placeholder = "please input your select"
        self.mySearchView.searchBarStyle = UISearchBarStyle.Default
        self.ctrlsel = self.ctrls;
        self.myTableView .registerClass(UITableViewCell.self, forCellReuseIdentifier: "swiftCell")
        self.reGesRecognizer = UITapGestureRecognizer(target: self, action: Selector("tapEdit:"))
        self.view.addGestureRecognizer(self.reGesRecognizer)
    }
    
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identify = "swiftCell"
        let cell:UITableViewCell = tableView .dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text = self.ctrlsel[indexPath.row]
        
        
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.ctrlsel.count;
    }
    // MARK: - UISearchBarDelegate
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            self.ctrlsel = self.ctrls
        }else {
            self.ctrlsel = []
            for ctrl in self.ctrls {
                print(ctrl.lowercaseString)
                print(searchText)
                print(self.ctrlsel)
//                if ((ctrl.lowercaseString.hasPrefix(searchText)) || (searchText.lowercaseString.hasPrefix(ctrl))) {
                    self.ctrlsel.append(searchText)
//                }
            }
        }
        self.myTableView.reloadData()
    }
    // MARK: - 
    func tapEdit(sender:NSObject) {
        self.view.endEditing(true)
    }
}



