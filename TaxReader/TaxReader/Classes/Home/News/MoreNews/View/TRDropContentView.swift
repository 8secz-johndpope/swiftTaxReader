//
//  TRDropContentView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/19.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

protocol TRDropContentViewDelegate: NSObjectProtocol {
    func coverViewTapDisMiss()
    func tableViewDidSelectRowAt(_ tableView: UITableView, indexPath: IndexPath, readTypeText: String?, readTypeID: String?)
}

class TRDropContentView: UIView {
    
    weak var delegate: TRDropContentViewDelegate?
    
    var dataArray: [TRproductReadTypeDataModel]? = []
    
    lazy var trContentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.clear
        
        return view
    }()
    
    private let TRCatalogHeaderViewID = "TRCatalogHeaderView"
    private let TRMeFooterViewID = "TRMeFooterView"
    private let TRCatalogTableViewCellID = "TRCatalogTableViewCell"
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView.register(TRCatalogHeaderView.self, forHeaderFooterViewReuseIdentifier: TRCatalogHeaderViewID)
        tableView.register(TRMeFooterView.self, forHeaderFooterViewReuseIdentifier: TRMeFooterViewID)
        tableView.register(TRCatalogTableViewCell.self, forCellReuseIdentifier: TRCatalogTableViewCellID)
        
        return tableView
    }()
    
    lazy var trCoverView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7);
        
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(coverViewTap(sender:)))
        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    @objc func coverViewTap(sender: UITapGestureRecognizer) {
        if (self.delegate != nil) && ((self.delegate?.responds(to: Selector.init(("didSelectRowAt")))) != nil) {
            self.delegate?.coverViewTapDisMiss()
        }
    }
    
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXScreenHeight * 0.5)
        }
        
        self.trContentView.addSubview(self.trCoverView)
        self.trCoverView.snp.makeConstraints { (make) in
            make.top.equalTo(self.tableView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dataArrayReadType: [TRproductReadTypeDataModel]? {
        didSet {
            guard let dataArrayModel = dataArrayReadType else {
                return
            }
            
            self.dataArray = dataArrayModel
            
            // 动态计算下拉框的高度
            if self.dataArray?.count ?? 0 > 0 {
                let sectionHeight = (self.dataArray?.count ?? 0) * 44
                var rowHeight = 0
                for lindex in 0..<self.dataArray!.count {
                   let sectionModel: TRproductReadTypeDataModel = self.dataArray?[lindex] ?? TRproductReadTypeDataModel.init()
                    rowHeight = rowHeight + ((sectionModel.children?.count ?? 0) * 44)
                }
                var computedHeight = CGFloat(sectionHeight + rowHeight)
                if computedHeight > (LXScreenHeight * 0.5) {
                    computedHeight = LXScreenHeight * 0.5
                }
                self.tableView.snp.updateConstraints { (make) in
                    make.height.equalTo(computedHeight)
                }
            }
            
            self.tableView.reloadData()
        }
    }
}

extension TRDropContentView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionModel: TRproductReadTypeDataModel = self.dataArray?[section] ?? TRproductReadTypeDataModel.init()
        return sectionModel.children?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: TRCatalogTableViewCellID, for: indexPath) as! TRCatalogTableViewCell
        let sectionModel: TRproductReadTypeDataModel = self.dataArray?[indexPath.section] ?? TRproductReadTypeDataModel.init()
        let rowModel: TRproductReadTypeDataChildrenModel = sectionModel.children?[indexPath.row] ?? TRproductReadTypeDataChildrenModel.init()
        
        cell.textLabel?.text = rowModel.ReadTypeName
        cell.textLabel?.textColor = UIColor.init(white: 0.0, alpha: 0.6)
        cell.textLabel?.font = UIFont.init(name: "ChalkboardSE-Bold", size: 14.0)
        cell.textLabel?.lineBreakMode = .byCharWrapping
        cell.textLabel?.numberOfLines = 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: TRCatalogHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TRCatalogHeaderViewID) as! TRCatalogHeaderView
        let sectionModel: TRproductReadTypeDataModel = self.dataArray?[section] ?? TRproductReadTypeDataModel.init()
        headerView.titleString = sectionModel.ReadTypeName
        headerView.isHasImageView = false
        headerView.coverTapBloclk = {[unowned self]() in
            if (self.delegate != nil) && ((self.delegate?.responds(to: Selector.init(("didSelectRowAt")))) != nil) {
                self.delegate?.tableViewDidSelectRowAt(tableView, indexPath: IndexPath.init(), readTypeText: sectionModel.ReadTypeName, readTypeID: "\(sectionModel.ReadTypeID)")
            }
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.contentView.backgroundColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView: TRMeFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TRMeFooterViewID) as! TRMeFooterView
        return footerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        footerView.contentView.backgroundColor = UIColor.red
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sectionModel: TRproductReadTypeDataModel = self.dataArray?[indexPath.section] ?? TRproductReadTypeDataModel.init()
        let rowModel: TRproductReadTypeDataChildrenModel = sectionModel.children?[indexPath.row] ?? TRproductReadTypeDataChildrenModel.init()
        if (self.delegate != nil) && ((self.delegate?.responds(to: Selector.init(("didSelectRowAt")))) != nil) {
            self.delegate?.tableViewDidSelectRowAt(tableView, indexPath: indexPath, readTypeText: rowModel.ReadTypeName, readTypeID: "\(sectionModel.ReadTypeID)")
        }
    }
}
