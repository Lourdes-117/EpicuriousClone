//
//  SignInTabViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 11/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class SignInTabViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var bottomViewButton: UIButton!
    @IBOutlet weak var bottomViewDescription: UILabel!
    @IBOutlet weak var pageDescription: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var emailStatus: UILabel!

    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordStatus: UILabel!

    @IBOutlet weak var confirmPasswordStatus: UILabel!
    @IBOutlet weak var confirmPasswordText: UITextField!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var signUpExtraView: UIView!
    var isSignin:Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Sign In Screen Loaded")
        setDelegates()
        setKeyboardListeners()
        setUpViews()
    }

    fileprivate func checkCancelButton() {
        guard let _ = self.navigationController else {
            return
        }
        cancelButton.isHidden = true
    }

    fileprivate func setUpViews() {
        checkCancelButton()
        let signInDescription:String = "Sign in to view and save all your favourite recipes!"
        let signUpDescription:String = "Create new account to view and save all your favourite recipes!"
        let signInBottomViewDescription:String = "Dont have an account?"
        let signUpBottomViewDescription:String = "Already have an account?"
        let signInBottomViewButtom:String = "Create One Here!"
        let signUpBottomViewButtom:String = "Login Here!"
        let bottomViewButtomAttrubute: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 15),
            .foregroundColor: UIColor.white,
            .underlineStyle: NSUnderlineStyle.single.rawValue]
        let bottomViewButtonAttributedString:NSAttributedString!
        if(isSignin) {
            signUpExtraView.isHidden = true
            pageDescription.text = signInDescription
            bottomViewDescription.text = signInBottomViewDescription
            bottomViewButtonAttributedString = NSMutableAttributedString(string: signInBottomViewButtom, attributes: bottomViewButtomAttrubute)
        } else {
            pageDescription.text = signUpDescription
            signUpExtraView.isHidden = false
            bottomViewDescription.text = signUpBottomViewDescription
            bottomViewButtonAttributedString = NSMutableAttributedString(string: signUpBottomViewButtom, attributes: bottomViewButtomAttrubute)
        }
        bottomViewButton.setAttributedTitle(bottomViewButtonAttributedString, for: .normal)
    }

    fileprivate func setDelegates() {
        emailText.delegate = self
        passwordText.delegate = self
        confirmPasswordText.delegate = self
    }

    fileprivate func setKeyboardListeners() {
        NotificationCenter.default.addObserver(self, selector: #selector(moveScrollViewUp(notification:)), name: UIResponder.keyboardWillHideNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(moveScrollViewUp(notification:)), name: UIResponder.keyboardWillChangeFrameNotification , object: nil)
    }

    @objc private func moveScrollViewUp(notification: Notification) {
        print("View Will Be Scrolled Up")

        guard let keyboardScreenEndFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            print("Nothing has been changed")
            return

        }
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        if(notification.name == UIResponder.keyboardWillHideNotification){
            scrollView.contentInset = UIEdgeInsets.zero
            print("Scrolled Back To Normal")
        } else {
            print("Scrolling Above The Keyboard Height")
            scrollView.contentInset = UIEdgeInsets(top: CGFloat.zero, left: CGFloat.zero, bottom: keyboardViewEndFrame.height, right: CGFloat.zero)
        }
    }

    fileprivate func validateEmail() {
        let email = "Email"
        let enteredEmail:String = emailText.text!
        guard (enteredEmail != "") else {
            emailLabel.textColor = UIColor.red
            emailStatus.text = "\(email) \(Constants.Status.FIELD_EMPTY)"
            emailStatus.isHidden = false
            emailText.layer.borderColor = UIColor.red.cgColor
            emailText.layer.borderWidth = 1
            emailText.shake(horizantaly: 5)
            return
        }
        if enteredEmail.isOfValidFormat(Constants.Regex.EMAIL) {
            emailStatus.isHidden = true
            emailText.layer.borderColor = UIColor.lightGray.cgColor
            emailText.layer.borderWidth = 1
            emailLabel.textColor = UIColor.black
        } else {
            emailLabel.textColor = UIColor.red
            emailStatus.text = "\(email) \(Constants.Status.INVALID_ENTRY)"
            emailStatus.isHidden = false
            emailText.layer.borderColor = UIColor.red.cgColor
            emailText.layer.borderWidth = 1
            emailText.shake(horizantaly: 5)
        }
    }

    fileprivate func validatePassword() {
        let password = "Password"
        let enteredPassword:String = passwordText.text!
        guard (enteredPassword != "") else {
            passwordLabel.textColor = UIColor.red
            passwordStatus.text = "\(password) \(Constants.Status.FIELD_EMPTY)"
            passwordStatus.isHidden = false
            passwordText.layer.borderColor = UIColor.red.cgColor
            passwordText.layer.borderWidth = 1
            passwordText.shake(horizantaly: 5)
            return
        }
        passwordStatus.isHidden = true
        passwordText.layer.borderColor = UIColor.lightGray.cgColor
        passwordText.layer.borderWidth = 1
        passwordLabel.textColor = UIColor.black
    }

    fileprivate func validateConfirmPassword() {
        let password = "Password"
        let enteredConfirmPassword:String = confirmPasswordText.text!
        guard (enteredConfirmPassword != "") else {
            confirmPasswordLabel.textColor = UIColor.red
            confirmPasswordStatus.text = "\(password) \(Constants.Status.FIELD_EMPTY)"
            confirmPasswordStatus.isHidden = false
            confirmPasswordText.layer.borderColor = UIColor.red.cgColor
            confirmPasswordText.layer.borderWidth = 1
            confirmPasswordText.shake(horizantaly: 5)
            return
        }
        if enteredConfirmPassword != passwordText.text! {
            confirmPasswordText.layer.borderColor = UIColor.red.cgColor
            confirmPasswordText.layer.borderWidth = 1
            confirmPasswordText.shake(horizantaly: 5)
            confirmPasswordLabel.text = "\(password) \(Constants.Status.DOESNT_MATCH)"
            confirmPasswordLabel.isHidden = false
        } else {
            confirmPasswordStatus.isHidden = true
            confirmPasswordText.layer.borderColor = UIColor.lightGray.cgColor
            confirmPasswordText.layer.borderWidth = 1
            confirmPasswordText.textColor = UIColor.black
        }
    }

    @IBAction func onClickSigninButton(_ sender: Any) {
        validateEmail()
        validatePassword()
    }

    @IBAction func onClickCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func onClickSignUpButton(_ sender: Any) {
        validateEmail()
        validatePassword()
        validateConfirmPassword()
    }

    @IBAction func onClickChangeLogin(_ sender: Any) {
        isSignin = !isSignin
        setUpViews()
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        print("Sign In Page Safe From Memory Leaks")
    }
}

extension SignInTabViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailText {
            passwordText.becomeFirstResponder()
        } else if textField == passwordText {
            if(isSignin) {
                onClickSigninButton(0)
            } else {
                confirmPasswordText.becomeFirstResponder()
            }
        } else if textField == confirmPasswordText {
            onClickSignUpButton(0)
        }
        return true
    }
}
