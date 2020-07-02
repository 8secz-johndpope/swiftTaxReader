//
//  TRHomeNewsTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/4/2.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRHomeNewsDidSelectItemAtBlock = (_ collectionView: UICollectionView, _ indexPath: IndexPath) ->Void

class TRHomeNewsTableViewCell: UITableViewCell {
    
    var dataArray:[TRproductLastDataModel]?
    
    var cellDidSelectItem : TRHomeNewsDidSelectItemAtBlock?
    
    let TRHomeNewsCollectionViewCellID = "TRHomeNewsCollectionViewCell"
    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: (LXScreenWidth - 3 * 4) / 2, height: CGFloat(TRHomeSectionNewseHeight - 8))
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(TRHomeNewsCollectionViewCell.self, forCellWithReuseIdentifier: TRHomeNewsCollectionViewCellID)
        
        return collectionView
    }()
    
    func setupCollectionView() {
        self.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var collectionViewDataArray:[TRproductLastDataModel]? {
        didSet {
            guard let modelArray = collectionViewDataArray else {
                return
            }
            self.dataArray = modelArray
            self.collectionView.reloadData()
        }
    }
}

extension TRHomeNewsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TRHomeNewsCollectionViewCellID, for: indexPath) as! TRHomeNewsCollectionViewCell
        cell.productLastDataModel = self.dataArray?[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: true)
        
        guard let cellDidSelectItem = cellDidSelectItem else { return }
        cellDidSelectItem(collectionView, indexPath)
    }
}
