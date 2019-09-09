//
//  AddToCartButtonTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 09/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class AddToCartButtonTableViewCell: UITableViewCell {
    public static var reusableIdentity:String = "addToCartButtonTableViewCellReusalbeIdentity"
    var ingredientList:[String] = []
    public func setValues(ingredientArray:[String]) {
        ingredientList = ingredientArray
    }
}
