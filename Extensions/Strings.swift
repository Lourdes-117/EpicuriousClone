//
//  Strings.swift
//  EpicuriousClone
//
//  Created by Tringapps on 23/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
import UIKit
extension String {
    public func instantiateViewController(inStoryboard storyboard:String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let instantiatedViewController:UIViewController = storyboard.instantiateViewController(withIdentifier: self)
        return instantiatedViewController
    }

    public func isOfValidFormat(_ format:String) -> Bool {
        let emailPred = NSPredicate(format:"SELF MATCHES %@", format)
        return emailPred.evaluate(with: self)
    }
}
