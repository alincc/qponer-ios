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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(CardCell.self, forCellWithReuseIdentifier: "CardCell")
        self.collectionView.register(AddNewCardCell.self, forCellWithReuseIdentifier: "AddNewCardCell")
    }
}

extension CardsCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //check if there are cards forst
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == CardSections.cards.rawValue {
            return 0 // TODO:
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
    
    
}
