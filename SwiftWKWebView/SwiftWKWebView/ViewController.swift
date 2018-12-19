//
//  ViewController.swift
//  SwiftWKWebView
//
//  Created by 木村和貴 on 2018/12/18.
//  Copyright © 2018 kazuki kimura. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    
    var urlString:String = "https://www.youtube.com/watch?v=-wPMLulAfdk"
    
    var indicator:UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setIndicator()
        
        //urlがない場合動かないようにする
        guard let url = URL(string: urlString) else {
            return
        }
        
        let req = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 100)
        
        self.webView.load(req)
    }
    
    @IBAction func back(_ sender: Any) {
        
        webView.goBack()
    }
    
    @IBAction func next(_ sender: Any) {
        
        webView.goForward()
    }
    
    @IBAction func reflesh(_ sender: Any) {
        
        webView.reload()
    }
    
    func setIndicator(){
        
        //インディケーターの初期化を行う
        
        indicator = UIActivityIndicatorView()
        
        //サイズ決定
        indicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        indicator.center = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
        indicator.hidesWhenStopped = true
        indicator.style = .gray
        
        //WebViewにaddSubview
        self.webView.addSubview(indicator)
        
    }
    
    //通信が開始されたタイミングで呼ばれる didStartProvisionalNavigation
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        //インディケーターを回したい
        indicator.startAnimating()
    }
    
    //通信が完了したタイミングで呼ばれる didFinish
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        indicator.stopAnimating()
    }
}

