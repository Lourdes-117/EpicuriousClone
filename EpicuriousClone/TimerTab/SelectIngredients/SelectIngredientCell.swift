//
//  SelectIngredientCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 26/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//
import UIKit
class SelectIngredientCell: UITableViewCell {

    public static let reuseIdentity:String = "IngredientsTableViewCellReuseIdentity"
    @IBOutlet var backgroundImage:UIImageView!
    @IBOutlet var categoryTitle:UILabel!

    func setValues(ofModel toSet: CategoriesModel) {
        categoryTitle.text = toSet.categoryTitle
        backgroundImage.image = UIImage(named: toSet.backgroundImage)
    }
}
