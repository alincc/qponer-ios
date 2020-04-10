//
//  VoucherCollectionCell.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit

class VoucherCollectionCell: UICollectionViewCell {

    class var height: CGFloat {
        return 164
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
//    var vouchers
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        let cellNib = UINib(nibName: "VoucherCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "VoucherCell")
        // Initialization code
    }

}

extension VoucherCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VoucherCell", for: indexPath) as! VoucherCell
        return cell
    }
}
