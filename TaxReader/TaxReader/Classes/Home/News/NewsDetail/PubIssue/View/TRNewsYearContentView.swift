//
//  TRNewsYearContentView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/17.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

protocol TRNewsYearContentViewDelegate: NSObjectProtocol {
    func collectionViewDidSelectRowAt(_ collectionView: UICollectionView, indexPath: IndexPath, model: TRProductGetPubIssueByYearDataModel?)
}

class TRNewsYearContentView: UIView {
    
    weak var delegate: TRNewsYearContentViewDelegate?
    
    var dataArray: [TRProductGetPubIssueByYearDataModel]?
    
    lazy var trContentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.cyan
        
        return view
    }()
    
    let TRHomeRankCollectionViewCellID = "TRHomeRankCollectionViewCell"
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: (LXScreenWidth - 80 - 4 * 4) / 3, height: CGFloat((TRHomeSectionRankHeight - 3 * 4) / 2))
        layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(TRHomeRankCollectionViewCell.self, forCellWithReuseIdentifier: TRHomeRankCollectionViewCellID)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }();
    
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dataArrayPubIssueByYearDataModel: [TRProductGetPubIssueByYearDataModel]? {
        didSet {
            guard let dataArrayModel = dataArrayPubIssueByYearDataModel else {
                return
            }
            
            self.dataArray = dataArrayModel
            self.collectionView.reloadData()
        }
    }
}

extension TRNewsYearContentView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TRHomeRankCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: TRHomeRankCollectionViewCellID, for: indexPath) as! TRHomeRankCollectionViewCell
        
        let model: TRProductGetPubIssueByYearDataModel = self.dataArray?[indexPath.row] ?? TRProductGetPubIssueByYearDataModel.init()
        cell.pubIssueByYearDataModel = model
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model: TRProductGetPubIssueByYearDataModel = self.dataArray?[indexPath.row] ?? TRProductGetPubIssueByYearDataModel.init()
        if (self.delegate != nil) && ((self.delegate?.responds(to: Selector.init(("didSelectRowAt")))) != nil) {
            self.delegate?.collectionViewDidSelectRowAt(collectionView, indexPath: indexPath, model: model)
        }
    }
}

