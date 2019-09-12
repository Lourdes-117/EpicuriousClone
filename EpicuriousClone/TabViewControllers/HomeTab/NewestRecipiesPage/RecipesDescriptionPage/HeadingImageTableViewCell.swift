//
//  HeadingImageTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 30/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class HeadingImageTableViewCell: UITableViewCell {
    @IBOutlet weak var shareButton: UIView!
    @IBOutlet weak var recipeImage: UIImageView!
    static var reusableIdentity:String = "headingCellReusableIdentity"
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeShareButton()
    }

    fileprivate func initializeShareButton() {
        shareButton.layer.cornerRadius = shareButton.frame.height/2
        shareButton.layer.zPosition = 100000000000
    }

    public func setValue(imageUrl:String) {
        recipeImage.loadImageFromURLString(imageUrl)
    }
}
