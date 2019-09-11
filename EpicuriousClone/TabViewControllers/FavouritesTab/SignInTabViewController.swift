//
//  SignInTabViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 11/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class SignInTabViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var emailStatus: UILabel!

    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordStatus: UILabel!

    var isSignin:Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Sign In Screen Loaded")
        setDelegates()
        setKeyboardListeners()
    }

    fileprivate func setDelegates() {
        emailText.delegate = self
        passwordText.delegate = self
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

    @IBAction func onClickSigninButton(_ sender: Any) {
        validateEmail()
        validatePassword()
    }

    @IBAction func onClickCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
            onClickSigninButton(0)
        }
        return true
    }
}
