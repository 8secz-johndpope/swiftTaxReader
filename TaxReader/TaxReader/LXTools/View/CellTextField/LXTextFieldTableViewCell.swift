//
//  LXTextFieldTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/5/25.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class LXTextFieldTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var trBackViewForTextField: UIView!
    @IBOutlet weak var trTextField: UITextField!
    @IBOutlet weak var trWarnLabel: UILabel!
    @IBOutlet weak var trWarnHeightCon: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.trBackViewForTextField.layer.borderWidth = 0.5
        self.trBackViewForTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        self.trWarnLabel.text = "密码为8-16位数字和字母组合!"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var isHasWarnLabel: Bool? {
        didSet {
            guard let isHasWarnLabel = isHasWarnLabel else {
                return
            }
            
            self.trWarnLabel.isHidden = isHasWarnLabel ? false : true
            self.trWarnHeightCon.constant = isHasWarnLabel ? 25 : 0
        }
    }
}
