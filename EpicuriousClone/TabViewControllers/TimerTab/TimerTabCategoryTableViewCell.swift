//
//  TimerTabCategoryTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 26/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class TimerTabCategoryTableViewCell: UITableViewCell {

    public static let reuseIdentity:String = "CategoryTableViewCellReuseIdentity"
    @IBOutlet var backgroundImage:UIImageView!
    @IBOutlet var categoryTitle:UILabel!

    func setValues(ofModel toSet: CategoriesModel) {
        categoryTitle.text = toSet.categoryTitle
        backgroundImage.image = UIImage(named: toSet.backgroundImage)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
