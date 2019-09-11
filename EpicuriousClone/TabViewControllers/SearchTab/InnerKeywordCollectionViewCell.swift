//
//  InnerKeywordCollectionViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 11/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class InnerKeywordCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var keywordLabel: UILabel!
    public static let reusableIdentity:String = "InnerKeywordCollectionViewReusableIdentity"
    public func setValues(keyword:String, row:Int) {
        keywordLabel.text = keyword
        setBackgroundColor(row: row)
    }

    fileprivate func setBackgroundColor(row:Int) {
        if(row % 3 == 0) {
            background.backgroundColor = UIColor.red
        } else if(row % 2 == 0) {
            background.backgroundColor = UIColor.blue
        } else {
            background.backgroundColor = UIColor.green
        }
    }
}
