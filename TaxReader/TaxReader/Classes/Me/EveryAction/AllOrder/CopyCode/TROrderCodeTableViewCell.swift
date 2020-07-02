//
//  TROrderCodeTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/6/18.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

protocol TROrderCodeTableViewCellDelegate: NSObjectProtocol {
    func cellButtonDidSelectRowAt(_ button: UIButton)
}

class TROrderCodeTableViewCell: UITableViewCell {
    
    weak var delegate: TROrderCodeTableViewCellDelegate?
    
    @IBOutlet weak var trTitleLabel: UILabel!
    @IBOutlet weak var trDetailTitleLabel: UILabel!
    @IBOutlet weak var trCopyCodeButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.trCopyCodeButton.layer.cornerRadius = 15.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var orderActivityCodeModel: TROrderActivityCodeDataModel? {
        didSet {
            guard let model = orderActivityCodeModel else {
                return
            }
            
            self.trTitleLabel.text = "序列号：\(model.ActivationCodeSN ?? "")"
            self.trDetailTitleLabel.text = "    密码：\(model.ActivationCodePWD ?? "")"
            self.trCopyCodeButton.backgroundColor = model.ActivationCodeStatus == 1 ? UIColor.lightGray : TRThemeColor
        }
    }
    
    @IBAction func trCopyCodeButtonAction(_ sender: UIButton) {
        if delegate != nil && ((self.delegate?.responds(to: Selector.init(("trCopyCodeButtonAction")))) != nil) {
            self.delegate?.cellButtonDidSelectRowAt(sender)
        }
    }
}
