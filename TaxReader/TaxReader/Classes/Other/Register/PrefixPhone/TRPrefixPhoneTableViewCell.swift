//
//  TRPrefixPhoneTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/5/22.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRPrefixPhoneTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var trNumberLabel: UILabel!
    @IBOutlet weak var trContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
