//
//  TRCartViewModel.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON

class TRCartViewModel: NSObject {
    
    // 数据源更新
    typealias apiDataBlock = () -> Void
    var updateBlock: apiDataBlock?
    
    var cartModel: TRCartModel?
    var cartDataArray: [TRDataModel]?
    
    
    // 每个分区显示item数量
    func numberOfRowsInSection(section: NSInteger) -> NSInteger {
        return self.cartDataArray?[section].data?.count ?? 0
    }
}

extension TRCartViewModel {
    func refreshDataSource(UserID: String, PageIndex: String, PageSize: String) {
        TaxReaderAPIProvider.request(TaxReaderAPI.cartFind(UserID: UserID, PageIndex: PageIndex, PageSize: PageSize)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                let json = JSON(data!)
                print("json = \(json.description)")
                
                self.updateBlock?()
                
            } else {
                
            }
        }
    }
    
    func getLocalCartJson() {
        let path = Bundle.main.path(forResource: "Cart", ofType: "json")
        if let jsonPath = path {
            let jsonData = NSData(contentsOfFile: jsonPath)
            do {
                let json = JSON(jsonData!)
                print(json.description)
                
                if let mappedObject = JSONDeserializer<TRCartModel>.deserializeFrom(json: json.description) {
                    self.cartModel = mappedObject
                    self.cartDataArray = mappedObject.data
                }
                
                self.updateBlock?()
            }
        }
    }
    
}
