//
//  TRConnectUSViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import WebKit
 
class TRConnectUSViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {
    
    var urls: String = "\(appIp)/Home/about"
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "联系我们"
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return view
    }()
    
    lazy var webView: WKWebView = {
        let view = WKWebView.init(frame: .zero)
        view.configuration.userContentController.add(self, name: "IosPay")
        
        let url = URL(string: urls)
        let request = URLRequest(url: url!)
        view.load(request)
        view.navigationDelegate = self
        
        return view
    }()
 
//    var webView: WKWebView!
//    //你的H5网址
//    // http://210.12.84.109/Home/Agreement
//    // http://210.12.84.109/home/about
//    var urls: String = "\(appIp)/Home/about"
    
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.webView)
        self.webView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
//        // Do any additional setup after loading the view.
//        let screen = UIScreen.main.bounds
//
//        // MARK: --添加WKWebView
//        self.webView = WKWebView(frame: CGRect(x: 0, y: 0, width: screen.size.width, height: screen.size.height))
//        // MARK: --添加H5交互.  IosPay 与下面接收js调用方法对应
//        // H5在js事件中的代码是 window.webkit.messageHandlers.IosPay.postMessage(参数)
//        webView.configuration.userContentController.add(self, name: "IosPay")
//
//
//        self.view.addSubview(self.webView)
//
//        let url = URL(string: urls)
//        let request = URLRequest(url: url!)
//        self.webView.load(request)
//        self.webView.navigationDelegate = self
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
 
