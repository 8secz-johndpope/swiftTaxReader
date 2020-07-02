//
//  LXTextFieldLineTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class LXTextFieldLineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lxTipTitleLabel: UILabel!
    @IBOutlet weak var lxTextfiled: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
