//
//  TRFavorArticleTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/4/14.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRFavorArticleTableViewCell: UITableViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    private lazy var trTextLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.text = "0.[文章] 房地产企业税收筹划的难点及策略"
        label.textColor = UIColor.blue
        
        return label
    }()
    
    private lazy var trDetailTextLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.text = "徐尧 - 财会学习 - 2020年09期"
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
            make.top.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(30)
        }
        
        self.addSubview(self.trDetailTextLabel)
        self.trDetailTextLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTextLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-10)
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
    
    var findDataModel: TRFavorFindDataModel? {
        didSet {
            guard let model = findDataModel else {
                return
            }
            
            self.trTextLabel.text = model.ArticleTitle
            self.trDetailTextLabel.text = "\(model.ArticleAuthorName ?? "") - \(model.PubIssueName ?? "") - \(model.PubIssueYear)年"
        }
    }
}
