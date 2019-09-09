//
//  IngredientTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 09/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    public static let reusableIdentity:String = "IngredientNameReusableIdentity"
    @IBOutlet weak var buyingStatusImageView: UIImageView!
    @IBOutlet weak var itemName: UILabel!

    public func setValues(itemName:String) {
        self.itemName.text = itemName
    }
}
