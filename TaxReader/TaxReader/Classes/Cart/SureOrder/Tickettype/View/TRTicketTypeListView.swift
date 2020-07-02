//
//  TRTicketTypeListView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/10.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRTicketTypeListViewEditBlock = (_ button: UIButton, _ model: TRInvoiceInfoDataModel) ->Void
typealias TRTicketTypeListViewSelectedBlock = (_ button: UIButton, _ model: TRInvoiceInfoDataModel) ->Void

class TRTicketTypeListView: UIView {
    
    var listViewCellEditButtonClickBloclk: TRTicketTypeListViewEditBlock?
    var listViewCellSelectedButtonClickBloclk: TRTicketTypeListViewSelectedBlock?
    
    var dataArrayPerson: [TRInvoiceInfoDataModel]? = []
    var dataArrayCompany: [TRInvoiceInfoDataModel]? = []
    
    private lazy var trContentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.blue
        
        return view
    }()
    
    private lazy var personView: TRTicketTypeListPersonView = {
        let view = TRTicketTypeListPersonView.init()
        view.backgroundColor = UIColor.red
        view.cellPersonEditButtonClickBlock = {[unowned self](button, infoDataModel) in
            guard let listViewCellEditButtonClickBloclk = self.listViewCellEditButtonClickBloclk else { return }
            listViewCellEditButtonClickBloclk(button, infoDataModel)
        }
        
        view.cellPersonSelectedButtonClickBlock = {[unowned self](button, infoDataModel) in
            guard let listViewCellSelectedButtonClickBloclk = self.listViewCellSelectedButtonClickBloclk else { return }
            listViewCellSelectedButtonClickBloclk(button, infoDataModel)
        }
                
        return view
    }()
    
    private lazy var companyView: TRTicketTypeListCompanyView = {
        let view = TRTicketTypeListCompanyView.init()
        view.backgroundColor = UIColor.orange
        view.cellCompanyEditButtonClickBlock = {[unowned self](button, infoDataModel) in
            guard let listViewCellEditButtonClickBloclk = self.listViewCellEditButtonClickBloclk else { return }
            listViewCellEditButtonClickBloclk(button, infoDataModel)
        }
        
        view.cellCompanySelectedButtonClickBlock = {[unowned self](button, infoDataModel) in
            guard let listViewCellSelectedButtonClickBloclk = self.listViewCellSelectedButtonClickBloclk else { return }
            listViewCellSelectedButtonClickBloclk(button, infoDataModel)
        }
        
        return view
    }()

    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.companyView)
        self.companyView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.personView)
        self.personView.snp.makeConstraints { (make) in
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
    
    var isTypePerson: Bool? {
        didSet {
            guard let isTypePerson = isTypePerson else {
                return
            }
            self.personView.isHidden = isTypePerson ? false : true
            self.companyView.isHidden = isTypePerson ? true : false
        }
    }
    
    var dataArrayInvoiceInfoDataModel: [TRInvoiceInfoDataModel]? {
        didSet {
            guard let dataArray = dataArrayInvoiceInfoDataModel else {
                return
            }
            
            for lindex in 0..<dataArray.count{
                let infoModel:TRInvoiceInfoDataModel = dataArray[lindex]
                if infoModel.UserInvoiceReceiveType == 1 {
                    self.dataArrayPerson?.append(infoModel)
                }
                if infoModel.UserInvoiceReceiveType == 2 {
                    self.dataArrayCompany?.append(infoModel)
                }
            }
            
            self.personView.dataArrayInvoiceInfoDataModel = self.dataArrayPerson
            self.companyView.dataArrayInvoiceInfoDataModel = self.dataArrayCompany
        }
    }
    
}

