//
//  TRTicketTypeTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/6/11.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

protocol TRTicketTypeTableViewCellDelegate: NSObjectProtocol {
    func cellSelectedButtonAction(button: UIButton, cell: TRTicketTypeTableViewCell)
    func cellEditButtonAction(button: UIButton, cell: TRTicketTypeTableViewCell)
}

class TRTicketTypeTableViewCell: UITableViewCell {
    
    weak var delegate: TRTicketTypeTableViewCellDelegate?
    
    @IBOutlet weak var trSelectedButton: UIButton!
    @IBOutlet weak var trTypeLabel: UILabel!
    @IBOutlet weak var trNumberLabel: UILabel!
    @IBOutlet weak var trEditButton: UIButton!
    
    /// 当前选中的行
    var cellIndexPath: IndexPath = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func trSelectedButtonAction(_ sender: UIButton) {
        if (self.delegate != nil) && ((self.delegate?.responds(to: Selector.init(("trSelectedButtonAction")))) != nil) {
            self.delegate?.cellSelectedButtonAction(button: sender, cell: self)
        }
    }
    
    @IBAction func trEditButtonAction(_ sender: UIButton) {
        if (self.delegate != nil) && ((self.delegate?.responds(to: Selector.init(("trEditButtonAction")))) != nil) {
            self.delegate?.cellEditButtonAction(button: sender, cell: self)
        }
    }
}
