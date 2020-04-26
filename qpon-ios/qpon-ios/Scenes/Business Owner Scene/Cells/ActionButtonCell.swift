//
//  ActionButtonCell.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 12.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit

protocol ActionButtonCellDelegate {
    func didTapActionButton(_ sender: ActionButtonCell)
}

class ActionButtonCell: UICollectionViewCell {

    @IBOutlet weak var button: UIButton!
    
    var delegate: ActionButtonCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.button.layer.cornerRadius = 8
        self.button.backgroundColor = UIColor.darkBlueColor()
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        self.delegate?.didTapActionButton(self)
    }
    
}
