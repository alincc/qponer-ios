//
//  SearchViewController.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit

protocol SearchViewControllerInput: class {
    func reloadBusinessCollection()
}


class SearchViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var locationContainer: UIView! {
        didSet {
            locationContainer.layer.cornerRadius = 14
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var categoriesHeightConstraint: NSLayoutConstraint!
    
    var presenter: SearchPresenterInput!

    var businessTypes = BusinessViewModel.businessTypes
    var selectedBusiness: BusinessType?
    
    // MARK: - View lifecycle methods

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        SearchConfigurator.configure(viewController: self)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        SearchConfigurator.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dissmissKeyboardOnTap()
     
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        let cellNib = UINib(nibName: "BusinessOwnerSearchCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "BusinessOwnerSearchCell")
        
        self.categoriesCollectionView.dataSource = self
        self.categoriesCollectionView.delegate = self
        let typeCellNib = UINib(nibName: "BusinessTypeCell", bundle: nil)
        self.categoriesCollectionView.register(typeCellNib, forCellWithReuseIdentifier: "BusinessTypeCell")
        
        let headerNib = UINib(nibName: "SearchHeaderView", bundle: nil)
        self.collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchHeaderView")
        
        self.searchBar.placeholder = "Търсене на заведения"
        self.searchBar.delegate = self
        self.searchBar.backgroundImage = UIImage()
        self.searchBar.searchTextField.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.layoutIfNeeded()
        let categoriesHeight = self.view.bounds.width / 4
        self.categoriesHeightConstraint.constant = categoriesHeight
    }
    // MARK: - UISearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.categoriesCollectionView {
            return self.businessTypes.count
        }
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.categoriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BusinessTypeCell", for: indexPath) as! BusinessTypeCell
            cell.configure(with: self.businessTypes[indexPath.item])
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BusinessOwnerSearchCell", for: indexPath) as! BusinessOwnerSearchCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SearchHeaderView", for: indexPath) as! SearchHeaderView
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.categoriesCollectionView {
            let width = collectionView.bounds.width / 4
            return CGSize(width: width, height: width)
        }
        
        let width = collectionView.bounds.width
        let height = CGFloat(155)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if collectionView == self.collectionView {
            return CGSize(width: collectionView.bounds.width, height: 74)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let businessTypeCell = collectionView.cellForItem(at: indexPath) as? BusinessTypeCell {
            businessTypeCell.selectionIndicatorView.isHidden = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let businessTypeCell = collectionView.cellForItem(at: indexPath) as? BusinessTypeCell {
            businessTypeCell.selectionIndicatorView.isHidden = true
        }
    }
}

extension SearchViewController: SearchViewControllerInput {
    func reloadBusinessCollection() {
        
    }
}
