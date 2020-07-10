//
//  TRCatalogTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/7/10.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRCatalogTableViewCell: UITableViewCell {
    
    @IBOutlet weak var trTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
