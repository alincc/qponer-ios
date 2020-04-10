//
//  SearchViewController.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit

protocol SearchViewControllerInput: class {
    
}


class SearchViewController: UIViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
    
    var presenter: SearchPresenterInput!

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
        self.collectionView.register(BusinessOwnerSearchCell.self, forCellWithReuseIdentifier: "BusinessOwnerSearchCell")
        let cellNib = UINib(nibName: "BusinessOwnerSearchCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "BusinessOwnerSearchCell")
        self.searchBar.placeholder = "Търсене на заведения"
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        self.searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let searchWidth = self.view.frame.width - 40
        self.searchBar.frame = CGRect(x: 0, y: 0, width: searchWidth, height: 20)
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BusinessOwnerSearchCell", for: indexPath) as! BusinessOwnerSearchCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = CGFloat(50)
        return CGSize(width: width, height: height)
    }
}

extension SearchViewController: SearchViewControllerInput {
    
}
