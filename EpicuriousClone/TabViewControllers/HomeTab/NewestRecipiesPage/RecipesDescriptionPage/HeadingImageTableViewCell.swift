//
//  HeadingImageTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 30/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class HeadingImageTableViewCell: UITableViewCell {
    @IBOutlet weak var addToFavouritesButton: UIView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var recipeImage: UIImageView!
    static var reusableIdentity:String = "headingCellReusableIdentity"
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeButtons()
    }

    fileprivate func initializeButtons() {
        initializeShareButton()
        initializeAddToFavouritesButton()
    }

    fileprivate func initializeShareButton() {
        shareButton.layer.cornerRadius = shareButton.frame.height/2
    }

    fileprivate func initializeAddToFavouritesButton() {
        addToFavouritesButton.layer.cornerRadius = addToFavouritesButton.frame.height/2
    }

    public func setValue(imageUrl:String) {
        recipeImage.loadImageFromURLString(imageUrl)
    }
}
