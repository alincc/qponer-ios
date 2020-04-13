//
//  VoucherCell.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 12.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit

class VoucherCell: UICollectionViewCell {

    static let aspectRatio: CGFloat = 1.7
    
    @IBOutlet weak var labelCenterYConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.labelCenterYConstraint.constant = self.bounds.height / 5
        self.label.sizeToFit()
        self.label.adjustsFontSizeToFitWidth = true
        self.label.minimumScaleFactor = 0.5
        self.label.numberOfLines = 0
    }
}
