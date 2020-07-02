//
//  TRBuyActionContentDanView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/26.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRBuyActionContentDanViewBlock = (_ valueModelArray: [TRProductGetIssueNumberDataBatchModel]?) ->Void

class TRBuyActionContentDanView: UIView {
    
    var selectedItemValueModelArrayBlock: TRBuyActionContentDanViewBlock?
    
    var dataArray: [TRProductGetIssueNumberDataBatchModel]?
    var dataArraySelectedModel: NSMutableArray = NSMutableArray.init()
    
    lazy var trContentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    let identific = "TRBuyActionDanCollectionViewCell"
    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        let itemWidth = (LXScreenWidth - 7 * 4) / 6.5
        layout.itemSize = CGSize.init(width: itemWidth, height: itemWidth * 0.5)
        layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib.init(nibName: identific, bundle: nil), forCellWithReuseIdentifier: identific)
        
        return collectionView
    }()

    
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(44)
        }

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dataArrayDan: [TRProductGetIssueNumberDataBatchModel]? {
        didSet {
            guard let dataArray = dataArrayDan else {
                return
            }
            
            self.dataArray = dataArray
            for _ in 0..<self.dataArray!.count {
                let kongModel = TRProductGetIssueNumberDataBatchModel.init()
                self.dataArraySelectedModel.add(kongModel)
            }
        }
    }
}

extension TRBuyActionContentDanView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identific, for: indexPath) as! TRBuyActionDanCollectionViewCell
        cell.delegate = self
        cell.trBatchButton.tag = indexPath.row
        
        let model: TRProductGetIssueNumberDataBatchModel? = self.dataArray?[indexPath.row]
        cell.batchModel = model
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: true)
        
    }
}

extension TRBuyActionContentDanView: TRBuyActionDanCollectionViewCellDelegate {
    func collectionViewItemButtonDidSelectRowAt(button: UIButton) {
        let buttonTag = button.tag
        let model: TRProductGetIssueNumberDataBatchModel = (self.dataArray?[buttonTag])!
        print("buttonTag = \(buttonTag) isSelected = \(model.isSelected) count = \(self.dataArraySelectedModel.count)")
        
        if button.isSelected {
            self.dataArraySelectedModel.replaceObject(at: buttonTag, with: model)
        } else {
            let kongModel = TRProductGetIssueNumberDataBatchModel.init()
            self.dataArraySelectedModel.replaceObject(at: buttonTag, with: kongModel)
        }
        
        print("count = \(self.dataArraySelectedModel.count)")
        
        var valueModelArray: [TRProductGetIssueNumberDataBatchModel]? = []
        for lindex in 0..<self.dataArraySelectedModel.count {
            let model: TRProductGetIssueNumberDataBatchModel = self.dataArraySelectedModel[lindex] as! TRProductGetIssueNumberDataBatchModel
            if model.ProdID != 0 {
                valueModelArray?.append(model)
            }
        }
        
        guard let selectedItemValueModelArrayBlock = selectedItemValueModelArrayBlock else { return }
        selectedItemValueModelArrayBlock(valueModelArray)
    }
}

