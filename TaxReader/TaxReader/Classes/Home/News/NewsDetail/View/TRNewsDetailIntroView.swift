//
//  TRNewsDetailIntroView.swift
//  TaxReader
//
//  Created by asdc on 2020/4/9.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRNewsDetailIntroView: UIView {
    
    lazy var trContentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    var trImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trDetailBackgroundView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    // 单项
    lazy var View1: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 16.0)
        
        return view
    }()
    
    lazy var View2: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var pubEnglishLabel: UILabel = {
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 15.0)
        
        return view
    }()

    lazy var View3: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var pubYearLabel: UILabel = {
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 13.0)
        view.textColor = UIColor.lightGray
        
        return view
    }()

    lazy var View4: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var pubUnitLabel: UILabel = {
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 13.0)
        view.textColor = UIColor.lightGray
        
        return view
    }()

    lazy var View5: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var PubCycleLabel: UILabel = {
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 13.0)
        view.textColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var PubISSNLabel: UILabel = {
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 13.0)
        view.textColor = UIColor.lightGray
        
        return view
    }()

    lazy var View6: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var PubCNLabel: UILabel = {
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 13.0)
        view.textColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var PubLocalLabel: UILabel = {
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 13.0)
        view.textColor = UIColor.lightGray
        
        return view
    }()

    lazy var View7: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var PubYZLabel: UILabel = {
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 13.0)
        view.textColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var PubKBLabel: UILabel = {
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 13.0)
        view.textColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var View8: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var PubYFDHLabel: UILabel = {
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 13.0)
        view.textColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var PubCKSJLabel: UILabel = {
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 13.0)
        view.textColor = UIColor.lightGray
        
        return view
    }()
            
    func setUpLayout(){
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trImageView)
        self.trImageView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalToSuperview().dividedBy(3.5)
        }
        
        self.trContentView.addSubview(self.trDetailBackgroundView)
        self.trDetailBackgroundView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trImageView.snp.top)
            make.left.equalTo(self.trImageView.snp.right).offset(8)
            make.bottom.equalTo(self.trImageView.snp.bottom)
            make.right.equalToSuperview().offset(-8)
        }
        
        // 单项
        self.trDetailBackgroundView.addSubview(self.View1)
        self.View1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(8)
        }
        
        self.View1.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trDetailBackgroundView.addSubview(self.View2)
        self.View2.snp.makeConstraints { (make) in
            make.top.equalTo(self.View1.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(self.View1.snp.height)
        }
        
        self.View2.addSubview(self.pubEnglishLabel)
        self.pubEnglishLabel.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trDetailBackgroundView.addSubview(self.View3)
        self.View3.snp.makeConstraints { (make) in
            make.top.equalTo(self.View2.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(self.View1.snp.height)
        }
        
        self.View3.addSubview(self.pubYearLabel)
        self.pubYearLabel.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }

        self.trDetailBackgroundView.addSubview(self.View4)
        self.View4.snp.makeConstraints { (make) in
            make.top.equalTo(self.View3.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(self.View1.snp.height)
        }
        
        self.View4.addSubview(self.pubUnitLabel)
        self.pubUnitLabel.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }

        self.trDetailBackgroundView.addSubview(self.View5)
        self.View5.snp.makeConstraints { (make) in
            make.top.equalTo(self.View4.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(self.View1.snp.height)
        }
        
        self.View5.addSubview(self.PubCycleLabel)
        self.PubCycleLabel.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }

        self.View5.addSubview(self.PubISSNLabel)
        self.PubISSNLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(self.PubCycleLabel.snp.right)
            make.width.equalToSuperview().dividedBy(2)
        }

        self.trDetailBackgroundView.addSubview(self.View6)
        self.View6.snp.makeConstraints { (make) in
            make.top.equalTo(self.View5.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(self.View1.snp.height)
        }
        
        self.View6.addSubview(self.PubCNLabel)
        self.PubCNLabel.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }

        self.View6.addSubview(self.PubLocalLabel)
        self.PubLocalLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(self.PubCNLabel.snp.right)
            make.width.equalToSuperview().dividedBy(2)
        }

        self.trDetailBackgroundView.addSubview(self.View7)
        self.View7.snp.makeConstraints { (make) in
            make.top.equalTo(self.View6.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(self.View1.snp.height)
        }
        
        self.View7.addSubview(self.PubYZLabel)
        self.PubYZLabel.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }

        self.View7.addSubview(self.PubKBLabel)
        self.PubKBLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(self.PubYZLabel.snp.right)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        self.trDetailBackgroundView.addSubview(self.View8)
        self.View8.snp.makeConstraints { (make) in
            make.top.equalTo(self.View7.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(self.View1.snp.height)
        }
        
        self.View8.addSubview(self.PubYFDHLabel)
        self.PubYFDHLabel.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }

        self.View8.addSubview(self.PubCKSJLabel)
        self.PubCKSJLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(self.PubYFDHLabel.snp.right)
            make.width.equalToSuperview().dividedBy(2)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var detailModel: TRProductDetailDataModel? {
        didSet {
            guard let model = detailModel else {
                return
            }
            
            self.trImageView.sd_setImage(with: URL(string: "\(appIp)\(model.PubIssueCoverPath ?? "")"),
                                        placeholderImage: UIImage.init(named: "DefaultS"),
                                        options: .allowInvalidSSLCertificates,
                                        context: nil)
            
            self.nameLabel.text = model.PubIssueName?.isBlank ?? true ? "null" : model.PubIssueName
            self.pubEnglishLabel.text = "null"
            
            let yearText = ("\(model.PubIssueYear)").isBlank ? "null" : ("\(model.PubIssueYear)")
            let numText = ("\(model.PubIssueNum)").isBlank ? "null" : ("\(model.PubIssueNum)")
            let sumNumText = ("\(model.PubIssueSumNum)").isBlank ? "null" : ("\(model.PubIssueSumNum)")
            self.pubYearLabel.text = ("\(yearText)年 第\(numText)期 总第\(sumNumText)期")
            
            self.pubUnitLabel.text = model.PubIssueExeUnit?.isBlank ?? true ? "主办单位：null" : "主办单位：\(model.PubIssueExeUnit ?? "")"
            
            let cycleText = ("\(model.PubCycle)").isBlank ? "null" : ("\(model.PubCycle)")
            self.PubCycleLabel.text = "出版周期：\(cycleText)"
            
            self.PubISSNLabel.text = model.PubIssueISSN?.isBlank ?? true ? "ISSN：null" : "ISSN：\(model.PubIssueISSN ?? "")"
            
            self.PubCNLabel.text = model.PubIssueCN?.isBlank ?? true ? "CN：null" : "CN：\(model.PubIssueCN ?? "")"
            self.PubLocalLabel.text = model.PubPlace?.isBlank ?? true ? "出版地：null" : "出版地：\(model.PubPlace ?? "")"
            
            self.PubYZLabel.text = model.PubLanguage?.isBlank ?? true ? "语种：null" : "语种：\(model.PubLanguage ?? "")"
            self.PubKBLabel.text = "开本：null"
            
            self.PubYFDHLabel.text = "邮发代号：null"
            
            let buildYearText = ("\(model.PubStartBuildYear)").isBlank ? "null" : ("\(model.PubStartBuildYear)")
            self.PubCKSJLabel.text = "创刊时间：\(buildYearText)"
        }
    }
    
}
