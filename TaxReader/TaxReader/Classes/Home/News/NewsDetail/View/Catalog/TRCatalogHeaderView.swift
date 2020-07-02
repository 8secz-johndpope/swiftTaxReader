//
//  TRCatalogHeaderView.swift
//  TaxReader
//
//  Created by asdc on 2020/4/9.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRCatalogHeaderViewCoverTapBlock = () ->Void

class TRCatalogHeaderView: UITableViewHeaderFooterView {
    
    var coverTapBloclk: TRCatalogHeaderViewCoverTapBlock?
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView.init()
        view.image = UIImage.init(named: "主题图标")
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 15.0)
        
        return label
    }()
    
    lazy var trCoverView: UIView = {
        let view = UIView.init(frame: .zero)
        
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(coverViewTap(sender:)))
        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    @objc func coverViewTap(sender: UITapGestureRecognizer) {
        guard let coverTapBloclk = self.coverTapBloclk else { return }
        coverTapBloclk()
    }
    
    func setupLayout() {
        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { (make) in
            make.left.equalTo(6)
            make.centerY.equalToSuperview()
            make.size.equalTo(18)
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.imageView.snp.right).offset(8)
            make.centerY.equalToSuperview()
        }
        
        self.addSubview(self.trCoverView)
        self.trCoverView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titleString: String? {
        didSet {
            guard let titleString = titleString else {
                return
            }
            
            self.titleLabel.text = titleString
        }
    }
    
    var isHasImageView: Bool? {
        didSet {
            guard let isHasImageView = isHasImageView else {
                return
            }
            
            let sizeNumber: Int = isHasImageView ? 18 : 0
            self.imageView.snp.updateConstraints { (make) in
                make.size.equalTo(sizeNumber)
            }
        }
    }
}
