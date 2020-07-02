//
//  TRHomeRankCollectionViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/4/2.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRHomeRankCollectionViewCell: UICollectionViewCell {
    // 图片
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.yellow
        imageView.kf.setImage(with: URL(string: "http://app.ctax.org.cn/uploadfiles/magazines/b09fd794-62b6-4ffe-8c37-6954f4596857.jpg"))
        
        return imageView
    }()
    
    // 标题
    private var titleLabel: UILabel = {
        let label = UILabel()
        // label.backgroundColor = UIColor.yellow
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.text = "税务研究"
        
        return label
    }()
    
    func setUpLayout(){
        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-60)
        }
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.imageView.snp.bottom).offset(10)
            make.height.equalTo(40)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var rectDataModel:TRProductRecdDataModel? {
        didSet {
            guard let model = rectDataModel else {return}
            self.imageView.sd_setImage(with: URL(string: "\(appIp)\(model.ProdImg ?? "")"),
                                        placeholderImage: UIImage.init(named: "DefaultS"),
                                        options: .allowInvalidSSLCertificates,
                                        context: nil)
            self.titleLabel.text = model.ProdName
        }
    }
    
    var pubIssueByYearDataModel:TRProductGetPubIssueByYearDataModel? {
        didSet {
            guard let model = pubIssueByYearDataModel else {return}
            self.imageView.sd_setImage(with: URL(string: "\(appIp)\(model.ProdImg ?? "")"),
                                        placeholderImage: UIImage.init(named: "DefaultS"),
                                        options: .allowInvalidSSLCertificates,
                                        context: nil)
            self.titleLabel.text = "\(model.ProdYear)年 第\(model.ProdIssue)期"
        }
    }
}
