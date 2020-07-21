//
//  TRMoreNewsViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/4/3.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRMoreNewsViewController: UIViewController {
        
    var dataArrayReadTypeData: [TRproductReadTypeDataModel]? = []
    var dataArrayPubIssueData: [TRPublicationGetPubIssueListDataModel]? = []
    
    private var page: Int = 1
    
    lazy var navView: UIView = {
        let view = LXNavigationBarSearchView.init(frame: .zero)
        view.isHasSeniorButton = false
        view.navBackButtonClickBlock = {[weak self](button) in
            self?.navigationController?.popViewController(animated: true)
        }
        
        view.navTextFieldShouldReturnBlock = {[weak self](textField) in
            let nextVc = TRArticleSearchViewController(searchText: textField.text)
            self?.navigationController?.pushViewController(nextVc, animated: true)
        }
        
        return view
    }()
    
    lazy var dropView: TRMoreNewsDropView = {
        let view = TRMoreNewsDropView.init(frame: .zero)
        view.backgroundColor = UIColor.orange
        view.selectButtonClickBlock = {(button) in
            print(button.isSelected)
            button.isSelected = !button.isSelected
            self.dropContentView.isHidden = !button.isSelected
            self.dropView.trArrowImageView.image = button.isSelected ? UIImage.init(named: "LX下箭头") : UIImage.init(named: "LX上箭头")
        }
        
        return view
    }()
    
    lazy var dropContentView: TRDropContentView = {
        let view = TRDropContentView.init(frame: .zero)
        view.isHidden = true
        view.delegate = self
        
        return view
    }()
    
    let TRHomeNewsCollectionViewCellID = "TRHomeNewsCollectionViewCell"
    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: (LXScreenWidth - 3 * 4) / 2, height: CGFloat(TRHomeSectionNewseHeight - 8))
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 4
        let collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(TRHomeNewsCollectionViewCell.self, forCellWithReuseIdentifier: TRHomeNewsCollectionViewCellID)
        collectionView.uHead = URefreshHeader{ [weak self] in
            self?.NetworkHomePublicationGetPubIssueList(more: false, ReadType: "")
        }
        
        collectionView.uFoot = URefreshFooter{ [weak self] in
            self?.NetworkHomePublicationGetPubIssueList(more: true, ReadType: "")
        }
        
        return collectionView
    }()
    
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.dropView)
        self.dropView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.dropView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
        
        self.view.addSubview(self.dropContentView)
        self.dropContentView.snp.makeConstraints { (make) in
            make.top.equalTo(self.dropView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        
        setupLayout()
        NetworkHomeProductReadType()
        NetworkHomePublicationGetPubIssueList(more: false, ReadType: "")
    }
    
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRMoreNewsViewController {
    func NetworkHomeProductReadType() {
        networkViewModel.homeReadTypeBlock = {[unowned self] in
            if self.networkViewModel.productReadtypeModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.productReadtypeModel?.msg ?? "", view: self.view)
                return
            }
            
            self.dataArrayReadTypeData = self.networkViewModel.productReadtypeModel?.data
            self.dropContentView.dataArrayReadType = self.networkViewModel.productReadtypeModel?.data
        }
        
        networkViewModel.refreshDataSource_productReadType()
    }
    
    func NetworkHomePublicationGetPubIssueList(more: Bool, ReadType: String?) {
        networkViewModel.updateBlock = {[unowned self] in
            if self.networkViewModel.publicationGetPubIssueListModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.publicationGetPubIssueListModel?.msg ?? "", view: self.view)
                return
            }
            
            self.collectionView.uHead.endRefreshing()
            if self.dataArrayPubIssueData?.count == self.networkViewModel.publicationGetPubIssueListModel?.totalCount {
                self.collectionView.uFoot.endRefreshingWithNoMoreData()
            }else {
                self.collectionView.uFoot.endRefreshing()
            }
            
            if more == false { self.dataArrayPubIssueData?.removeAll() }
            self.dataArrayPubIssueData?.append(contentsOf: self.networkViewModel.publicationGetPubIssueListModel?.data ?? [])
            self.collectionView.reloadData()
        }
        
        page = (more ? ( page + 1) : 1)
        print("page = \(page)")
        networkViewModel.refreshDataSource_PublicationGetPubIssueList(ReadType: ReadType ?? "", PageIndex: "\(page)", PageSize: "10")
    }
}

extension TRMoreNewsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArrayPubIssueData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TRHomeNewsCollectionViewCellID, for: indexPath) as! TRHomeNewsCollectionViewCell
        cell.pubIssueDataModel = self.dataArrayPubIssueData?[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: true)
        
        let model = self.dataArrayPubIssueData?[indexPath.row]
        let nextVc = TRNewsDetailViewController(PubIssueID: model?.ReadSourceID)
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}

extension TRMoreNewsViewController: TRDropContentViewDelegate {
    func coverViewTapDisMiss() {
        self.dropContentView.isHidden = true
        self.dropView.trSelectButton.isSelected = false
    }
    
    func tableViewDidSelectRowAt(_ tableView: UITableView, indexPath: IndexPath, readTypeText: String?, readTypeID: String?) {
        self.dropView.trSelectButton.setTitle(readTypeText, for: .normal)
        self.dropContentView.isHidden = true
        self.dropView.trSelectButton.isSelected = false
        
        // 调用接口进行数据搜索
        NetworkHomePublicationGetPubIssueList(more: false, ReadType: readTypeID)
    }
}
