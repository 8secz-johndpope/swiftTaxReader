//
//  TRAddressExample.swift
//  TaxReader
//
//  Created by asdc on 2020/4/20.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRAddressExample: NSObject {
    var isRequired: Bool?
    var title: String?
    var textFieldValue: String?
    
    var detailTtile: String?
    var isSwitchOn: Bool?
    
    static func customNameAreaExampleStyle(isRequired: Bool?, title: String?, detailTtile: String?) -> TRAddressExample {
        let example: TRAddressExample = TRAddressExample.init()
        example.isRequired = isRequired;
        example.title = title;
        example.detailTtile = detailTtile;
        
        return example;
    }

    static func customNameTFExampleStyle(isRequired: Bool?, title: String?, textFieldValue: String?) -> TRAddressExample {
        let example: TRAddressExample = TRAddressExample.init()
        example.isRequired = isRequired;
        example.title = title;
        example.textFieldValue = textFieldValue;
        
        return example;
    }
    
    static func customNameSWExampleStyle(isRequired: Bool?, title: String?, isSwitchOn: Bool?) -> TRAddressExample {
        let example: TRAddressExample = TRAddressExample.init()
        example.isRequired = isRequired;
        example.title = title;
        example.isSwitchOn = isSwitchOn;
        
        return example;
    }
}
