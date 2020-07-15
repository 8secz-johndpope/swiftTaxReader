//
//  LXInsetsLabel.swift
//  TaxReader
//
//  Created by asdc on 2020/7/15.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class LXInsetsLabel: UILabel {
    public var textInsets: UIEdgeInsets = .zero
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    internal init(frame: CGRect, textInsets: UIEdgeInsets) {
        self.textInsets = textInsets
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
}
