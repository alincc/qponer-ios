//
//  LoginViewController.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 5.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit

protocol LoginViewControllerInput: class {
    func showError()
}

class LoginViewController: UIViewController, UITextFieldDelegate {

    enum TextFieldType: Int {
        case mail = 0
        case password = 1
    }
    
    @IBOutlet weak var mailTextField: UITextField! {
        didSet {
            mailTextField.textContentType = .emailAddress
            mailTextField.delegate = self
            mailTextField.tag = TextFieldType.mail.rawValue
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.isSecureTextEntry = true
            passwordTextField.delegate = self
            passwordTextField.tag = TextFieldType.password.rawValue
        }
    }
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var resgisterButton: UIButton!
    @IBOutlet weak var activityIndictaor: UIActivityIndicatorView!
    
    var presenter: LoginPresenterInput!
    
    // MARK: - View lifecycle methods

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        LoginConfigurator.configure(viewController: self)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        LoginConfigurator.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resgisterButton.isHidden = true
        self.activityIndictaor.isHidden = true
    }
    
    func validInpurFields() -> Bool {
        
        guard let mailText = self.mailTextField.text else {
            //show error
            return false
        }
        if self.isValidEmail(mailText) == false {
            //show error
            return false
        }
        if mailText.isEmpty {
            //show error
            return false
        }
        guard let passText = self.passwordTextField.text else {
            //show error
            return false
        }
        if passText.isEmpty {
            //showError
            return false
        }
        return true
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func login() {
        self.activityIndictaor.isHidden = false
        self.activityIndictaor.startAnimating()
        if self.validInpurFields() {
            let name = self.mailTextField.text!
            let pass = self.passwordTextField.text!
            self.presenter.didRequestLogin(name: name, password: pass)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        self.login()
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        self.presenter.didRequestRegistertartion()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == TextFieldType.mail.rawValue {
            textField.resignFirstResponder()
            self.passwordTextField.becomeFirstResponder()
        }
        if textField.tag == TextFieldType.password.rawValue {
            textField.resignFirstResponder()
            self.login()
        }
        return true
    }
}

extension LoginViewController: LoginViewControllerInput {
    func showError() {
        
    }
}
