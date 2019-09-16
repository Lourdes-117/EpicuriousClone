//
//  IngredientNameTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 16/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class IngredientNameTableViewCell: UITableViewCell {

    @IBOutlet weak var bulletView: UIView!
    @IBOutlet weak var IngredientName: UILabel!

    public static let reusableIdentity:String = "IngredientsNameTableViewCellReusableIdentity"

    public func setValue(name:String) {
        IngredientName.text = name
        bulletView.layer.cornerRadius = bulletView.frame.height/2
    }
}
