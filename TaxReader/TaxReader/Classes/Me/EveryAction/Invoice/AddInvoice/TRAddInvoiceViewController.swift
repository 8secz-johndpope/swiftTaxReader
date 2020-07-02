//
//  TRAddInvoiceViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/25.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding

class TRAddInvoiceViewController: UIViewController {
    
    var navTitle: String?
    var invoiceInfoDataModel: TRInvoiceInfoDataModel?
    convenience init(navTitle: String?,invoiceInfoDataModel: TRInvoiceInfoDataModel) {
        self.init()
        
        self.navTitle = navTitle
        self.invoiceInfoDataModel = invoiceInfoDataModel
    }
    
    var headerButtonTag:Int = 1
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = self.navTitle
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return view
    }()
    
    lazy var headerView: TRAddInvoiceHeaderView = {
        let view = TRAddInvoiceHeaderView.init(frame: .zero)
        view.footerButtonClick = {[weak self](button) in
            self?.blockHeaderButtonClick(button: button)
        }
        
        return view
    }()
    
    lazy var backViewInput: UIView = {
        let view = UIView.init(frame: .zero)
        
        return view
    }()
    
    // 个人
    lazy var backViewPerson: UIView = {
        let view = UIView.init(frame: .zero)
        
        return view
    }()
    
    lazy var scrollViewPerson: TPKeyboardAvoidingScrollView = {
        let scrollView = TPKeyboardAvoidingScrollView.init(frame: .zero)
        scrollView.contentSize = CGSize.init(width: LXScreenWidth, height: LXScreenHeight)
        
        return scrollView
    }()
    
    lazy var contentViewPerson: UIView = {
        let view = UIView.init(frame: .zero)
        
        return view
    }()
    
    lazy var personView: TRAddInvoicePersonView = {
        let view = TRAddInvoicePersonView.init(frame: .zero)
        view.delegate = self
        
        view.nameView.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceTitle
        view.phoneView.trTextField.text = self.invoiceInfoDataModel?.UserInvoicePhone
        view.emailView.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceEmail
        
        return view
    }()
    
    lazy var backViewCompany: UIView = {
        let view = UIView.init(frame: .zero)
        
        return view
    }()
    
    lazy var scrollViewCompany: TPKeyboardAvoidingScrollView = {
        let scrollView = TPKeyboardAvoidingScrollView.init(frame: .zero)
        scrollView.contentSize = CGSize.init(width: LXScreenWidth, height: LXScreenHeight)
        
        return scrollView
    }()
    
    lazy var contentViewCompany: UIView = {
        let view = UIView.init(frame: .zero)
        
        return view
    }()
    
    

    // 企业
    lazy var companyView: TRAddVoiceCompanyView = {
        let view = TRAddVoiceCompanyView.init(frame: .zero)
        view.delegate = self
        
        view.nameView.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceTitle
        view.codeView.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceTaxpayerNo
        view.addressView.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceorAddress
        view.phoneView.trTextField.text = self.invoiceInfoDataModel?.UserInvoicePhone
        view.bankView.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceBuyerBankName
        view.bankNumberView.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceBankAcount
        view.phoneView2.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceBuyerTel
        view.emailView2.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceEmail

        return view
    }()
    
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.headerView)
        self.headerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(64)
        }
        
        self.view.addSubview(self.backViewInput)
        self.backViewInput.snp.makeConstraints { (make) in
            make.top.equalTo(self.headerView.snp.bottom).offset(10)
            make.left.bottom.right.equalToSuperview()
        }
        
        // 个人
        self.backViewInput.addSubview(self.backViewPerson)
        self.backViewPerson.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(450)
        }
        
        self.backViewPerson.addSubview(self.scrollViewPerson)
        self.scrollViewPerson.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }

        self.scrollViewPerson.addSubview(self.contentViewPerson)
        self.contentViewPerson.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(450)
        }
        
        self.contentViewPerson.addSubview(self.personView)
        self.personView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(430)
        }
        
        
        // 企业
        self.backViewInput.addSubview(self.backViewCompany)
        self.backViewCompany.snp.makeConstraints { (make) in
            make.top.equalTo(self.backViewPerson.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(0)
        }
        
        self.backViewCompany.addSubview(self.scrollViewCompany)
        self.scrollViewCompany.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }

        self.scrollViewCompany.addSubview(self.contentViewCompany)
        self.contentViewCompany.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(790)
        }
        
        self.contentViewCompany.addSubview(self.companyView)
        self.companyView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(782) // // 782
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if self.invoiceInfoDataModel?.UserInvoiceReceiveType == 1 { // 个人
            self.headerView.isHidden = true
            self.headerView.snp.updateConstraints { (make) in
                make.height.equalTo(0)
            }
            
            self.backViewPerson.snp.updateConstraints { (make) in
                make.height.equalTo(450)
            }
            
            self.backViewCompany.snp.updateConstraints { (make) in
                make.height.equalTo(0)
            }
        }
        
        if self.invoiceInfoDataModel?.UserInvoiceReceiveType == 2 { // 企业
            self.headerView.isHidden = true
            self.headerView.snp.updateConstraints { (make) in
                make.height.equalTo(0)
            }
            
            self.backViewPerson.snp.updateConstraints { (make) in
                make.height.equalTo(0)
            }
            
            self.backViewCompany.snp.updateConstraints { (make) in
                make.height.equalTo(LXScreenHeight - LXNavBarHeight - 10)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        view.backgroundColor = LXTableViewBackgroundColor
    }
    
    lazy var viewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRAddInvoiceViewController {
    func blockHeaderButtonClick(button: UIButton) {
        self.headerButtonTag = button.tag
        
        if button.tag == 2 {
            self.backViewPerson.snp.updateConstraints { (make) in
                make.height.equalTo(0)
            }
            
            self.backViewCompany.snp.updateConstraints { (make) in
                make.height.equalTo(LXScreenHeight - LXNavBarHeight - 74)
            }
            
        } else {
            self.backViewPerson.snp.updateConstraints { (make) in
                make.height.equalTo(450)
            }
            
            self.backViewCompany.snp.updateConstraints { (make) in
                make.height.equalTo(0)
            }
        }
    }
}

extension TRAddInvoiceViewController: TRAddInvoicePersonViewDelegate {
    func footerViewResetButtonAction(button: UIButton, view: TRAddInvoicePersonView) {
        if self.invoiceInfoDataModel?.UserInvoiceReceiveType == 1 {
            view.nameView.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceTitle
            view.phoneView.trTextField.text = self.invoiceInfoDataModel?.UserInvoicePhone
            view.emailView.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceEmail
        } else {
            view.nameView.trTextField.text = ""
            view.phoneView.trTextField.text = ""
            view.emailView.trTextField.text = ""
        }
    }
    
    func footerViewCommitButtonAction(button: UIButton, view: TRAddInvoicePersonView) {
        let nameText = view.nameView.trTextField.text ?? ""
        let phoneText = view.phoneView.trTextField.text ?? ""
        let emailText = view.emailView.trTextField.text ?? ""
        
        if self.invoiceInfoDataModel?.UserInvoiceReceiveType == 1 {
            viewModel.updateBlock = {[unowned self] in
                MBProgressHUD.showWithText(text: self.viewModel.invoiceAddModel?.msg ?? "", view: self.view)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    if self.viewModel.invoiceAddModel?.msgCode == 200 {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
            viewModel.refreshDataSource_InvoiceEdit(UserInvoiceID: "\(self.invoiceInfoDataModel?.UserInvoiceID ?? 0)",
                                                   UserID: "",
                                                   UserInvoiceReceiveType: "1",
                                                   UserInvoiceTitle: nameText,
                                                   UserInvoiceContent: "",
                                                   UserInvoicePhone: phoneText,
                                                   UserInvoiceEmail: emailText,
                                                   UserInvoiceTaxpayerNo: "",
                                                   UserInvoiceorAddress: "",
                                                   UserInvoiceBuyerTel: "",
                                                   UserInvoiceBuyerBankName: "",
                                                   UserInvoiceBankAcount: "",
                                                   UserInvoiceDefault: "0")
        }else {
            viewModel.updateBlock = {[unowned self] in
                MBProgressHUD.showWithText(text: self.viewModel.invoiceAddModel?.msg ?? "", view: self.view)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    if self.viewModel.invoiceAddModel?.msgCode == 200 {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
            viewModel.refreshDataSource_InvoiceAdd(UserInvoiceID: "",
                                                   UserID: "",
                                                   UserInvoiceReceiveType: "1",
                                                   UserInvoiceTitle: nameText,
                                                   UserInvoiceContent: "",
                                                   UserInvoicePhone: phoneText,
                                                   UserInvoiceEmail: emailText,
                                                   UserInvoiceTaxpayerNo: "",
                                                   UserInvoiceorAddress: "",
                                                   UserInvoiceBuyerTel: "",
                                                   UserInvoiceBuyerBankName: "",
                                                   UserInvoiceBankAcount: "",
                                                   UserInvoiceDefault: "0")
        }
    }
}

extension TRAddInvoiceViewController: TRAddVoiceCompanyViewDelegate {
    func footerViewResetButtonAction(button: UIButton, view: TRAddVoiceCompanyView) {
        if self.invoiceInfoDataModel?.UserInvoiceReceiveType == 2 {
            view.nameView.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceTitle
            view.codeView.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceTaxpayerNo
            view.addressView.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceorAddress
            view.phoneView.trTextField.text = self.invoiceInfoDataModel?.UserInvoicePhone
            view.bankView.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceBuyerBankName
            view.bankNumberView.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceBankAcount
            view.phoneView2.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceBuyerTel
            view.emailView2.trTextField.text = self.invoiceInfoDataModel?.UserInvoiceEmail
        }else {
            view.nameView.trTextField.text = ""
            view.codeView.trTextField.text = ""
            view.addressView.trTextField.text = ""
            view.phoneView.trTextField.text = ""
            view.bankView.trTextField.text = ""
            view.bankNumberView.trTextField.text = ""
            view.phoneView2.trTextField.text = ""
            view.emailView2.trTextField.text = ""
        }
    }
    
    func footerViewCommitButtonAction(button: UIButton, view: TRAddVoiceCompanyView) {
        let nameViewText = view.nameView.trTextField.text ?? ""
        let codeViewText = view.codeView.trTextField.text ?? ""
        let addressViewText = view.addressView.trTextField.text ?? ""
        let phoneViewText = view.phoneView.trTextField.text ?? ""
        let bankViewText = view.bankView.trTextField.text ?? ""
        let bankNumberViewText = view.bankNumberView.trTextField.text ?? ""
        let phoneView2Text = view.phoneView2.trTextField.text ?? ""
        let emailView2Text = view.emailView2.trTextField.text ?? ""
        
        if self.invoiceInfoDataModel?.UserInvoiceReceiveType == 2 {
            viewModel.updateBlock = {[unowned self] in
                MBProgressHUD.showWithText(text: self.viewModel.invoiceAddModel?.msg ?? "", view: self.view)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    if self.viewModel.invoiceAddModel?.msgCode == 200 {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
            
            viewModel.refreshDataSource_InvoiceEdit(UserInvoiceID: "\(self.invoiceInfoDataModel?.UserInvoiceID ?? 0)",
                                                   UserID: "",
                                                   UserInvoiceReceiveType: "2",
                                                   UserInvoiceTitle: nameViewText,
                                                   UserInvoiceContent: "",
                                                   UserInvoicePhone: phoneViewText,
                                                   UserInvoiceEmail: emailView2Text,
                                                   UserInvoiceTaxpayerNo: codeViewText,
                                                   UserInvoiceorAddress: addressViewText,
                                                   UserInvoiceBuyerTel: phoneView2Text,
                                                   UserInvoiceBuyerBankName: bankViewText,
                                                   UserInvoiceBankAcount: bankNumberViewText,
                                                   UserInvoiceDefault: "")
        }else {
            viewModel.updateBlock = {[unowned self] in
                MBProgressHUD.showWithText(text: self.viewModel.invoiceAddModel?.msg ?? "", view: self.view)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    if self.viewModel.invoiceAddModel?.msgCode == 200 {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
            
            viewModel.refreshDataSource_InvoiceAdd(UserInvoiceID: "",
                                                   UserID: "",
                                                   UserInvoiceReceiveType: "2",
                                                   UserInvoiceTitle: nameViewText,
                                                   UserInvoiceContent: "",
                                                   UserInvoicePhone: phoneViewText,
                                                   UserInvoiceEmail: emailView2Text,
                                                   UserInvoiceTaxpayerNo: codeViewText,
                                                   UserInvoiceorAddress: addressViewText,
                                                   UserInvoiceBuyerTel: phoneView2Text,
                                                   UserInvoiceBuyerBankName: bankViewText,
                                                   UserInvoiceBankAcount: bankNumberViewText,
                                                   UserInvoiceDefault: "")
        }
        
    }
}
