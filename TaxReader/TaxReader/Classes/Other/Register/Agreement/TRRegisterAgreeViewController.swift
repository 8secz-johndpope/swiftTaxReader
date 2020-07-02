//
//  TRRegisterAgreeViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/9.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import WebKit
 
class TRRegisterAgreeViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {
 
    var webView: WKWebView!
    //你的H5网址
    // var urls: String = "http://210.12.84.109/Home/Agreement"
    var urls: String = "\(appIp)/Home/Agreement"
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let screen = UIScreen.main.bounds
        
        // MARK: --添加WKWebView
        self.webView = WKWebView(frame: CGRect(x: 0, y: 0, width: screen.size.width, height: screen.size.height))
        // MARK: --添加H5交互.  IosPay 与下面接收js调用方法对应
        // H5在js事件中的代码是 window.webkit.messageHandlers.IosPay.postMessage(参数)
        webView.configuration.userContentController.add(self, name: "IosPay")
       
        
        self.view.addSubview(self.webView)
        
        let url = URL(string: urls)
        let request = URLRequest(url: url!)
        self.webView.load(request)
        self.webView.navigationDelegate = self
    }
    
    // MARK: --实现WKNavigationDelegate委托协议
    //开始加载时调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        NSLog("开始加载")
        print("开始加载：" + (webView.url?.absoluteString ?? "123"))
    
    }
    
    //当内容开始返回时调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        NSLog("内容开始返回")
        print("内容开始返回：" + (webView.url?.absoluteString ?? urls))
    }
    
    //加载完成之后调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        NSLog("加载完成")
        print("加载完成：" + (webView.url?.absoluteString ?? urls))
    }
    
    //加载失败时调用
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        NSLog("加载失败 error :  ", error.localizedDescription)
        print("加载失败 error :  " + (webView.url?.absoluteString ?? urls))
    }
    
    //接收js调用方法
    func userContentController(_ userContentController: WKUserContentController,didReceive message: WKScriptMessage) {
        print("--------"+"\(message.name)")
        switch message.name {
        case "IosPay":
            //多个参数
            let dcit2:[String : NSObject] = message.body as! [String : NSObject]
            print(dcit2)
            //单个参数
            let content:String = message.body as! String
            print(content)
        default: break
        }
    }
}
 
