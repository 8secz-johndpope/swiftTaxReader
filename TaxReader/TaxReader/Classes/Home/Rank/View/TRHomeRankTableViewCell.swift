//
//  TRHomeRankTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/4/2.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRHomeRankTableViewCellDidSelectItemAtBlock = (_ collectionView: UICollectionView, _ indexPath: IndexPath) ->Void

class TRHomeRankTableViewCell: UITableViewCell {
    
    var cellDidSelectItem : TRHomeRankTableViewCellDidSelectItemAtBlock?
    
     var dataArray:[TRProductRecdDataModel]?

    let TRHomeRankCollectionViewCellID = "TRHomeRankCollectionViewCell"
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: (LXScreenWidth - 4 * 5) / 4, height: CGFloat((TRHomeSectionRankHeight - 3 * 4) / 2))
        layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(TRHomeRankCollectionViewCell.self, forCellWithReuseIdentifier: TRHomeRankCollectionViewCellID)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        
        return collectionView
    }();
    
    func setupCollectionView() {
        self.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var collectionViewDataArray:[TRProductRecdDataModel]? {
        didSet {
            guard let modelArray = collectionViewDataArray else {
                return
            }
            self.dataArray = modelArray
            self.collectionView.reloadData()
        }
    }
}

extension TRHomeRankTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TRHomeRankCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: TRHomeRankCollectionViewCellID, for: indexPath) as! TRHomeRankCollectionViewCell
        
         cell.rectDataModel = self.dataArray?[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: true)
        
        guard let cellDidSelectItem = cellDidSelectItem else { return }
        cellDidSelectItem(collectionView, indexPath)
    }
}
