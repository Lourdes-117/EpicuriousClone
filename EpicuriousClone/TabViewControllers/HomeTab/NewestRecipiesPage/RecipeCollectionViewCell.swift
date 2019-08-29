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
    @IBOutlet var starImageArray: [NSLayoutConstraint]!
    @IBOutlet weak var starCount: UILabel!
    @IBOutlet weak var reciepName: UILabel!
    public static let reusableIdentity:String = "RecipieCellReusableIdentity"
}
