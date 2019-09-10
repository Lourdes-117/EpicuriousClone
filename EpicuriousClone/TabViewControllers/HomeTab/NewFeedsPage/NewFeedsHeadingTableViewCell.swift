//
//  NewFeedsHeadingTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 10/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class NewFeedsHeadingTableViewCell: UITableViewCell {
    public static let reusableIdentity:String = "NewFeedsHeadingTableViewCellReusableIdentity"
    @IBOutlet weak var headingTitle: UILabel!
    @IBOutlet weak var headingDescription: UILabel!

    public func setValues(titleDetails:NewFeedsDecodableDataModel) {
        headingTitle.text = titleDetails.headingTitle
        headingDescription.text = titleDetails.headingDescription
    }
}
