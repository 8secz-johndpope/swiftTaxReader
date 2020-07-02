//
//  FMHomeVipViewModel.swift
//  demoSwift
//
//  Created by asdc on 2019/12/27.
//  Copyright © 2019 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON

let FMHomeVipSectionGridHeight = 80.0
let FMHomeVipSectionHotHeight = 460.0
let FMHomeVipSectionEnjoyHeight = 280.0

class FMHomeVipViewModel: NSObject {
    var homeVipData: FMHomeVipModel?
    var vipFocusImagesData: [FMVipFocusImagesDataModel]?
    var vipCategoryContentsList: [FMCategoryContentsListModel]?
    var vipContentListGrid: [FMContentListGridModel]?
    
    // 数据源更新
    typealias homeVipDataBlock = () -> Void
    var updateBlock: homeVipDataBlock?
    
//    func numberOfRowsInSection(section: Int) -> Int {
//        switch section {
//        case FMHomeVipSectionBanner:
//            return 1
//        case FMHomeVipSectionGrid:
//            return 1
//        case FMHomeVipSectionHot:
//            return 1
//        case FMHomeVipSectionEnjoy:
//            return 1
//
//        default:
//            return self.vipCategoryContentsList?[section].list?.count ?? 1
//        }
//    }
    
//    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
//        switch indexPath.section {
//        case FMHomeVipSectionBanner:
//            return 150
//        case FMHomeVipSectionGrid:
//            return CGFloat(FMHomeVipSectionGridHeight)
//        case FMHomeVipSectionHot:
//            return CGFloat(FMHomeVipSectionHotHeight)
//        case FMHomeVipSectionEnjoy:
//            return CGFloat(FMHomeVipSectionEnjoyHeight)
//
//        default:
//            return 120
//        }
//    }
    
//    func heightForHeaderInSection(section: Int) -> CGFloat {
//        switch section {
//        case FMHomeVipSectionBanner:
//            return 0.0
//        case FMHomeVipSectionGrid:
//            return 0.0
//
//        default:
//            return 44
//        }
//    }
    
//    func heightForFooterInSection(section: Int) -> CGFloat {
//        switch section {
//        case FMHomeVipSectionBanner:
//            return 0.0
//
//        default:
//            return 10
//        }
//    }
}

extension FMHomeVipViewModel {
    func refreshDataSource() {
        FMHomeVipAPIProvider.request(FMHomeVipAPI.homeVipList) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                let json = JSON(data!)
                print(json.description)
                
                if let mappedObject = JSONDeserializer<FMHomeVipModel>.deserializeFrom(json: json.description) {
                    self.homeVipData = mappedObject
                    self.vipFocusImagesData = mappedObject.focusImages?.data
                    self.vipCategoryContentsList = mappedObject.categoryContents?.list
                }
                
                if let contentListGridObject = JSONDeserializer<FMContentListGridModel>.deserializeModelArrayFrom(json: json["categoryContents"]["list"][0]["list"].description) {
                    self.vipContentListGrid = contentListGridObject as? [FMContentListGridModel]
                }

                self.updateBlock?()
            }
        }
    }
}
