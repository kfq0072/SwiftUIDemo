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
    var ctrls:[String] = ["Label","Button","Switch","Button","Label1","Button1","Switch1","Button1","Label2","Button2","Switch2","Button2","Label3","Button3","Switch3","Button3","Label4","Button4","Switch4","Button4"]
    var ctrlsel:[String] = [];
    
    override func viewDidLoad() {
        self.mySearchView.delegate = self
        self.mySearchView.placeholder = "please input your select"
        self.mySearchView.searchBarStyle = UISearchBarStyle.default
        self.mySearchView.becomeFirstResponder()
        self.ctrlsel = self.ctrls;
        self.myTableView .register(UITableViewCell.self, forCellReuseIdentifier: "swiftCell")
        self.reGesRecognizer = UITapGestureRecognizer(target: self, action: #selector(SearchViewController.tapEdit(_:)))
        self.view.addGestureRecognizer(self.reGesRecognizer)
    }
    
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identify = "swiftCell"
        let cell:UITableViewCell = tableView .dequeueReusableCell(withIdentifier: identify, for: indexPath)
        cell.textLabel?.text = self.ctrlsel[(indexPath as NSIndexPath).row]
        
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.ctrlsel.count;
    }
    // MARK: - UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            self.ctrlsel = self.ctrls
        }else {
            self.ctrlsel = []
            for ctrl in self.ctrls {
                print("search:\(searchText) ctrl:\(ctrl.lowercased())")
                let searchTextLower = searchText.lowercased()
                let ctrlLower = ctrl.lowercased()
                
                if (ctrlLower.hasPrefix(searchTextLower)) {
                    self.ctrlsel.append(ctrl)
                }
            }
        }
        self.myTableView.reloadData()
    }
    // MARK: - 
    func tapEdit(_ sender:NSObject) {
        self.view.endEditing(true)
    }
}



