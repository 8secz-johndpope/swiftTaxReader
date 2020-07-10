//
//  TRNewsDetailCatalogView.swift
//  TaxReader
//
//  Created by asdc on 2020/4/9.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

protocol TRNewsDetailCatalogViewDelegate: NSObjectProtocol {
    func tableViewDidSelectRowAt(_ tableView: UITableView, indexPath: IndexPath, ArticleID: String?)
}

class TRNewsDetailCatalogView: UIView {
    
    weak var delegate: TRNewsDetailCatalogViewDelegate?
    
    var dataArrayPubIssueCataModel: [TRProductDetailDataPubIssueCataModel]?
    
    lazy var headerBackgroundView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var headerTitleLabel: UILabel = {
        let label = UILabel.init(frame: .zero)
        label.backgroundColor = UIColor.white
        label.text = "目录"
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textAlignment = .center
        
        return label
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
        tableView.register(UINib.init(nibName: "TRCatalogTableViewCell", bundle: nil), forCellReuseIdentifier: TRCatalogTableViewCellID)
        
        return tableView
    }()
    
    func setupLayout() {
        self.addSubview(self.headerBackgroundView)
        self.headerBackgroundView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        self.headerBackgroundView.addSubview(self.headerTitleLabel)
        self.headerTitleLabel.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(-0.4)
        }
        
        self.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.headerBackgroundView.snp.bottom)
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
    
    var dataArrayPubIssueCata: [TRProductDetailDataPubIssueCataModel]? {
        didSet {
            guard let dataArrayModel = dataArrayPubIssueCata else {
                return
            }
            
            self.dataArrayPubIssueCataModel = dataArrayModel
            self.tableView.reloadData()
        }
    }
}

extension TRNewsDetailCatalogView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArrayPubIssueCataModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionModel: TRProductDetailDataPubIssueCataModel = self.dataArrayPubIssueCataModel?[section] ?? TRProductDetailDataPubIssueCataModel.init()
        return sectionModel.ArticleList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: TRCatalogTableViewCellID, for: indexPath) as! TRCatalogTableViewCell
        let sectionModel: TRProductDetailDataPubIssueCataModel = self.dataArrayPubIssueCataModel?[indexPath.section] ?? TRProductDetailDataPubIssueCataModel.init()
        let rowModel: TRProductDetailDataPubIssueCataArticleListModel = sectionModel.ArticleList?[indexPath.row] ?? TRProductDetailDataPubIssueCataArticleListModel.init()
        
        cell.trTitleLabel?.text = rowModel.ArticleTitle
        cell.trTitleLabel?.textColor = UIColor.init(white: 0.0, alpha: 0.6)
        cell.trTitleLabel?.font = UIFont.init(name: "ChalkboardSE-Bold", size: 14.0)
        cell.trTitleLabel?.lineBreakMode = .byCharWrapping
        cell.trTitleLabel?.numberOfLines = 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionModel: TRProductDetailDataPubIssueCataModel = self.dataArrayPubIssueCataModel?[indexPath.section] ?? TRProductDetailDataPubIssueCataModel.init()
        let rowModel: TRProductDetailDataPubIssueCataArticleListModel = sectionModel.ArticleList?[indexPath.row] ?? TRProductDetailDataPubIssueCataArticleListModel.init()
        if (self.delegate != nil) && ((self.delegate?.responds(to: Selector.init(("didSelectRowAt")))) != nil) {
            self.delegate?.tableViewDidSelectRowAt(tableView, indexPath: indexPath, ArticleID: "\(rowModel.ArticleID)")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: TRCatalogHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TRCatalogHeaderViewID) as! TRCatalogHeaderView
        let sectionModel: TRProductDetailDataPubIssueCataModel = self.dataArrayPubIssueCataModel?[section] ?? TRProductDetailDataPubIssueCataModel.init()
        headerView.titleString = sectionModel.PubIssueCataName
        
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
}
