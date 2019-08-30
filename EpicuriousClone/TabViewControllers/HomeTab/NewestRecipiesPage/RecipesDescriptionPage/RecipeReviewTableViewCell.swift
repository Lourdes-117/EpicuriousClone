//
//  RecipeReviewTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 30/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class RecipeReviewTableViewCell: UITableViewCell {

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
        setMakeItAgain()
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
}
