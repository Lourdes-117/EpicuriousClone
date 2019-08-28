//
//  ThinknessReusableCellCollectionViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 26/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class ThinknessReusableCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodThinkness: UILabel!
    static let reusableCellIdentity:String = "ThicknessReusableIdeitity"
    func setText(_ text:String) {
        foodThinkness.text = text
    }
}
