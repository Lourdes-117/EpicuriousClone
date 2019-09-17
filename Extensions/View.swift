//
//  View.swift
//  EpicuriousClone
//
//  Created by Tringapps on 11/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit
extension UIView {
    func shake(horizantaly:CGFloat, repeatCount:Float = 5) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = repeatCount
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - horizantaly, y: self.center.y ))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + horizantaly, y: self.center.y ))

        self.layer.add(animation, forKey: "position")
    }

    func slideIn(horizontally:CGFloat) {
        let animation  = CABasicAnimation(keyPath: "position")
        animation.duration = 0.2
        animation.repeatCount = 0
        animation.autoreverses = false
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x + horizontally, y: self.center.y))
        animation.toValue =  NSValue(cgPoint: CGPoint(x: self.center.x, y: self.center.y))

        self.layer.add(animation, forKey: "position")
    }
}
