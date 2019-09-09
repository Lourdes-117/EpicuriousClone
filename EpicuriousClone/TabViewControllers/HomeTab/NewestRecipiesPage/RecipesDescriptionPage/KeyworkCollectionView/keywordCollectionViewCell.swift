//
//  keywordCollectionViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 09/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class keywordCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var keyworkLabel: UILabel!
    public static let reusableIdentity:String = "KeyworkCollectionViewCellReusableIdentity"

    public func setValue(keywordString:String) {
        keyworkLabel.text = keywordString
    }
}
