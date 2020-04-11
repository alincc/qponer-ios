//
//  ViewController+extension.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController: UIGestureRecognizerDelegate {
    func showError(title: String, message: String) {
        
    }
    
    func dissmissKeyboardOnTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.numberOfTapsRequired = 2
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
        self.navigationController?.view.endEditing(true)
    }
}
