//
//  RegistrationViewController.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 7.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit

protocol RegistrationViewControllerInput: class {
    
}

enum registrationCellTypes {
    case email
    case password
    case confirmPassword
    case firstname
    case lastname
    case address
    case city
    case country
    case postCode
    case dateOfBirth
    case agreeToTermsAndConditions
    case agreeToPrivacyPolicy
    case registerButton
}

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: RegistrationPresenterInput!
    
    // MARK: - View lifecycle methods

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        RegistrationConfigurator.configure(viewController: self)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        RegistrationConfigurator.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RegistrationViewController: RegistrationViewControllerInput {
    
}
