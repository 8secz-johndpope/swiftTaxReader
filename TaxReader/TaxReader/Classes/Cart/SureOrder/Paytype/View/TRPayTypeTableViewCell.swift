//
//  TRPayTypeTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRPayTypeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var trImageView: UIImageView!
    @IBOutlet weak var trTitleLabel: UILabel!
    @IBOutlet weak var trSelectedButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
