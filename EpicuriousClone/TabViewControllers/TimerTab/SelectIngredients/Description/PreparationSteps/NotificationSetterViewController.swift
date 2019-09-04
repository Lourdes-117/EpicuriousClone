//
//  NotificationSetterViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 04/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class NotificationSetterViewController: UIViewController {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeCookingTime: UILabel!
    @IBOutlet var buttons: [UIButton]!

    var recipeImageToSet:UIImage!
    var minutesToCook:Int!
    var secondsToCook:Int!
    var recipeNameToSet:String!
    var recipeProcedureArray:[(String,String)]!
    let segueIdentifier:String = "showProcedureSegueIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Notification Timer View Loaded")
        initializeScreen()
        applyDesigns()
    }

    fileprivate func initializeScreen() {
        let minutesString:String = String(format: "%02d", minutesToCook)
        let secondsString:String = String(format: "%02d", secondsToCook)
        recipeCookingTime.text = "\(minutesString):\(secondsString)"
        recipeImage.image = recipeImageToSet
        recipeName.text = recipeNameToSet
    }

    fileprivate func applyDesigns() {
        buttons.forEach { (button) in
            button.layer.cornerRadius = button.frame.height/2
        }
    }

    @IBAction func onClickPlayOrPauseButton(_ sender: Any) {
    }

    @IBAction func onClickStopButton(_ sender: Any) {
    }

    @IBAction func onClickProcedureButton(_ sender: Any) {
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let preparationStepsViewController = segue.destination as? PreparationStepsViewController {
            preparationStepsViewController.recipeProcedureArray = recipeProcedureArray
            preparationStepsViewController.recipeNameString = recipeNameToSet
        }
    }

    deinit {
        print("Notification Timer View Safe From Memory Leaks")
    }
}
