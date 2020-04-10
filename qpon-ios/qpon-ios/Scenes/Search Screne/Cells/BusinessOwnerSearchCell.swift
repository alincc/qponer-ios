//
//  BusinessOwnerSearchCell.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit

class BusinessOwnerSearchCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override var reuseIdentifier: String? {
        return "BusinessOwnerSearchCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.text = "КОПОН"
    }
}
