//
//  webViewViewController.swift
//  UISwift
//
//  Created by huangshuimei on 15/8/16.
//  Copyright (c) 2015年 huangshuimei. All rights reserved.
//

import UIKit

class webViewViewController: UIViewController,UISearchBarDelegate,UIWebViewDelegate {
    
    var urlHead:String = "https://www."
    var urlTail:String = ".com"
    var urlStr:String!
    

    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func backBtn(_ sender: AnyObject) {
        
        webView.goBack()
    }
    
    @IBAction func refreshBtn(_ sender: AnyObject) {
        webView.reload()
    }
    @IBAction func forwardBtn(_ sender: AnyObject) {
        webView.goForward()
    }
    
    @IBAction func cancleBtn(_ sender: AnyObject) {
        webView.stopLoading()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        activity.isHidden = true
        searchBar.delegate = self
        searchBar.barTintColor = UIColor.white
        webView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    func loadUrl(_ url:String) {
        let urlObj = URL(string: url)
        let request = URLRequest(url: urlObj!)
        webView.loadRequest(request)
        
    }
    //MARK:- UISearchBarDelegate
    func webViewDidStartLoad(_ webView: UIWebView) {
        activity.isHidden = false
        activity.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activity.stopAnimating()
        activity.isHidden = true
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
       
            activity.stopAnimating()
            activity.isHidden = true
            let alertView = UIAlertView()
            alertView.title = "warming"
            alertView.message = error.localizedDescription
            alertView.addButton(withTitle: "Try again")
            alertView.show()
        
    }
    
    //MARK:- UISearchBarDelegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        urlStr = urlHead + searchBar.text! + urlTail
        loadUrl(urlStr)
    }

}
