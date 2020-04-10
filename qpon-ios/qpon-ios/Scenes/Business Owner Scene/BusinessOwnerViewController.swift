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


class BusinessOwnerViewController: UIViewController {
    
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

    }

}

extension BusinessOwnerViewController: BusinessOwnerViewControllerInput {
    
}
