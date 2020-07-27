//
//  TRMoreRankViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/6/12.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRMoreRankViewController: TRBaseViewController {
    
    lazy var navView: UIView = {
        let view = LXNavigationBarSearchView.init(frame: .zero)
        view.isHasSeniorButton = false
        view.navBackButtonClickBlock = {[weak self](button) in
            self?.navigationController?.popViewController(animated: true)
        }
        
        view.navTextFieldShouldReturnBlock = {[weak self](textField) in
            let nextVc = TRArticleSearchViewController(searchText: textField.text, seniorModel: TROwnSeniorSearchModel.init())
            self?.navigationController?.pushViewController(nextVc, animated: true)
        }
        
        return view
    }()
    
    var dataArray: [TRProductRecdDataModel]? = []
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
    
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        NetworkHomeProductRect()
    }
    
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRMoreRankViewController {
    func NetworkHomeProductRect() {
        networkViewModel.homeRecdBlock = {[unowned self] in
            
            if self.networkViewModel.productRecdModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.productRecdModel?.msg ?? "", view: self.view)
                
                // 3000 authorization参数不能为空
                if self.networkViewModel.productRecdModel?.msgCode == NetDataAuthorizationNull {
                    let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                        let popoverView = TRWLoginViewController()
                        popoverView.modalPresentationStyle = .custom
                        popoverView.isTypeShowFromTokenNull = true
                        popoverView.loginReloadBlock = {[unowned self] in
                            self.NetworkHomeProductRect()
                        }
                        self.present(popoverView, animated: true, completion: nil)
                    }
                    self.present(alertController, animated: true, completion: nil)
                }
                
                return
            }

            
            self.dataArray = self.networkViewModel.productRecdModel?.data
            self.collectionView.reloadData()
        }
        
        networkViewModel.refreshDataSource_ProductRecd()
    }
}

extension TRMoreRankViewController: UICollectionViewDataSource, UICollectionViewDelegate {
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
        
        let model = self.dataArray?[indexPath.row]
        let nextVc = TRNewsDetailViewController(PubIssueID: "\(model?.ProdID ?? 0)")
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}
