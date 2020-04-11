//
//  SearchHeaderView.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 11.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit

class SearchHeaderView: UICollectionReusableView {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.text = "Най-нови"
    }
}
