//
//  TRMeInfoViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/25.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding

let itemInfoHeight = 55 + 12

class TRMeInfoViewController: UIViewController{
    
    var areaTreePath:String? // 注册接口，4000-1-2
    var areaAddress:String? // 注册接口，河南省 信阳市 罗山县
    var sexUserGender: Int = 0
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "基本信息"
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return view
    }()
    
    lazy var scrollView: TPKeyboardAvoidingScrollView = {
        let scrollView = TPKeyboardAvoidingScrollView.init(frame: .zero)
        scrollView.backgroundColor = UIColor.white
        scrollView.contentSize = CGSize.init(width: LXScreenWidth, height: LXScreenHeight)
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true

        
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.cyan
        
        return view
    }()
    
    // 单行
    lazy var accountView: TRInfoAccountView = {
        let view = TRInfoAccountView.init(frame: .zero)
        
        return view
    }()
    
    lazy var nickNameView: TRInfoNickNameView = {
        let view = TRInfoNickNameView.init(frame: .zero)
        
        return view
    }()
    
    lazy var nameView: TRInfoNameView = {
        let view = TRInfoNameView.init(frame: .zero)
        
        return view
    }()
    
    lazy var sexView: TRInfoSexView = {
        let view = TRInfoSexView.init(frame: .zero)
        view.footerButtonClick = {[weak self](button) in
            self?.blockSexButtonClick(button: button)
        }
        
        return view
    }()
    
    lazy var birthdayView: TRInfoBirthdayView = {
        let view = TRInfoBirthdayView.init(frame: .zero)
        view.birthdayCoverTap = {[weak self](sender: UITapGestureRecognizer) in
            let pickView = TQDatePickerView(type: .KDatePickerDate)
            pickView.sucessReturnB = {[weak self] (date: String) in
                view.trBirthdatLabel.text = date
            }
            pickView.show()
        }
        
        return view
    }()

    lazy var phoneView: TRInfoPhoneView = {
        let view = TRInfoPhoneView.init(frame: .zero)
        
        return view
    }()

    lazy var areaView: TRInfoAreaView = {
        let view = TRInfoAreaView.init(frame: .zero)
        view.areaCoverTap = {[weak self](sender: UITapGestureRecognizer) in
            let nextVc = TRRegisterAreaViewController()
            nextVc.delegate = self
            self?.present(nextVc, animated: true, completion: nil)
        }
        
        return view
    }()
    
    lazy var footerView: LXFooterButtonTwoView = {
        let view = LXFooterButtonTwoView.init(frame: .zero)
        view.footerButtonClick = {[weak self](button) in
            self?.blockFooterButtonClick(button: button)
        }
        
        return view
    }()
    
    override func viewDidLayoutSubviews() {
        self.contentView.snp.updateConstraints { (make) in
            make.height.equalTo(self.footerView.frame.origin.y + self.footerView.frame.size.height)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = LXTableViewBackgroundColor
        
        setupLayout()
        NetworkDataInfo()
    }
    
    lazy var viewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRMeInfoViewController {
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
        
        self.scrollView.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(1000)
        }
        
        // 单行
        self.contentView.addSubview(self.accountView)
        self.accountView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(itemInfoHeight + 30)
        }
        
        self.contentView.addSubview(self.nickNameView)
        self.nickNameView.snp.makeConstraints { (make) in
            make.top.equalTo(self.accountView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemInfoHeight)
        }
        
        self.contentView.addSubview(self.nameView)
        self.nameView.snp.makeConstraints { (make) in
            make.top.equalTo(self.nickNameView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemInfoHeight)
        }

        self.contentView.addSubview(self.sexView)
        self.sexView.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemInfoHeight)
        }

        self.contentView.addSubview(self.birthdayView)
        self.birthdayView.snp.makeConstraints { (make) in
            make.top.equalTo(self.sexView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemInfoHeight)
        }

        self.contentView.addSubview(self.phoneView)
        self.phoneView.snp.makeConstraints { (make) in
            make.top.equalTo(self.birthdayView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemInfoHeight + 30)
        }

        self.contentView.addSubview(self.areaView)
        self.areaView.snp.makeConstraints { (make) in
            make.top.equalTo(self.phoneView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemInfoHeight)
        }
        
        self.contentView.addSubview(self.footerView)
        self.footerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.areaView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemInfoHeight + 30)
        }
        
    }
}


extension TRMeInfoViewController {
    func NetworkDataInfo() {
        viewModel.updateBlock = {[unowned self] in
            self.initViewDataWithModel()
        }
        viewModel.refreshDataSource_Info()
    }
    
    func initViewDataWithModel() {
        self.accountView.trTextField.text = self.viewModel.userInfoModel?.data?.UserName
        self.nickNameView.trTextField.text = self.viewModel.userInfoModel?.data?.UserNickName
        self.nameView.trTextField.text = self.viewModel.userInfoModel?.data?.UserRealName
        self.birthdayView.trBirthdatLabel.text = self.viewModel.userInfoModel?.data?.UserBirthDate
        self.phoneView.trTextField.text = self.viewModel.userInfoModel?.data?.UserMobile
        self.areaView.trAreaLabel.text = self.viewModel.userInfoModel?.data?.AreaFullName
        self.sexView.userGender = self.viewModel.userInfoModel?.data?.UserGender
    }
}

extension TRMeInfoViewController {
    func blockSexButtonClick(button: UIButton) {
        self.sexUserGender = button.tag
    }
    
    func blockFooterButtonClick(button: UIButton) {
        if button.tag == 1 {// 重置
            initViewDataWithModel()
        }
        
        if button.tag == 2 {// 确定
            NetWorkDataUpInfo()
        }
    }
    
    func NetWorkDataUpInfo() {
        viewModel.updateBlock = {[unowned self] in
            self.navigationController?.popViewController(animated: true)
        }
        
        let nickName = self.nickNameView.trTextField.text ?? ""
        let realName = self.nameView.trTextField.text ?? ""
        let sexGender = "\(self.sexUserGender)"
        let birthdayDate = self.birthdayView.trBirthdatLabel.text ?? ""
        
        let viewModelTreePath = self.viewModel.userInfoModel?.data?.AreaTreePath ?? ""
        let areaTreePath = (self.areaTreePath?.isBlank ?? true) ? viewModelTreePath : self.areaTreePath
        
        if nickName.isBlank {
            MBProgressHUD.showWithText(text: "请输入昵称", view: (self.view)!)
            return
        }
        if realName.isBlank {
            MBProgressHUD.showWithText(text: "请输入姓名", view: (self.view)!)
            return
        }

        if sexGender.isBlank {
            MBProgressHUD.showWithText(text: "请选择性别", view: (self.view)!)
            return
        }
        
        if birthdayDate.isBlank {
            MBProgressHUD.showWithText(text: "请选择出生日期", view: (self.view)!)
            return
        }
        
        if areaTreePath?.isBlank ?? false {
            MBProgressHUD.showWithText(text: "请选择地区", view: (self.view)!)
            return
        }
        
        viewModel.refreshDataSource_UpInfo(UserNickName: nickName,
                                           UserRealName: realName,
                                           UserGender: sexGender,
                                           UserBirthDate: birthdayDate,
                                           AreaTreePath: areaTreePath ?? "")
    }
}

extension TRMeInfoViewController: TRRegisterAreaVCDelegate{
    func delegateAreaReverseValue(address: String?, areaTreePath: String?) {
        // 对返回的 address 进行处理 显示在页面上 不需要空格
        // 返回的 address 带有空格 用来进行接口传值
        let showAddress = address?.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        self.areaView.trAreaLabel.text = showAddress
        self.areaAddress = address
        
        // 返回的 areaTreePath "4000,1,2" 需要的格式为 4000-1-2
        let interAreaTreePath = areaTreePath?.replacingOccurrences(of: ",", with: "-", options: .literal, range: nil)
        self.areaTreePath = interAreaTreePath
        
        print("address = \(String(describing: address)) + showAddress = \(String(describing: showAddress))")
        print("areaTreePath = \(String(describing: address)) + interAreaTreePath = \(String(describing: interAreaTreePath))")
    }
}

