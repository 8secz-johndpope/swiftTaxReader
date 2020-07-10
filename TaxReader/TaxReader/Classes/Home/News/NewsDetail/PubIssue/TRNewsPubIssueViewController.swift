//
//  TRNewsPubIssueViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/6/17.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

protocol TRNewsPubIssueViewControllerDelegate: NSObjectProtocol {
    func popToPubIssueViewWithSelectedModel(model: TRProductGetPubIssueByYearDataModel?)
}

class TRNewsPubIssueViewController: TRBaseViewController {
    
    weak var delegate: TRNewsPubIssueViewControllerDelegate?
    
    var productDetailDataModel: TRProductDetailDataModel?
    convenience init(productDetailDataModel: TRProductDetailDataModel?) {
        self.init()
        self.productDetailDataModel = productDetailDataModel
    }
    
    lazy var navView: LXNavigationBarView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "往期浏览"
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.red
        
        return view
    }()
    
    lazy var yearView: TRNewsYearView = {
        let view = TRNewsYearView.init(frame: .zero)
        view.backgroundColor = UIColor.orange
        view.delegate = self
        
        return view
    }()
    
    lazy var yearContentView: TRNewsYearContentView = {
        let view = TRNewsYearContentView.init(frame: .zero)
        view.backgroundColor = UIColor.yellow
        view.delegate = self
        
        return view
    }()
    
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
        
        self.contentView.addSubview(self.yearView)
        self.yearView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(80)
        }
        
        self.contentView.addSubview(self.yearContentView)
        self.yearContentView.snp.makeConstraints { (make) in
            make.left.equalTo(self.yearView.snp.right)
            make.top.bottom.right.equalToSuperview()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        NetworkHomeProductGetYearPubIssue()
    }
    
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRNewsPubIssueViewController {
    func NetworkHomeProductGetYearPubIssue() {
        networkViewModel.updateBlock = {[unowned self] in
            if self.networkViewModel.productGetPubYearIssueModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.productGetPubYearIssueModel?.msg ?? "", view: self.view)
                return
            }
            
            self.yearView.dataArrayPubIssueDataModel = self.networkViewModel.productGetPubYearIssueModel?.data
        }
        
        let pubID = "\(self.productDetailDataModel?.PubID ?? 0)"
        networkViewModel.refreshDataSource_productGetYearPubIssue(PubIssueID: "", PubID: pubID, Year: "")
    }
}

extension TRNewsPubIssueViewController: TRNewsYearViewDelegate {
    func tableViewDidSelectRowAt(_ tableView: UITableView, indexPath: IndexPath, modelYear: String?) {
        NetworkHomeProductGetPubIssueByYear(selectedModelYear: modelYear ?? "")
    }
    
    func NetworkHomeProductGetPubIssueByYear(selectedModelYear: String) {
        networkViewModel.updateBlock = {[unowned self] in
            if self.networkViewModel.productGetPubIssueByYearModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.productGetPubIssueByYearModel?.msg ?? "", view: self.view)
                return
            }
            
            self.yearContentView.dataArrayPubIssueByYearDataModel = self.networkViewModel.productGetPubIssueByYearModel?.data
        }
        
        let pubID = "\(self.productDetailDataModel?.PubID ?? 0)"
        networkViewModel.refreshDataSource_productGetPubIssueByYear(PubIssueID: "", PubID: pubID, Year: selectedModelYear)
    }
}

extension TRNewsPubIssueViewController: TRNewsYearContentViewDelegate {
    func collectionViewDidSelectRowAt(_ collectionView: UICollectionView, indexPath: IndexPath, model: TRProductGetPubIssueByYearDataModel?) {
        if (self.delegate != nil) && ((self.delegate?.responds(to: Selector.init(("didSelectRowAt")))) != nil) {
            self.delegate?.popToPubIssueViewWithSelectedModel(model: model)
            self.navigationController?.popViewController(animated: true)
        }
    }
}


