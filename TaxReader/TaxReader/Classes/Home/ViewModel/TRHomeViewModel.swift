//
//  TRHomeViewModel.swift
//  TaxReader
//
//  Created by asdc on 2020/4/2.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

let TRHomeSectionBannerHeight = 150.0
let TRHomeSectionNewseHeight = 150.0
let TRHomeSectionInfroHeight = 128.0
let TRHomeSectionArticleHeight = (LXScreenWidth * 0.66 * 270) / 426 // 屏幕的2/3 图片本身的宽高比
let TRHomeSectionRankHeight = 400.0

class TRHomeViewModel: NSObject {
    
    func numberOfRowsInSection(section: Int) -> Int {
        switch section {
        case TRHomeSectionBanner:
            return 1
        case TRHomeSectionNews:
            return 1
        case TRHomeSectionInfro:
            return 1
        case TRHomeSectionArticle:
            return 1
        case TRHomeSectionRank:
            return 1
            
        default:
            return 1
        }
    }
    
    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case TRHomeSectionBanner:
            return CGFloat(TRHomeSectionBannerHeight)
        case TRHomeSectionNews:
            return CGFloat(TRHomeSectionNewseHeight)
        case TRHomeSectionInfro:
            return CGFloat(TRHomeSectionInfroHeight)
        case TRHomeSectionArticle:
            return CGFloat(TRHomeSectionArticleHeight)
        case TRHomeSectionRank:
            return CGFloat(TRHomeSectionRankHeight)

        default:
            return 120
        }
    }
    
    func heightForHeaderInSection(section: Int) -> CGFloat {
        switch section {
        case TRHomeSectionBanner:
            return 0.0
            
        default:
            return 44
        }
    }
    
    func heightForFooterInSection(section: Int) -> CGFloat {
        switch section {
        case TRHomeSectionBanner:
            return 10.0
            
        default:
            return 10
        }
    }
}
