//
//  CookingDeepnessReusableCellCollectionViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 26/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class CookingDeepnessReusableCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cookingDeepness: UILabel!
    static let reusableCellIdentity:String = "CookingDeepnessReusableIdentity"
    func setText(_ text:String) {
        cookingDeepness.text = text
    }
}
