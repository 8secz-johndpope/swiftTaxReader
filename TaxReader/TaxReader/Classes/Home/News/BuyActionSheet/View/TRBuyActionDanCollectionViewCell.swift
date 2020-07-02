//
//  TRBuyActionDanCollectionViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/6/26.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

protocol TRBuyActionDanCollectionViewCellDelegate: NSObjectProtocol {
    func collectionViewItemButtonDidSelectRowAt(button: UIButton)
}

class TRBuyActionDanCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: TRBuyActionDanCollectionViewCellDelegate?
    
    @IBOutlet weak var trBatchButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.trBatchButton.setImage(UIImage.init(named: "对号02"), for: .normal)
        self.trBatchButton.setImage(UIImage.init(named: "对号01"), for: .selected)
    }
    
    var batchModel: TRProductGetIssueNumberDataBatchModel? {
        didSet {
            guard let model = batchModel else {
                return
            }
            
            self.trBatchButton.setTitle("\(model.ProdIssue)", for: .normal)
        }
    }
    
    
    @IBAction func trBatchButtonAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if (self.delegate != nil) && ((self.delegate?.responds(to: Selector.init(("trBatchButtonAction")))) != nil) {
            self.delegate?.collectionViewItemButtonDidSelectRowAt(button: sender)
        }
    }
}
