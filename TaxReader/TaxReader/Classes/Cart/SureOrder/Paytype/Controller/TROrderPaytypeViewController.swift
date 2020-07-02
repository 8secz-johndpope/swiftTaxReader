//
//  TROrderPaytypeViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

import HandyJSON
import SwiftyJSON

protocol TROrderPaytypeVCDelegate: NSObjectProtocol {
    func backPrefixCodeEnDe(code: String, en: String)
}

typealias TROrderPaytypeViewControllerBlock = (_ userInvoiceID: String) ->Void

class TROrderPaytypeViewController: UIViewController {
    
    var payModelSelectedItem: String? = "0"
    
    var presentBackCommitBlock: TROrderPaytypeViewControllerBlock?
    
    let trImageNameArray: [String] = ["LX支付宝支付", "LX微信支付"]
    let trTitleTextArray: [String] = ["支付宝支付", "微信支付"]
    
    weak var delegate: TROrderPaytypeVCDelegate?
    var resultArr: [NSDictionary] = [NSDictionary]()//本地数组
    
    /// 当前选中的行
    var selectIndex: IndexPath?
    
    private let TRPayTypeHeaderViewID = "TRPayTypeHeaderView"
    private let cellID = "TRPayTypeTableViewCell"
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(TRPayTypeHeaderView.self, forHeaderFooterViewReuseIdentifier: TRPayTypeHeaderViewID)
        tableView.register(UINib.init(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        
        return tableView
    }()
    
    lazy var footerView: UIView = {
        let view = LXFooterButtonView.init(frame: .zero)
        view.footerButton.setTitle("确定", for: UIControl.State.normal)
        view.backgroundColor = UIColor.white
        view.footerButtonClick = {[weak self](button) in
            guard let presentBackCommitBlock = self?.presentBackCommitBlock else { return }
            presentBackCommitBlock(self?.payModelSelectedItem ?? "")
            self?.presentingViewController?.dismiss(animated: true, completion: nil)
        }
        
        return view
    }()
    
    func setupLayout() {
        self.view.addSubview(self.footerView)
        self.footerView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(84)
        }
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(self.footerView.snp.top)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
}

extension TROrderPaytypeViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: UITableViewDataSource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68.0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TRPayTypeTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TRPayTypeTableViewCell
        cell.trImageView.image = UIImage.init(named: trImageNameArray[indexPath.row])
        cell.trTitleLabel.text = trTitleTextArray[indexPath.row]
                        
        // 单选操作
        if selectIndex == indexPath {
            cell.trSelectedButton.isSelected = true
            self.payModelSelectedItem = "\(indexPath.row)"
        } else {
            cell.trSelectedButton.isSelected = false
            
            if selectIndex == nil  && indexPath.row == 0{
                cell.trSelectedButton.isSelected = true
                self.payModelSelectedItem = "0"
            }
        }

        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.payModelSelectedItem = "\(indexPath.row)"
        if selectIndex == nil {
            // 记录当前选中的位置索引
            selectIndex = indexPath
            let cell: TRPayTypeTableViewCell = tableView.cellForRow(at: indexPath) as! TRPayTypeTableViewCell
            cell.trSelectedButton.isSelected = true
            
            let cell0: TRPayTypeTableViewCell = tableView.cellForRow(at: NSIndexPath.init(row: 0, section: 0) as IndexPath) as! TRPayTypeTableViewCell
            cell0.trSelectedButton.isSelected = false
            
        } else {
            // 之前选中的取消选择
            let celled: TRPayTypeTableViewCell = tableView.cellForRow(at: selectIndex!) as! TRPayTypeTableViewCell
            celled.trSelectedButton.isSelected = false
            
            // 记录当前选中的位置索引
            selectIndex = indexPath
            let cell: TRPayTypeTableViewCell = tableView.cellForRow(at: indexPath) as! TRPayTypeTableViewCell
            cell.trSelectedButton.isSelected = true
        }        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: TRPayTypeHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TRPayTypeHeaderViewID) as! TRPayTypeHeaderView
        headerView.cancelButtonClickBlock = {(button) in
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.contentView.backgroundColor = UIColor.lightGray
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

}
