//
//  TRHomeArticleCollectionViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/4/2.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRHomeArticleCollectionViewCell: UICollectionViewCell {
    // 背景图片
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.yellow
        imageView.image = UIImage.init(named: "文章背景")
        
        return imageView
    }()
    
    // 标题
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.text = "”在疫情防控中践行初心使命在大战大考中彰显税务担当“"
        
        return label
    }()
    
    // 免费阅读
    private var detailTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.white
        label.text = "免费阅读"
         
        return label
    }()
    
    func setUpLayout(){
        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        self.addSubview(self.detailTitleLabel)
        self.detailTitleLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-40)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.green
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var articleRecdDataModel:TRArticleDataRecdModel? {
        didSet {
            guard let model = articleRecdDataModel else {return}
            self.titleLabel.text = model.ProdName
            self.detailTitleLabel.text = model.ProdAuthorName
        }
    }
}
