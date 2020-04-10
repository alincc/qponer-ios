//
//  ProfileViewController.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit

protocol ProfileViewControllerInput: class {
    
}


class ProfileViewController: UIViewController {
    
    enum ProfileSections: Int {
        case profileDetails
        case cards
        case vouchers
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: ProfilePresenterInput!

    // MARK: - View lifecycle methods

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        ProfileConfigurator.configure(viewController: self)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        ProfileConfigurator.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        let profileNib = UINib(nibName: "ProfileInfoCell", bundle: nil)
        let cardsNib = UINib(nibName: "CardsCollectionViewCell", bundle: nil)
        let vouchersNib = UINib(nibName: "VoucherCollectionCell", bundle: nil)
        self.collectionView.register(profileNib, forCellWithReuseIdentifier: "ProfileInfoCell")
        self.collectionView.register(cardsNib, forCellWithReuseIdentifier: "CardsCollectionViewCell")
        self.collectionView.register(vouchersNib, forCellWithReuseIdentifier: "VoucherCollectionCell")
    }

}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == ProfileSections.profileDetails.rawValue {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileInfoCell", for: indexPath) as! ProfileInfoCell
            return cell
        }
        if indexPath.section == ProfileSections.cards.rawValue {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardsCollectionViewCell", for: indexPath) as! CardsCollectionViewCell
            return cell
        }
        
        let vouchersCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VoucherCollectionCell", for: indexPath) as! VoucherCollectionCell
        return vouchersCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == ProfileSections.profileDetails.rawValue {
            return CGSize(width: collectionView.bounds.width, height: 80)
        }
        if indexPath.section == ProfileSections.cards.rawValue {
            // determine size according to cards number
            let width = collectionView.bounds.width
            let height = CGFloat(43 + (self.presenter.numberOfRegisteredCards() * 50) + 60)
            return CGSize(width: width, height: height)
        }
        if indexPath.section == ProfileSections.vouchers.rawValue {
            return CGSize(width: collectionView.bounds.width, height: VoucherCollectionCell.height)
        }
        return CGSize.zero
    }
}

extension ProfileViewController: ProfileViewControllerInput {
    
}
