//
//  TabBar.swift
//  EpicuriousClone
//
//  Created by Tringapps on 26/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit
extension UITabBar {
    func setTabBarVisibility(_ isVisible: Bool = true){
        UIView.animate(withDuration: 0.3) {
            if isVisible {
                self.layer.zPosition = 0
                self.isHidden = false
            } else {
                self.isHidden = true
                self.layer.zPosition = -1
            }
        }
    }
}
