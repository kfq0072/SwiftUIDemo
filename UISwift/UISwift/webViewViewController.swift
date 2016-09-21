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
    
    @IBAction func backBtn(sender: AnyObject) {
        
        webView.goBack()
    }
    
    @IBAction func refreshBtn(sender: AnyObject) {
        webView.reload()
    }
    @IBAction func forwardBtn(sender: AnyObject) {
        webView.goForward()
    }
    
    @IBAction func cancleBtn(sender: AnyObject) {
        webView.stopLoading()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        activity.hidden = true
        searchBar.delegate = self
        searchBar.barTintColor = UIColor.whiteColor()
        webView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    func loadUrl(url:String) {
        let urlObj = NSURL(string: url)
        let request = NSURLRequest(URL: urlObj!)
        webView.loadRequest(request)
        
    }
    //MARK:- UISearchBarDelegate
    func webViewDidStartLoad(webView: UIWebView) {
        activity.hidden = false
        activity.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        activity.stopAnimating()
        activity.hidden = true
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
       
            activity.stopAnimating()
            activity.hidden = true
            let alertView = UIAlertView()
            alertView.title = "warming"
            alertView.message = error!.localizedDescription
            alertView.addButtonWithTitle("Try again")
            alertView.show()
        
    }
    
    //MARK:- UISearchBarDelegate
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        urlStr = urlHead + searchBar.text! + urlTail
        loadUrl(urlStr)
    }

}
