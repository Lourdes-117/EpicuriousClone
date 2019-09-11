//
//  FavouritesTabViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 11/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class FavouritesTabViewController: UIViewController {

    var isSignIn:Bool!
    let signInOrSignUpSegueIdentifier:String = "signInOrSignUpPageSegueIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Favourites View Loaded")
    }
    @IBAction func onCLickLoginButton(_ sender: Any) {
        isSignIn = true
        performSegue(withIdentifier: signInOrSignUpSegueIdentifier, sender: self)
    }

    @IBAction func onClickCreateAccountButton(_ sender: Any) {
        isSignIn = false
        performSegue(withIdentifier: signInOrSignUpSegueIdentifier, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let signInTabViewController = segue.destination as? SignInTabViewController {
            signInTabViewController.isSignin = self.isSignIn
        }
    }
}
