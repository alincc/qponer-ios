//
//  VoucherCell.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit

class VoucherCell: UICollectionViewCell {

    @IBOutlet weak var voucherView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.voucherView.layer.cornerRadius = 10
    }
}
