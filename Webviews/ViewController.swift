//
//  ViewController.swift
//  Webviews
//
//  Created by Bono Kim on 11/16/15.
//  Copyright © 2015 Engene. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.webView.delegate = self
        
        self.backButton.enabled = false
        self.forwardButton.enabled = false
        
        if let url = NSURL(string: "http://www.oreilly.com") {
            
            let request = NSURLRequest(URL: url)
            self.webView.loadRequest(request)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goBack(sender: AnyObject) {
        self.webView.goBack()
    }
    
    @IBAction func goForward(sender: AnyObject) {
        self.webView.goForward()
    }
    
    @IBAction func refresh(sender: AnyObject) {
        self.webView.reload()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.backButton.enabled = self.webView.canGoBack
        self.forwardButton.enabled = self.webView.canGoForward
        
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == UIWebViewNavigationType.LinkClicked {
            UIApplication.sharedApplication().openURL(request.URL!)
            return false
            
        }
        return true
    }
    
    @IBAction func runJS(sender: AnyObject) {
        self.webView.stringByEvaluatingJavaScriptFromString("alert('Hello')")
    }
    

}

