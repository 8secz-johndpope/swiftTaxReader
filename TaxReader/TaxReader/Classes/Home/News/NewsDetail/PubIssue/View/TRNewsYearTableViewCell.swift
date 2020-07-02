//
//  TRNewsYearTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/6/17.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRNewsYearTableViewCell: UITableViewCell {
    
    @IBOutlet weak var trContentView: UIView!
    @IBOutlet weak var trYearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var isCurrentCellSelected: Bool? {
        didSet {
            guard let isSelected = isCurrentCellSelected else {
                return
            }
            
            
            self.trContentView.backgroundColor = isSelected ? TRSelectedBackgroundColor : UIColor.white
        }
    }
}
