//
//  TRLoginOutTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/5/25.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRLoginOutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var trTitleLabel: UILabel!
    @IBOutlet weak var trImageView: UIImageView!
    @IBOutlet weak var trInterImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        trTitleLabel.text = "头像"
        trImageView.image = UIImage.init(named: "头像")
        trInterImageView.image = UIImage.init(named: "会员箭头灰")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
