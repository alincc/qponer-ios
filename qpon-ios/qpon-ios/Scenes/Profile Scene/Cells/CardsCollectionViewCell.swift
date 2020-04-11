//
//  CardsCollectionViewCell.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit

class CardsCollectionViewCell: UICollectionViewCell {

    enum CardSections: Int {
        case cards
        case addCard
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        let cardNib = UINib(nibName: "CardCell", bundle: nil)
        let addCardNib = UINib(nibName: "AddNewCardCell", bundle: nil)
        self.collectionView.register(cardNib, forCellWithReuseIdentifier: "CardCell")
        self.collectionView.register(addCardNib, forCellWithReuseIdentifier: "AddNewCardCell")
    }
}

extension CardsCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //check if there are cards forst
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == CardSections.cards.rawValue {
            return 3 // TODO:
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == CardSections.cards.rawValue {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddNewCardCell", for: indexPath) as! AddNewCardCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        if indexPath.section == CardSections.cards.rawValue {
            return CGSize(width: collectionView.bounds.width, height: 50)
        }
        
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
