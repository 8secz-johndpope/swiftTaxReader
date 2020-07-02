//
//  LXExample.swift
//  TaxReader
//
//  Created by asdc on 2020/4/10.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class LXExample: NSObject {
    var imageName: String?
    var title: String?
    var selector: Selector?

    static func customExampleStyle(imageName: String?, title: String?, selector: Selector?) -> LXExample {
        let example: LXExample = LXExample.init()
        example.imageName = imageName;
        example.title = title;
        example.selector = selector;
        
        return example;
    }
}
