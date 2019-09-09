//
//  PreparationTextTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 09/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class PreparationTextTableViewCell: UITableViewCell {
    @IBOutlet weak var preparationTextLabel: UILabel!
    public static let reusableIdentity:String = "preparationTextTableViewReusableIdentity"
    public func setValue(preparation:String) {
        preparationTextLabel.text = preparation
    }
}
