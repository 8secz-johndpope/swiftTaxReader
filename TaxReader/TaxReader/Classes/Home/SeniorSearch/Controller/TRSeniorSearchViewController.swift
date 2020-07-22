//
//  TRSeniorSearchViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/7/21.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRSeniorSearchVCSearchButtonClickBlock = (_ button: UIButton, _ model: TROwnSeniorSearchModel?) ->Void

class TRSeniorSearchViewController: UIViewController {
    
    var footerButtonClickBlock: TRSeniorSearchVCSearchButtonClickBlock?
    var publicationDataModel: TRGetAllPublicationDataModel?
    
    var dataArray = [String]()
    
    fileprivate var coverVeiw = UIView()
    fileprivate var contentView = UIView()
    fileprivate var contentViewHeight: CGFloat {
        return 408
    }
    
    required init?(dataArray: [String]!) {
        super.init(nibName: nil, bundle: nil)
        // 初始化
        self.dataArray = dataArray;
        
        view.backgroundColor = UIColor.clear
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.modalPresentationStyle = .custom
        
        // 初始化UI
        setupUIViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            UIView.animate(withDuration: 0.25) {
                var center = self.contentView.center
                center.y = kScreenHeight * 0.5 - 44
                self.contentView.center = center
                
                var frame = self.contentView.frame
                frame.origin.x = 8
                frame.size.width = kScreenWidth - 16
                self.contentView.frame = frame
            }
            
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    lazy var seniorContentView: TRSeniorSearchView = {
        let view = TRSeniorSearchView.init(frame: .zero)
        view.textFieldKanmingBlock = {[unowned self](textField, view) in
            self.blockKanmingField()
        }
        
        view.footerButtonBlock = {[unowned self](button) in
            self.blockSearchFooterButtonClick(button: button)
        }
        
        return view
    }()
    
    func setupLayout() {
        self.contentView.addSubview(self.seniorContentView)
        self.seniorContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRSeniorSearchViewController {
    func blockSearchFooterButtonClick(button: UIButton) {
        let CataName = self.seniorContentView.trLanmuView.trSearchTextField.text ?? ""
        let TitleName = self.seniorContentView.trPianmingView.trSearchTextField.text ?? ""
        let AuthorName = self.seniorContentView.trAuthorView.trSearchTextField.text ?? ""
        let KeyWord = self.seniorContentView.trkeywordsView.trSearchTextField.text ?? ""
        let Content = self.seniorContentView.trQuanwenView.trSearchTextField.text ?? ""
        let MagazineIDs = "\(self.publicationDataModel?.PubID ?? 0)"
        
        let BeginYear = self.seniorContentView.trYearView.trStartYearSearchTextField.text ?? ""
        let EndYear = self.seniorContentView.trYearView.trEndYearSearchTextField.text ?? ""
        let BeginNo = self.seniorContentView.trYearView.trStartNumberSearchTextField.text ?? ""
        let EndNo = self.seniorContentView.trYearView.trEndNumberSearchTextField.text ?? ""
        
        let model: TROwnSeniorSearchModel = TROwnSeniorSearchModel.init()
        model.searchType = .seniorSearch
        
        model.CataName = CataName
        model.TitleName = TitleName
        model.AuthorName = AuthorName
        model.KeyWord = KeyWord
        model.Content = Content
        model.MagazineIDs = MagazineIDs
        
        model.BeginYear = BeginYear
        model.EndYear = EndYear
        model.BeginNo = BeginNo
        model.EndNo = EndNo
        
        sheetViewDismiss()
        guard let footerButtonClickBlock = footerButtonClickBlock else { return }
        footerButtonClickBlock(button, model)
    }
}

extension TRSeniorSearchViewController {
    func blockKanmingField() {
        guard let nextVc = TRPublicationViewController(dataArray: ["123","234"]) else { return }
        self.present(nextVc, animated: false, completion:  nil)
        nextVc.didSelectRowAtBlock = {[unowned self](model) in
            self.seniorContentView.trKanmingView.trSearchTextField.text = model.PubName
            self.publicationDataModel = model
        }
    }
}

// MARK: 初始化UI
extension TRSeniorSearchViewController {
    func setupUIViews() {
        coverVeiw = UIView(frame: CGRect(x: 0, y: 0, width:kScreenWidth, height: kScreenHeight))
        coverVeiw.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        view.addSubview(coverVeiw)
        
        contentView = UIView.init(frame: CGRect.init(x: 0, y: kScreenHeight, width: kScreenWidth, height: contentViewHeight))
        contentView.backgroundColor = UIColor.white
        coverVeiw.addSubview(contentView)
        contentView.layer.cornerRadius = 10.0
        
        setupLayout()
    }
}

// MARK: 点击屏幕弹出退出
extension TRSeniorSearchViewController {
    
    func sheetViewDismiss() {
        UIView.animate(withDuration: 0.25, animations: {
            var frame = self.contentView.frame
            frame.origin.y = kScreenHeight
            self.contentView.frame = frame
            self.coverVeiw.alpha = 0
            
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sheetViewDismiss()
    }
    
    @objc func cancelBtnDidClick(btn: UIButton) {
        sheetViewDismiss()
    }
}

