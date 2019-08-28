//
//  PreparationStepsReusableCellTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 27/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class PreparationStepsReusableCellTableViewCell: UITableViewCell {
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var procedureLabel: UILabel!

    static let reusableIdentity:String = "PreparationStepsReusableCellIdentity"
    func setStepValue(number: Int, procedure: (String, String)) {
        stepLabel.textColor = UIColor.white
        procedureLabel.textColor = UIColor.white
        let (stepHeading, stepDescription):(String, String) = procedure
        self.stepLabel.text?.append(contentsOf: "\(number) | \(stepHeading)")
        self.procedureLabel.text = stepDescription
    }
}
