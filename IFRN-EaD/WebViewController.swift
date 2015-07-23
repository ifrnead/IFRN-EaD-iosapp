//
//  WebViewController.swift
//  IFRN-EaD
//
//  Created by Allan Garcia on 6/10/15.
//  Copyright (c) 2015 Allan Garcia. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var web: UIWebView! {
        didSet {
            web.delegate = self
        }
    }
    
    @IBAction func reload(sender: UIBarButtonItem) {
        web.reload()
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        let spin = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        let btn = UIBarButtonItem()
        btn.customView = spin
        navigationItem.leftBarButtonItem = btn
        spin.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        navigationItem.leftBarButtonItem = nil
    }
    
    @IBInspectable
    var urlToLoad: String = "http://ead.ifrn.edu.br/"
    
    @IBInspectable
    var titleToShow: String = "IFRN-EaD" {
        didSet {
            navigationItem.title = titleToShow
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        web.loadRequest(NSURLRequest(URL: NSURL(string: urlToLoad)!))
        
    }

}
