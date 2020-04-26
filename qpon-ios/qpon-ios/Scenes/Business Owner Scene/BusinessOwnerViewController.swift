//
//  BusinessOwnerViewController.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit


protocol BusinessOwnerViewControllerInput: class {
    
}


class BusinessOwnerViewController: UIViewController, ActionButtonCellDelegate, BuyVouchersCellDelegate {
    
    enum BusinessOwnerSections: Int {
        case infoCell
        case vouchersCell
        case actionButtonCell
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: BusinessOwnerPresenterInput!

    // MARK: - View lifecycle methods

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        BusinessOwnerConfigurator.configure(viewController: self)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        BusinessOwnerConfigurator.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        let businessOwnerCell = UINib(nibName: "BusinessOwnerSearchCell", bundle: nil)
        let voucherCell = UINib(nibName: "BuyVouchersCell", bundle: nil)
        let actionButtonCell = UINib(nibName: "ActionButtonCell", bundle: nil)
        
        self.collectionView.register(businessOwnerCell, forCellWithReuseIdentifier: "BusinessOwnerSearchCell")
        self.collectionView.register(voucherCell, forCellWithReuseIdentifier: "BuyVouchersCell")
        self.collectionView.register(actionButtonCell, forCellWithReuseIdentifier: "ActionButtonCell")
    }
    
    // MARK: - ActionButtonCellDelegate
    
    func didTapActionButton(_ sender: ActionButtonCell) {
        
    }
    
    // MARK: - BuyVouchersCellDelegate
    
    func buyVouchersCellDidSelectVoucher(_ sender: BuyVouchersCell, voucherIndex: Int) {
        let actionIndexPath = IndexPath(item: 0, section: BusinessOwnerSections.actionButtonCell.rawValue)
        let actionCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "ActionButtonCell", for: actionIndexPath) as? ActionButtonCell
        actionCell?.button.isEnabled = true
    }

}

extension BusinessOwnerViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case BusinessOwnerSections.infoCell.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BusinessOwnerSearchCell", for: indexPath) as! BusinessOwnerSearchCell
            return cell
        case BusinessOwnerSections.vouchersCell.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuyVouchersCell", for: indexPath) as! BuyVouchersCell
            cell.delegate = self
            return cell
        case BusinessOwnerSections.actionButtonCell.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActionButtonCell", for: indexPath) as! ActionButtonCell
            cell.button.isEnabled = false
            cell.delegate = self
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
            return cell //TODO
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case BusinessOwnerSections.infoCell.rawValue:
            let width = collectionView.bounds.width
            let height = CGFloat(155)
            return CGSize(width: width, height: height)
        case BusinessOwnerSections.vouchersCell.rawValue:
            let voucherCellWidth = collectionView.bounds.width / 2
            let height = ((voucherCellWidth / VoucherCell.aspectRatio) * 2) + 56
            return CGSize(width: collectionView.bounds.width, height: height)
        case BusinessOwnerSections.actionButtonCell.rawValue:
            return CGSize(width: collectionView.bounds.width, height: 56)
        default:
            return CGSize.zero
        }
    }
}

extension BusinessOwnerViewController: BusinessOwnerViewControllerInput {
    
}
