//
//  SettingsViewCellViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 12/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class SettingsViewCellViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Settings View Loaded")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        showNavigationBar()
    }

    fileprivate func hideNavigationBar() {
        self.navigationController!.isNavigationBarHidden = true
    }

    fileprivate func showNavigationBar() {
        self.navigationController!.isNavigationBarHidden = false
    }
    
    @IBAction func onClickFacebookButton(_ sender: Any) {
        print("Facebook Icon Clicked")
        UIApplication.shared.open(URL(string: "https://facebook.com")!, options: [:], completionHandler: nil)
    }

    @IBAction func onClickTwitterButton(_ sender: Any) {
        print("Twitter Icon Clicked")
        UIApplication.shared.open(URL(string: "https://twitter.com")!, options: [:], completionHandler: nil)
    }

    @IBAction func onClickInstagramButton(_ sender: Any) {
        print("Instagram Icon Clicked")
        UIApplication.shared.open(URL(string: "https://instagram.com")!, options: [:], completionHandler: nil)
    }

    @IBAction func onClickYoutubeButton(_ sender: Any) {
        print("Youtube Icon Clicked")
        UIApplication.shared.open(URL(string: "https://youtube.com")!, options: [:], completionHandler: nil)
    }

    @IBAction func onClickCancelButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    deinit {
        print("Settings View Safe From Memory Leaks")
    }
}
