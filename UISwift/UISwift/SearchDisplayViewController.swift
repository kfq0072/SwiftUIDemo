//
//  SearchDisplayViewController.swift
//  UISwift
//
//  Created by huangshuimei on 1/10/16.
//  Copyright © 2016 huangshuimei. All rights reserved.
//

import UIKit

class SearchDisplayViewController: UIViewController {

    @IBOutlet var searchDisplay: UISearchDisplayController!
    var ctrls:[String] = ["Lable","Button-初级","Switch-初级","datePick-高级","scrollView-高级","tableView-高级"]
    var ctrlsel:[String] = [];
    var searchText:String!
    let identify = "swiftCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.ctrlsel = self.ctrls
        
        //register tableviewcell
        self.searchDisplay.searchResultsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: identify)

        initSearchBar()
        // Do any additional setup after loading the view.
    }
    
    // init searchbar
    func initSearchBar() {
        self.searchDisplay.searchBar.placeholder = "输入搜索信息"
        self.searchDisplay.searchBar.prompt = "搜索组件名称"
        self.searchDisplay.searchBar.searchBarStyle = UISearchBarStyle.Minimal
        self.searchDisplay.searchBar.showsScopeBar = true
        self.searchDisplay.searchBar.scopeButtonTitles = ["全部","初级","高级"]
        print("\(self.searchDisplay.searchResultsTitle)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - tableviewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView .dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel!.text = self.ctrlsel[indexPath.row]
        print("0000000")
        print(cell.textLabel!.text)
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrlsel.count;
    }
    
    // MARK: - searchDisplayDelegate
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
       self.searchText = searchText.lowercaseString
        print("search")
        print(self.searchText)
        searchCtrls(0)
    }
    
    //分段
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print(selectedScope)
        searchCtrls(selectedScope)
    }
    
    //
    func searchCtrls(scope:Int) {
        if self.searchText == "" {
            self.ctrlsel = self.ctrls
//            self.setEditing(true, animated: true)
            self.searchDisplay.searchBar.resignFirstResponder()
        }else {
            self.ctrlsel = []
            for ctrl in self.ctrls{
                let lc = ctrl.lowercaseString
                if lc.hasPrefix(self.searchText) {
                    if ((scope == 0) || (scope == 1 && lc.hasSuffix("初级")) || (scope == 2 && lc.hasSuffix("高级"))) {
                        self.ctrlsel.append(ctrl)
                    }
                }
            }
        }
        print("searchCtrls")
        print(self.ctrlsel)
        self.searchDisplay.searchResultsTableView.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
