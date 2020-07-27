//
//  TRHomeViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/4/1.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

let TRHomeSectionBanner = 0         // 轮播图
let TRHomeSectionNews = 1           // 最新期刊
let TRHomeSectionInfro = 2          // 推荐资讯
let TRHomeSectionArticle = 3        // 推荐文章
let TRHomeSectionRank = 4           // 排行榜

class TRHomeViewController: UIViewController {
    
    let headerTitleArray = ["", "最新期刊", "最新资讯", "推荐文章", "期刊推荐"]
    var dataArrayRotchart: [TRProductRotchartDataModel]? = []
    var dataArrayLast: [TRproductLastDataModel]? = []
    var dataArrayRecd: [TRProductRecdDataModel]? = []
    var dataArrayArticleGetTopNews: [TRArticleGettopnewsDataModel]? = []
    var dataArrayArticleRecd: [TRArticleDataRecdModel]? = []
    
    private let TRHomeHeaderViewID = "TRHomeHeaderView"
    private let TRHomeFooterViewID = "TRHomeFooterView"
    private let TRHomeBannerTableViewCellID = "TRHomeBannerTableViewCell"
    private let TRHomeNewsTableViewCellID = "TRHomeNewsTableViewCell"
    private let TRHomeInfroTableViewCellID = "TRHomeInfroTableViewCell"
    private let TRHomeArticleTableViewCellID = "TRHomeArticleTableViewCell"
    private let TRHomeRankTableViewCellID = "TRHomeRankTableViewCell"
    
    lazy var viewModel: TRHomeViewModel = {
        return TRHomeViewModel()
    }()
    
    lazy var navView: UIView = {
        let view = LXNavigationBarSearchView.init(frame: .zero)
        view.isFirstView = true
        view.isHasSeniorButton = true
        view.navTextFieldShouldReturnBlock = {[weak self](textField) in
            let nextVc = TRArticleSearchViewController(searchText: textField.text, seniorModel: TROwnSeniorSearchModel.init())
            self?.navigationController?.pushViewController(nextVc, animated: true)
        }
        
        view.navNextButtonClickBlock = {[weak self](button) in
            guard let nextVc = TRSeniorSearchViewController(dataArray: ["123","234"]) else { return }
            self?.present(nextVc, animated: false, completion:  nil)
            
            nextVc.footerButtonClickBlock = {[unowned self](button, model) in
                let nextVc = TRArticleSearchViewController(searchText: nil, seniorModel: model)
                self?.navigationController?.pushViewController(nextVc, animated: true)
            }
        }
        
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView.register(TRHomeHeaderView.self, forHeaderFooterViewReuseIdentifier: TRHomeHeaderViewID)
        tableView.register(TRHomeFooterView.self, forHeaderFooterViewReuseIdentifier: TRHomeFooterViewID)
        tableView.register(TRHomeBannerTableViewCell.self, forCellReuseIdentifier: TRHomeBannerTableViewCellID)
        tableView.register(TRHomeNewsTableViewCell.self, forCellReuseIdentifier: TRHomeNewsTableViewCellID)
        tableView.register(TRHomeInfroTableViewCell.self, forCellReuseIdentifier: TRHomeInfroTableViewCellID)
        tableView.register(TRHomeArticleTableViewCell.self, forCellReuseIdentifier: TRHomeArticleTableViewCellID)
        tableView.register(TRHomeRankTableViewCell.self, forCellReuseIdentifier: TRHomeRankTableViewCellID)
        
        return tableView
    }()
    
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        NetworkHomeProductRotchart()
        NetworkHomeProductLast()
        NetworkHomeArticleGetTopNews()
        NetworkHomeArticleRecd()
        NetworkHomeProductRect()
    }
    
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRHomeViewController {    
    func NetworkHomeProductRotchart() {
        networkViewModel.homeRotchartBlock = {[unowned self] in
            self.dataArrayRotchart = self.networkViewModel.productRotchartModel?.data
            self.tableView.reloadSections([0], with: .fade)
        }
        
        networkViewModel.refreshDataSource_ProductRotchart()
    }
    
    func NetworkHomeProductLast() {
        networkViewModel.homeproductLastBlock = {[unowned self] in
            self.dataArrayLast = self.networkViewModel.productLastModel?.data
            self.tableView.reloadSections([1], with: .fade)
        }
        
        networkViewModel.refreshDataSource_ProductLast()
    }
    
    func NetworkHomeArticleGetTopNews() {
        networkViewModel.homeArticleGetTopNewsBlock = {[unowned self] in
            self.dataArrayArticleGetTopNews = self.networkViewModel.articleGetTopNewsModel?.data
            self.tableView.reloadSections([2], with: .fade)
        }
        
        networkViewModel.refreshDataSource_ArticleGetTopNews(NewsID: "", Number: "2")
    }
    
    func NetworkHomeArticleRecd() {
        networkViewModel.homeArticleRecdBlock = {[unowned self] in
            self.dataArrayArticleRecd = self.networkViewModel.articleRecdModel?.data
            self.tableView.reloadSections([3], with: .fade)
        }
        
        networkViewModel.refreshDataSource_ArticleRecd()
    }
    
    func NetworkHomeProductRect() {
        networkViewModel.homeRecdBlock = {[unowned self] in
            self.dataArrayRecd = self.networkViewModel.productRecdModel?.data
            self.tableView.reloadSections([4], with: .fade)
        }
        
        networkViewModel.refreshDataSource_ProductRecd()
    }
}

extension TRHomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case TRHomeSectionBanner:
            let cell = tableView.dequeueReusableCell(withIdentifier: TRHomeBannerTableViewCellID, for: indexPath) as! TRHomeBannerTableViewCell
            cell.bannerArray = self.dataArrayRotchart
            
            return cell
            
        case TRHomeSectionNews:
            let cell = tableView.dequeueReusableCell(withIdentifier: TRHomeNewsTableViewCellID, for: indexPath) as! TRHomeNewsTableViewCell
            cell.collectionViewDataArray = self.dataArrayLast
            cell.cellDidSelectItem = {[weak self](collectionView, indexPath) in
                let productLastModel = self?.dataArrayLast?[indexPath.row]
                let nextVc = TRNewsDetailViewController(PubIssueID: productLastModel?.ReadSourceID)
                self?.navigationController?.pushViewController(nextVc, animated: true)
            }
            
            return cell
            
        case TRHomeSectionInfro:
            let cell = tableView.dequeueReusableCell(withIdentifier: TRHomeInfroTableViewCellID, for: indexPath) as! TRHomeInfroTableViewCell
            cell.tableViewDataArray = self.dataArrayArticleGetTopNews
            
            cell.cellDidSelectItem = {[weak self](tableView, indexPath) in
                let model: TRArticleGettopnewsDataModel = self?.dataArrayArticleGetTopNews?[indexPath.row] ?? TRArticleGettopnewsDataModel.init()
                let nextVc = TRArticleReadHTMLViewController(htmlType: .typeInfos, ArticleID: "\(model.News_ID)", articleRichText: nil)
                self?.navigationController?.pushViewController(nextVc, animated: true)
            }
            
            return cell

        case TRHomeSectionArticle:
            let cell = tableView.dequeueReusableCell(withIdentifier: TRHomeArticleTableViewCellID, for: indexPath) as! TRHomeArticleTableViewCell
            cell.collectionViewDataArray = self.dataArrayArticleRecd
            cell.cellDidSelectItem = {[weak self](tableView, indexPath) in
                let model: TRArticleDataRecdModel = self?.dataArrayArticleRecd?[indexPath.row] ?? TRArticleDataRecdModel.init()
                let nextVc = TRArticleReadViewController(ArticleID: "\(model.ReadSourceID)")
                self?.navigationController?.pushViewController(nextVc, animated: true)
            }
            
            return cell
            
        case TRHomeSectionRank:
            let cell = tableView.dequeueReusableCell(withIdentifier: TRHomeRankTableViewCellID, for: indexPath) as! TRHomeRankTableViewCell
            cell.collectionViewDataArray = self.dataArrayRecd
            
            cell.cellDidSelectItem = {[weak self](collectionView, indexPath) in
                let model = self?.dataArrayRecd?[indexPath.row]
                let nextVc = TRNewsDetailViewController(PubIssueID: "\(model?.ProdID ?? 0)")
                self?.navigationController?.pushViewController(nextVc, animated: true)
            }
            
            return cell

            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") ?? UITableViewCell.init(style: .subtitle, reuseIdentifier: "UITableViewCell")

            cell.textLabel?.textColor = UIColor.init(white: 0.0, alpha: 0.6)
            cell.textLabel?.font = UIFont.init(name: "ChalkboardSE-Bold", size: 14.0)
            cell.textLabel?.lineBreakMode = .byCharWrapping
            cell.textLabel?.text = "\(indexPath.section + 1).\(indexPath.row + 1)"
            cell.textLabel?.numberOfLines = 2

            cell.detailTextLabel?.textColor = UIColor.init(white: 0.0, alpha: 0.5)
            cell.detailTextLabel?.font = UIFont.init(name: "ChalkboardSE-Bold", size: 11.0)
            cell.detailTextLabel?.text = "\(indexPath.section + 1).\(indexPath.row + 1)"
            cell.detailTextLabel?.numberOfLines = 2

            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.heightForHeaderInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: TRHomeHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TRHomeHeaderViewID) as! TRHomeHeaderView
        headerView.titleString = self.headerTitleArray[section]
        
        switch section {
        case TRHomeSectionNews:
            headerView.headerMoreBtnClick = {[weak self]() in
                let nextVc = TRMoreNewsViewController()
                self?.navigationController?.pushViewController(nextVc, animated: true)
            }
            return headerView
            
        case TRHomeSectionInfro:
            headerView.headerMoreBtnClick = {[weak self]() in
                let nextVc = TRMoreInfoViewController()
                self?.navigationController?.pushViewController(nextVc, animated: true)
            }
            return headerView

        case TRHomeSectionArticle:
            headerView.headerMoreBtnClick = {[weak self]() in
                let nextVc = TRMoreArticleViewController()
                self?.navigationController?.pushViewController(nextVc, animated: true)
            }
            return headerView

        case TRHomeSectionRank:
            headerView.headerMoreBtnClick = {[weak self]() in
                let nextVc = TRMoreRankViewController()
                self?.navigationController?.pushViewController(nextVc, animated: true)
            }
            return headerView
            
        default:
            headerView.headerMoreBtnClick = {[weak self]() in
                let nextVc = TRMoreNewsViewController()
                self?.navigationController?.pushViewController(nextVc, animated: true)
            }
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.contentView.backgroundColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return viewModel.heightForFooterInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView: TRHomeFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TRHomeFooterViewID) as! TRHomeFooterView
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        footerView.contentView.backgroundColor = LXTableViewBackgroundColor
    }
}
