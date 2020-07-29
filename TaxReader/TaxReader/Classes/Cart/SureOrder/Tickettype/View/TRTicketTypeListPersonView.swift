//
//  TRTicketTypeListPersonView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/11.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRTicketTypeListPersonViewEditBlock = (_ button: UIButton, _ model: TRInvoiceInfoDataModel) ->Void
typealias TRTicketTypeListPersonViewSelectedBlock = (_ button: UIButton, _ model: TRInvoiceInfoDataModel) ->Void

class TRTicketTypeListPersonView: UIView {
    
    var cellPersonEditButtonClickBlock: TRTicketTypeListPersonViewEditBlock?
    var cellPersonSelectedButtonClickBlock: TRTicketTypeListPersonViewSelectedBlock?
    
    var dataArray: [TRInvoiceInfoDataModel]?
    
    /// 当前选中的行
    var selectIndex: IndexPath?
    
    private lazy var trContentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.red
        
        return view
    }()
    
    private let identific = "TRTicketTypeTableViewCell"
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.register(UINib.init(nibName: identific, bundle: nil), forCellReuseIdentifier: identific)
        
        return tableView
    }()
    
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    var dataArrayInvoiceInfoDataModel: [TRInvoiceInfoDataModel]? {
        didSet {
            guard let dataArray = dataArrayInvoiceInfoDataModel else {
                return
            }
            
            self.dataArray = dataArray
            self.tableView.reloadData()
        }
    }
}

extension TRTicketTypeListPersonView: UITableViewDataSource, UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init()
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return ""
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identific, for: indexPath) as! TRTicketTypeTableViewCell
        cell.delegate = self
        cell.trSelectedButton.tag = indexPath.row
        cell.trEditButton.tag = indexPath.row
        cell.cellIndexPath = indexPath
        
        let model: TRInvoiceInfoDataModel = self.dataArray?[indexPath.row] ?? TRInvoiceInfoDataModel.init()
        cell.trTypeLabel.text = model.UserInvoiceTitle
        cell.trNumberLabel.text = model.UserInvoicePhone
        
        // 单选操作
        if selectIndex == indexPath {
            cell.trSelectedButton.isSelected = true
        } else {
            cell.trSelectedButton.isSelected = false
            
//            if selectIndex == nil  && indexPath.row == 0{
//                cell.trSelectedButton.isSelected = true
//            }
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TRTicketTypeListPersonView:TRTicketTypeTableViewCellDelegate {
    func cellSelectedButtonAction(button: UIButton, cell: TRTicketTypeTableViewCell) {
        if selectIndex == nil {
            // 记录当前选中的位置索引
            selectIndex = cell.cellIndexPath
            let cell: TRTicketTypeTableViewCell = tableView.cellForRow(at: cell.cellIndexPath) as! TRTicketTypeTableViewCell
            cell.trSelectedButton.isSelected = true
            
            let cell0: TRTicketTypeTableViewCell = tableView.cellForRow(at: NSIndexPath.init(row: 0, section: 0) as IndexPath) as! TRTicketTypeTableViewCell
            cell0.trSelectedButton.isSelected = false
            
        } else {
            // 之前选中的取消选择
            let celled: TRTicketTypeTableViewCell = tableView.cellForRow(at: selectIndex!) as! TRTicketTypeTableViewCell
            celled.trSelectedButton.isSelected = false
            
            // 记录当前选中的位置索引
            selectIndex = cell.cellIndexPath
            let cell: TRTicketTypeTableViewCell = tableView.cellForRow(at: cell.cellIndexPath) as! TRTicketTypeTableViewCell
            cell.trSelectedButton.isSelected = true
        }
        
        let infoMoDatadel: TRInvoiceInfoDataModel = self.dataArray?[button.tag] ?? TRInvoiceInfoDataModel.init()
        guard let cellPersonSelectedButtonClickBlock = cellPersonSelectedButtonClickBlock else { return }
        cellPersonSelectedButtonClickBlock(button, infoMoDatadel)
    }
    
    func cellEditButtonAction(button: UIButton, cell: TRTicketTypeTableViewCell) {
        let infoMoDatadel: TRInvoiceInfoDataModel = self.dataArray?[button.tag] ?? TRInvoiceInfoDataModel.init()
        guard let cellPersonEditButtonClickBlock = cellPersonEditButtonClickBlock else { return }
        cellPersonEditButtonClickBlock(button, infoMoDatadel)
    }
}


