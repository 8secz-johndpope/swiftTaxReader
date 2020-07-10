//
//  TRHomeInfroTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/4/2.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRHomeInfroTableViewCellSelectCellAtBlock = (_ tableView: UITableView, _ indexPath: IndexPath) ->Void

class TRHomeInfroTableViewCell: UITableViewCell {
    
    var cellDidSelectItem : TRHomeInfroTableViewCellSelectCellAtBlock?
    
    var dataArray:[TRArticleGettopnewsDataModel]?
    
    private let TRCatalogTableViewCellID = "TRCatalogTableViewCell"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.register(UINib.init(nibName: "TRCatalogTableViewCell", bundle: nil), forCellReuseIdentifier: TRCatalogTableViewCellID)
        
        return tableView
    }()
    
    func setupTableView() {
        self.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var tableViewDataArray:[TRArticleGettopnewsDataModel]? {
        didSet {
            guard let modelArray = tableViewDataArray else {
                return
            }
            self.dataArray = modelArray
            self.tableView.reloadData()
        }
    }
}

extension TRHomeInfroTableViewCell: UITableViewDataSource, UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TRCatalogTableViewCellID, for: indexPath) as! TRCatalogTableViewCell
        
        let model: TRArticleGettopnewsDataModel = self.dataArray?[indexPath.row] ?? TRArticleGettopnewsDataModel.init()
        
        cell.trTitleLabel?.text = model.News_Title
        cell.trTitleLabel?.textColor = UIColor.init(white: 0.0, alpha: 0.6)
        cell.trTitleLabel?.font = UIFont.init(name: "ChalkboardSE-Bold", size: 14.0)
        cell.trTitleLabel?.lineBreakMode = .byCharWrapping
        cell.trTitleLabel?.numberOfLines = 2
         
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let cellDidSelectItem = cellDidSelectItem else { return }
        cellDidSelectItem(tableView, indexPath)
    }
}
