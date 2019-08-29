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

    public func getImge() -> UIImage {
        switch self {
        case Constants.HomeTab.STEAK:
            return #imageLiteral(resourceName: "Steak_Image")
        case Constants.HomeTab.VEGETABLES:
            return #imageLiteral(resourceName: "Vegetables_Image")
        case Constants.HomeTab.CHICKEN_AND_PORK:
            return #imageLiteral(resourceName: "Chicken_Image")
        case Constants.HomeTab.SEAFOOD:
            return #imageLiteral(resourceName: "Seafood_Image")
        case Constants.HomeTab.EGGS:
            return #imageLiteral(resourceName: "Eggs_Image")
        default:
            return #imageLiteral(resourceName: "Steak_Image")
        }
    }
}
