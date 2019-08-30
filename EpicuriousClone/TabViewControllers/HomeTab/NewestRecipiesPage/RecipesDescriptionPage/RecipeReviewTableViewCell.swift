//
//  RecipeReviewTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 30/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class RecipeReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewBackgroundView: UIView!

    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var pictureCourtesy: UILabel!
    //MakeItAgain
    @IBOutlet weak var makeItAgain: UILabel!
    @IBOutlet var makeItAgainArray: [UILabel]!
    //Reviews
    @IBOutlet weak var reviewRating: UILabel!
    @IBOutlet var reviewArray: [UILabel]!
    @IBOutlet weak var numberOfReviews: UILabel!
    @IBOutlet var reviewStarImages: [UIImageView]!

    var data:NewestRecipiesDecodableDataModel!
    public static let reusableIdentity:String = "RecipeReviewCellReusableIdentity"

    public func setValue(data:NewestRecipiesDecodableDataModel) {
        self.data = data
        setTapGestureRecognizer()
        setMakeItAgain()
        setName()
        setPictureCourtese()
        setReviews()
    }

    fileprivate func setMakeItAgain() {
        makeItAgain.text = data.makeItAgain
        if(Int(data.makeItAgain)! > 0) {
            makeItAgainArray.forEach { (label) in
                label.textColor = UIColor.red
            }
        } else {
            makeItAgainArray.forEach { (label) in
                label.textColor = UIColor.lightGray
            }
        }
    }

    fileprivate func setName() {
        recipeName.text = data.recipeName
    }

    fileprivate func setPictureCourtese() {
        pictureCourtesy.text = data.pictureCourtesy
    }

    fileprivate func setReviews() {
        reviewBackgroundView.isUserInteractionEnabled = true
        numberOfReviews.text = "\(data.reviews.count)"
        reviewRating.text = data.rating
        var iterations:Int = 0
        reviewStarImages.forEach { (image) in
            if(iterations > data.reviews.count){
                image.image = UIImage(named: Constants.HomeTab.REVIEWS_GREY)
            } else {
                image.image = UIImage(named: Constants.HomeTab.REVIEWS_RED)
            }
            iterations = iterations+1
        }
    }

    fileprivate func setTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.onClickReviewBackgroundView))
        reviewBackgroundView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc fileprivate func onClickReviewBackgroundView() {
        print("This works")
    }
}
