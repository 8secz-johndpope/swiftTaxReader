//
//  TRPrefixPhoneViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/21.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON

protocol TRPrefixPhoneVCDelegate: NSObjectProtocol {
    func backPrefixCodeEnDe(code: String, en: String)
}

class TRPrefixPhoneViewController: UIViewController {
    
    weak var delegate: TRPrefixPhoneVCDelegate?
    var resultArr: [NSDictionary] = [NSDictionary]()//本地数组
    
    /// 当前选中的行
    var selectIndex: IndexPath?
    
    private let cellID = "TRPrefixPhoneTableViewCell"
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.register(UINib.init(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        
        return tableView
    }()
    
    func setupLayout() {
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupLocalData()
    }
    
    func setupLocalData() {
        let imagePath: String = Bundle.main.path(forResource: "phoneAreaCode", ofType: "json")!
        var string : String = String()
        do {
            let string1: String  = try String.init(contentsOfFile: imagePath, encoding: String.Encoding.utf8)
            string = string1
        }catch { }
        
        let  resData : Data = string.data(using: String.Encoding.utf8)!
        do {
            let resultArr1  = try JSONSerialization.jsonObject(with: resData as Data, options: .mutableLeaves)
            resultArr = resultArr1 as! [NSDictionary]
        }catch { }
    }
}

extension TRPrefixPhoneViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: UITableViewDataSource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArr.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68.0
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 42.0
    }
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dict: Dictionary = resultArr[indexPath.row] as! Dictionary<String, String>
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TRPrefixPhoneTableViewCell
        cell.trNumberLabel.text = dict["code"]
        cell.trContentLabel.text = dict["cn"]
        
        // 单选操作
        if selectIndex == indexPath {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let dict: Dictionary = resultArr[indexPath.row] as! Dictionary<String, String>
        
        if selectIndex == nil {
            // 记录当前选中的位置索引
            selectIndex = indexPath
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
        } else {
            // 之前选中的取消选择
            let celled = tableView.cellForRow(at: selectIndex!)
            celled?.accessoryType = .none
            
            // 记录当前选中的位置索引
            selectIndex = indexPath
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
        }
        
        
        if delegate != nil && ((self.delegate?.responds(to: Selector.init(("backPrefixCodeEnDe")))) != nil) {
            self.delegate?.backPrefixCodeEnDe(code: dict["code"] ?? "", en: dict["en"] ?? "")
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
}
