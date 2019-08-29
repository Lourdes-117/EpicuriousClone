//
//  RecipeCollectionViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 29/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    @IBOutlet var reviewArray: [UILabel]!
    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet var starArray: [UILabel]!
    @IBOutlet var starImageArray: [UIImage]!
    @IBOutlet weak var starCount: UILabel!
    @IBOutlet weak var reciepName: UILabel!
    public static let reusableIdentity:String = "RecipieCellReusableIdentity"

    public func setValues(data:NewestRecipiesDecodableDataModel) {
        reciepName.text = data.recipeName
        if(data.reviews.count > 0) {
            reviewCount.text = "\(data.reviews.count)"
            reviewArray.forEach { (label) in
                label.textColor = UIColor.red
            }
        }
        if(Int(data.rating)! > 0) {
            starCount.text = "\(data.rating!)"
            starCount.textColor = UIColor.red
            starArray.forEach { (label) in
                label.textColor = UIColor.red
            }
        }
    }
}
