//
//  IngredientListTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 03/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class IngredientInnerTableViewCell: UITableViewCell {
    @IBOutlet weak var ingredientLabel:UILabel!
    static let reusableIdentity:String = "IngredientTableViewReusableIdentity"
    
    public func setValues(ingredient:String) {
        ingredientLabel.text = ingredient
    }
}
