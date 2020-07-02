//
//  TRFavorPeriodicalTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/4/14.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRFavorPeriodicalTableViewCell: UITableViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    // 左侧图片
    private var leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.yellow
        imageView.kf.setImage(with: URL(string: "http://app.ctax.org.cn/uploadfiles/magazines/b09fd794-62b6-4ffe-8c37-6954f4596857.jpg"))
        
        return imageView
    }()
    
    // 标题
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.blue
        label.text = "中国税务"
        
        return label
    }()
    
    // 期刊时间
    private var timeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.lightGray
        label.text = "2020年 第2期 总第425期"
        
        return label
    }()
    
    // exp1
    private var exp1Label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.text = "优化税收营商环境1"
        
        return label
    }()
    
    // exp2
    private var exp2Label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.text = "优化税收营商环境2"
        
        return label
    }()
    
    // exp3
    private var exp3Label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.text = "优化税收营商环境3"
        
        return label
    }()
    
    // exp4
    private var exp4Label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.text = "优化税收营商环境4"
        
        return label
    }()
        
    func setUpLayout(){
        self.addSubview(self.backView)
        self.backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0))
        }
        
        self.backView.addSubview(self.leftImageView)
        self.leftImageView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(self.leftImageView.snp.height).dividedBy(3.2 / 2)
        }
        
        self.backView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.leftImageView.snp.top)
            make.left.equalTo(self.leftImageView.snp.right).offset(4)
            make.right.equalToSuperview().offset(-4)
            make.height.equalTo(self.leftImageView).dividedBy(6.5)
        }
        
        self.backView.addSubview(self.timeLabel)
        self.timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(itemLabelTopCons)
            make.leading.equalTo(self.titleLabel.snp.leading)
            make.trailing.equalTo(self.titleLabel.snp.trailing)
            make.height.equalTo(self.titleLabel)
        }
        
        self.backView.addSubview(self.exp1Label)
        self.exp1Label.snp.makeConstraints { (make) in
            make.top.equalTo(self.timeLabel.snp.bottom).offset(itemLabelTopCons)
            make.leading.equalTo(self.titleLabel.snp.leading)
            make.trailing.equalTo(self.titleLabel.snp.trailing)
            make.height.equalTo(self.titleLabel)
        }
        
        self.backView.addSubview(self.exp2Label)
        self.exp2Label.snp.makeConstraints { (make) in
            make.top.equalTo(self.exp1Label.snp.bottom).offset(itemLabelTopCons)
            make.leading.equalTo(self.titleLabel.snp.leading)
            make.trailing.equalTo(self.titleLabel.snp.trailing)
            make.height.equalTo(self.titleLabel)
        }
        
        self.backView.addSubview(self.exp3Label)
        self.exp3Label.snp.makeConstraints { (make) in
            make.top.equalTo(self.exp2Label.snp.bottom).offset(itemLabelTopCons)
            make.leading.equalTo(self.titleLabel.snp.leading)
            make.trailing.equalTo(self.titleLabel.snp.trailing)
            make.height.equalTo(self.titleLabel)
        }
        
        self.backView.addSubview(self.exp4Label)
        self.exp4Label.snp.makeConstraints { (make) in
            make.top.equalTo(self.exp3Label.snp.bottom).offset(itemLabelTopCons)
            make.leading.equalTo(self.titleLabel.snp.leading)
            make.trailing.equalTo(self.titleLabel.snp.trailing)
            make.height.equalTo(self.titleLabel)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.lightGray
        
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var findDataModel: TRFavorFindDataModel? {
        didSet {
            guard let model = findDataModel else {
                return
            }
            
            self.titleLabel.text = model.PubIssueName
            self.timeLabel.text = "\(model.PubIssueYear)年"
            self.leftImageView.sd_setImage(with: URL(string: "\(appIp)\(model.PubIssueCoverPath ?? "")"),
                                        placeholderImage: UIImage.init(named: "DefaultS"),
                                        options: .allowInvalidSSLCertificates,
                                        context: nil)
            self.exp1Label.text = model.ArticleList?[0].ArticleTitle
            self.exp2Label.text = model.ArticleList?[1].ArticleTitle
            self.exp3Label.text = model.ArticleList?[2].ArticleTitle
            self.exp4Label.text = model.ArticleList?[3].ArticleTitle
        }
    }
}
