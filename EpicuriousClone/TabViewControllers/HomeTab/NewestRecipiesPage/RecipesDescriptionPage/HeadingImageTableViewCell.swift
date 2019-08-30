//
//  HeadingImageTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 30/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class HeadingImageTableViewCell: UITableViewCell {
    @IBOutlet weak var recipeImage: UIImageView!
    static var reusableIdentity:String = "headingCellReusableIdentity"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    public func setValue(imageUrl:String) {
        recipeImage.loadImageFromURLString(imageUrl)
    }
}
