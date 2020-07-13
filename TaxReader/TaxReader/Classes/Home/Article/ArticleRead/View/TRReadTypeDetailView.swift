//
//  TRReadTypeDetailView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/20.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRReadTypeDetailView: UIView {
    lazy var trContentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var yearLabel: UILabel = {
        let view = UILabel.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.textColor = UIColor.lightGray
        view.font = UIFont.systemFont(ofSize: 15.0)
        
        return view
    }()

    lazy var autorLabel: UILabel = {
        let view = UILabel.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.textColor = UIColor.lightGray
        view.font = UIFont.systemFont(ofSize: 15.0)
        
        return view
    }()

    lazy var companyLabel: UILabel = {
        let view = UILabel.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.textColor = UIColor.lightGray
        view.font = UIFont.systemFont(ofSize: 15.0)
        
        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.yearLabel)
        self.yearLabel.snp.makeConstraints { (make) in
            make.top.right.equalToSuperview()
            make.left.equalTo(8)
            make.height.equalToSuperview().dividedBy(3)
        }
        
        self.trContentView.addSubview(self.autorLabel)
        self.autorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.yearLabel.snp.bottom)
            make.right.equalToSuperview()
            make.left.equalTo(self.yearLabel.snp.left)
            make.height.equalTo(self.yearLabel.snp.height)
        }
        
        self.trContentView.addSubview(self.companyLabel)
        self.companyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.autorLabel.snp.bottom)
            make.left.equalTo(self.yearLabel.snp.left)
            make.right.equalToSuperview()
            make.height.equalTo(self.yearLabel.snp.height)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var readTypeDataModel: TRArticleDetailDataModel? {
        didSet {
            guard let model = readTypeDataModel else {
                return
            }
            
            self.yearLabel.text = "《\(model.PubIssueName ?? "")》 \(model.PubIssueYear)年 第\(model.PubIssueNum)期"
            self.autorLabel.text = "作者：\(model.ArticleAuthorName ?? "")"
            self.companyLabel.text = "作者单位：\(model.ArticleUnitName ?? "null")"
        }
    }
    
}
