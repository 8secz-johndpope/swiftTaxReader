//
//  TROrderTicketTypeViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TROrderTicketTypeViewControllerBlock = (_ userInvoiceID: String, _ selectedInvoiceType: String) ->Void

class TROrderTicketTypeViewController: UIViewController {
    
    var presentBackCommitBlock: TROrderTicketTypeViewControllerBlock?
    
    var userInvoiceID: String?
    var selectedInvoiceType: String? = "个人发票"
    
    lazy var titleHeaderView: TRTicketTypeHeaderView = {
        let view = TRTicketTypeHeaderView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.cancelButtonClickBlock = {[weak self](button) in
            self?.selectedInvoiceType = "不开发票"
            self?.presentingViewController?.dismiss(animated: true, completion: nil)
        }
        
        return view
    }()
    
    lazy var selectOpenView: TRTicketTypeSelectOpenView = {
        let view = TRTicketTypeSelectOpenView.init(frame: .zero)
        view.footerButtonClick = {[weak self](button) in
            self?.blockOpenContentButtonClick(button: button)
        }
        
        return view
    }()
    
    lazy var openContentView: TRTicketTypeOpenContentView = {
        let view = TRTicketTypeOpenContentView.init(frame: .zero)
        
        return view
    }()
    
    lazy var headerTypeView: TRTicketTypeHeaderTypeView = {
        let view = TRTicketTypeHeaderTypeView.init(frame: .zero)
        view.footerButtonClick = {[weak self](button) in
            self?.blockHeaderTypeButtonClick(button: button)
        }
        
        return view
    }()
    
    lazy var backListView: TRTicketTypeListView = {
        let view = TRTicketTypeListView.init(frame: .zero)
        view.listViewCellEditButtonClickBloclk = {[unowned self](button, infoDataModel) in
            self.blockCellEditButtonClick(button: button, invoiceInfoDataModel: infoDataModel)
        }
        
        view.listViewCellSelectedButtonClickBloclk = {[unowned self](button, infoDataModel) in
            self.blockCellSelectedButtonClick(button: button, invoiceInfoDataModel: infoDataModel)
        }
        
        return view
    }()
        
    lazy var bottomView: TRTicketTypeBottomView = {
        let view = TRTicketTypeBottomView.init(frame: .zero)
        view.footerButtonClickBlock = {[weak self](button) in
            self?.blockBottomButtonClick(button: button)
        }
        
        return view
    }()
    
    func setupLayout() {
        self.view.addSubview(self.titleHeaderView)
        self.titleHeaderView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(64)
        }
        
        self.view.addSubview(self.selectOpenView)
        self.selectOpenView.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleHeaderView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(64)
        }
        
        self.view.addSubview(self.bottomView)
        self.bottomView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(64)
        }
        
        self.view.addSubview(self.openContentView)
        self.openContentView.snp.makeConstraints { (make) in
            make.top.equalTo(self.selectOpenView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.bottomView.snp.top)
        }
        
        self.openContentView.addSubview(self.headerTypeView)
        self.headerTypeView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(64)
        }
        
        self.openContentView.addSubview(self.backListView)
        self.backListView.snp.makeConstraints { (make) in
            make.top.equalTo(self.headerTypeView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }
    
    // PresentViewController 隐藏导航条
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupLayout()
        NetWorkInvoiceInfo()
    }
    
    lazy var viewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TROrderTicketTypeViewController {
    func NetWorkInvoiceInfo() {
        viewModel.updateBlock = {[unowned self] in
            
            if self.viewModel.invoiceInfoModel?.ret == false {
                MBProgressHUD.showWithText(text: self.viewModel.invoiceInfoModel?.msg ?? "", view: self.view)
                
                // 3000 authorization参数不能为空
                if self.viewModel.invoiceInfoModel?.msgCode == NetDataAuthorizationNull {
                    let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                        let popoverView = TRWLoginViewController()
                        popoverView.modalPresentationStyle = .custom
                        popoverView.isTypeShowFromTokenNull = true
                        popoverView.loginReloadBlock = {[unowned self] in
                            self.NetWorkInvoiceInfo()
                        }
                        self.present(popoverView, animated: true, completion: nil)
                    }
                    self.present(alertController, animated: true, completion: nil)
                }
                
                return
            }
            
            self.backListView.dataArrayInvoiceInfoDataModel = self.viewModel.invoiceInfoModel?.data
        }
        viewModel.refreshDataSource_InvoiceInfo()
    }
}

extension TROrderTicketTypeViewController {
    func blockOpenContentButtonClick(button: UIButton) {
        if button.tag == 2 {
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
}

extension TROrderTicketTypeViewController {
    func blockHeaderTypeButtonClick(button: UIButton) {
        self.backListView.isTypePerson = button.tag == 1 ? true : false
        self.selectedInvoiceType = button.tag == 1 ? "个人发票" : "企业发票"
    }
}

extension TROrderTicketTypeViewController {
    func blockBottomButtonClick(button: UIButton) {
        guard let presentBackCommitBlock = presentBackCommitBlock else { return }
        presentBackCommitBlock(self.userInvoiceID ?? "", self.selectedInvoiceType ?? "个人发票")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

extension TROrderTicketTypeViewController {
    func blockCellSelectedButtonClick(button: UIButton, invoiceInfoDataModel: TRInvoiceInfoDataModel) {
        print("\(String(describing: invoiceInfoDataModel.UserInvoiceID))")
        self.userInvoiceID = "\(invoiceInfoDataModel.UserInvoiceID)"
    }
    
    func blockCellEditButtonClick(button: UIButton, invoiceInfoDataModel: TRInvoiceInfoDataModel) {
        let nextVc = TRAddInvoiceViewController(navTitle: "编辑开票信息", invoiceInfoDataModel: invoiceInfoDataModel)
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}

