//
//  RecipeCollectionViewCellViewCellCollectionViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 09/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class MoreRecipeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet var reviewArray: [UILabel]!
    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet var starArray: [UILabel]!
    @IBOutlet var starImageArray: [UIImageView]!
    @IBOutlet weak var starCount: UILabel!
    @IBOutlet weak var reciepName: UILabel!
    public static let reusableIdentity:String = "MoreRecipieCellReusableIdentity"
    private var data:NewestRecipiesDecodableDataModel!

    public func setValues(data:NewestRecipiesDecodableDataModel) {
        self.data = data
        setUpRecipeName()
        setUpReviewRating()
        setUpReviewStarCount()
        setUpImage()
    }

    fileprivate func setUpRecipeName() {
        reciepName.text = data.recipeName
        if(data.reviews.count > 0) {
            reviewCount.text = "\(data.reviews.count)"
            reviewArray.forEach { (label) in
                label.textColor = UIColor.red
            }
        }
    }
    fileprivate func setUpReviewStarCount() {
        guard (Int(data.rating)! > 0) else {return}
        starCount.text = "\(data.rating!)"
        starCount.textColor = UIColor.red
        starArray.forEach { (star) in
            star.textColor = UIColor.red
        }
    }

    fileprivate func setUpReviewRating() {
        var iteration:Int = 0
        starImageArray.forEach { (starImage) in
            iteration = iteration+1
            if(iteration <= Int(data.rating)!){
                starImage.image = UIImage(named: Constants.HomeTab.REVIEWS_RED)!
            } else {
                starImage.image = UIImage(named: Constants.HomeTab.REVIEWS_GREY)!
            }
        }
    }

    fileprivate func setUpImage() {
        let testUrlString:String = data.recipeImageUrl
        recipeImage.loadImageFromURLString(testUrlString)
    }
}
