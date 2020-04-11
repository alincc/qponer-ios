//
//  BusinessTypeCellCollectionViewCell.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 11.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit

class BusinessTypeCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var selectionIndicatorView: UIView! {
        didSet {
            selectionIndicatorView.backgroundColor = UIColor.yellowColor()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionIndicatorView.isHidden = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.selectionIndicatorView.isHidden = true
    }
    
    func configure(with business: BusinessType) {
        self.imageView.image = business.image
        self.textLabel.text = business.name
    }
}
