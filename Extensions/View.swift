//
//  View.swift
//  EpicuriousClone
//
//  Created by Tringapps on 11/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit
extension UIView {
    func shake(horizantaly:CGFloat) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - horizantaly, y: self.center.y ))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + horizantaly, y: self.center.y ))

        self.layer.add(animation, forKey: "position")
    }
}
