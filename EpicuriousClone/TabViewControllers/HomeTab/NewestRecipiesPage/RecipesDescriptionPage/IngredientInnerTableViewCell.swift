//
//  IngredientListTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 03/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class IngredientInnerTableViewCell: UITableViewCell {
    @IBOutlet weak var ingredientLabel: UILabel!
    static let reusableIdentity:String = "IngredientTableViewReusableIdentity"
    
    @IBOutlet weak var bulletView: UIView!
    public func setValues(ingredient:String) {
        setbulletStyle()
        ingredientLabel.text = ingredient
    }

    fileprivate func setbulletStyle() {
        bulletView.layer.cornerRadius = bulletView.frame.height/2
    }
}
