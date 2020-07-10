//
//  TRHomeBannerTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/4/1.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import FSPagerView
import SnapKit
import Kingfisher

protocol FMHomeVipBannerTableViewCellDelegate: NSObjectProtocol {
    
}

class TRHomeBannerTableViewCell: UITableViewCell {
    
    weak var delegate: FMHomeVipBannerTableViewCellDelegate?
    
    var homeBannerArr: [TRProductRotchartDataModel]?
    
    private let FSPagerViewCellID = "TRHomeBannerTableViewCell"
    
    private lazy var pageView: FSPagerView = {
        let pageView = FSPagerView()
        pageView.dataSource = self
        pageView.delegate = self
        pageView.automaticSlidingInterval = 3
        pageView.isInfinite = true
        pageView.interitemSpacing = 15
        pageView.transformer = FSPagerViewTransformer(type: .linear)
        pageView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: FSPagerViewCellID)
        
        return pageView
    }()
    
    func setupPageView() {
        self.addSubview(self.pageView)
        self.pageView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalToSuperview()
        }
        self.pageView.itemSize = CGSize(width: LXScreenWidth, height: 150)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupPageView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var bannerArray: [TRProductRotchartDataModel]? {
        didSet {
            guard let homeBannerArr = bannerArray else {return}
            self.homeBannerArr = homeBannerArr
            self.pageView.reloadData()
        }
    }
}

extension TRHomeBannerTableViewCell: FSPagerViewDataSource, FSPagerViewDelegate {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.homeBannerArr?.count ?? 0
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let model: TRProductRotchartDataModel = self.homeBannerArr?[index] ?? TRProductRotchartDataModel.init()
        let cell = pageView.dequeueReusableCell(withReuseIdentifier: FSPagerViewCellID, at: index)
        cell.imageView?.sd_setImage(with: URL(string: "\(model.ImgSRC ?? "")"),
                                    placeholderImage: UIImage.init(named: "DefaultH"),
                                    options: .allowInvalidSSLCertificates,
                                    context: nil)
        
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
       
    }
}
