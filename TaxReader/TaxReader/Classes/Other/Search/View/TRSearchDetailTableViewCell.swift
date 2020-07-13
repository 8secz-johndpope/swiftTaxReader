//
//  TRSearchDetailTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/4/14.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRSearchDetailTableViewCell: UITableViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    private lazy var trTextLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.text = "0.我国税务系统绩效管理体系发展成效和特色"
        label.textColor = UIColor.blue
        
        return label
    }()
    
    private lazy var trNameTextLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.text = "朱大旗;范瑶"
        label.textColor = UIColor.lightGray
        
        return label
    }()
    
    private lazy var trTimeTextLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.text = "2020年 09期"
        label.textColor = UIColor.lightGray
        
        return label
    }()
    
    private lazy var trTypeTextLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.text = "中国税务杂志"
        label.textColor = UIColor.lightGray
        
        return label
    }()
        
    func setupLayout() {
        self.addSubview(self.backView)
        self.backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0))
        }
        
        self.addSubview(self.trTextLabel)
        self.trTextLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(12)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(30)
        }
        
        self.addSubview(self.trNameTextLabel)
        self.trNameTextLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTextLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(25)
            make.height.equalTo(30)
        }
        
        self.addSubview(self.trTimeTextLabel)
        self.trTimeTextLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.trNameTextLabel.snp.centerY)
            make.right.equalTo(self.trTextLabel.snp.right)
            make.height.equalTo(30)
        }
        
        self.addSubview(self.trTypeTextLabel)
        self.trTypeTextLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.trNameTextLabel.snp.centerY)
            make.right.equalTo(self.trTimeTextLabel.snp.left).offset(-12)
            make.height.equalTo(30)
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.lightGray
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var articleSearchDadaDataModel: TRArticleSearchDataDataModel? {
        didSet {
            guard let model = articleSearchDadaDataModel else {
                return
            }
            
            self.trTextLabel.text = "\(model.cellIndexPathSection + 1). \(model.ArticleTitle ?? "")"
            self.trNameTextLabel.text = model.ArticleAuthorName
            self.trTypeTextLabel.text = model.PubIssueName
            self.trTimeTextLabel.text = "\(model.PubIssueYear ?? "")年 \(model.PubIssueNum ?? "")期"
        }
    }
    
    var articleDataRecdModel: TRArticleDataRecdModel? {
        didSet {
            guard let model = articleDataRecdModel else {
                return
            }
            
            self.trTextLabel.text = "\(model.cellIndexPathSection + 1). \(model.ProdName ?? "")"
            self.trNameTextLabel.text = model.ProdAuthorName
            self.trTypeTextLabel.text = model.ReadTypeName
            self.trTimeTextLabel.text = model.ProdCreateTime
        }
    }
}
