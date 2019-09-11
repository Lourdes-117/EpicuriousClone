//
//  RecipeDescriptionViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 26/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class RecipeDescriptionViewController: UIViewController {
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeDescription: UILabel!
    @IBOutlet weak var thicknessCollectionView: UICollectionView!
    @IBOutlet weak var cookingDeepnessCollectionView: UICollectionView!
    @IBOutlet weak var preparationStepOne: UILabel!
    @IBOutlet weak var cookTimeMinutes: UILabel!
    @IBOutlet weak var cookTimeSeconds: UILabel!

    @IBOutlet weak var preparationStepOneHeading: UILabel!
    var allDescriptionData:DescriptionDataModelProtocol!
    var thicknessArray:[(String,Int,Int)] = []
    var cookingDeepnessArray:[(String,Int,Int)] = []
    let preparationSegueIdentifier:String = "PreparationStepsSegueIdentifier"
    let timerSegueIdentifier:String = "setTimerSegueIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        thicknessCollectionView.dataSource = self
        cookingDeepnessCollectionView.dataSource = self
        setDefaultValues()
        print("Recipe Description Page Loaded")
    }

    @IBAction func onClickPreviewAllSteps(_ sender: Any) {
        performSegue(withIdentifier: preparationSegueIdentifier, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let preparationStepsViewController = segue.destination as? PreparationStepsViewController {
            preparationStepsViewController.recipeProcedureArray = allDescriptionData.steps
            preparationStepsViewController.recipeNameString = allDescriptionData.recipeName
        } else if let notificationViewController = segue.destination as? NotificationSetterViewController {
            notificationViewController.minutesToCook = Int(cookTimeMinutes.text!)!
            notificationViewController.secondsToCook = Int(cookTimeSeconds.text!)!
            notificationViewController.recipeImageToSet = allDescriptionData.recipeImage
            notificationViewController.recipeNameToSet = allDescriptionData.recipeName
            notificationViewController.recipeProcedureArray = allDescriptionData.steps
        }
    }

    @IBAction func onClickStartSmartTimer(_ sender: Any) {
        performSegue(withIdentifier: timerSegueIdentifier, sender: self)
    }

    fileprivate func setDefaultValues() {
        recipeName.text = allDescriptionData.recipeName
        recipeDescription.text = allDescriptionData.recipeDescription
        let (preperationStepOneHeadingString, preparationStepOneDescriptionString):(String, String) = allDescriptionData.steps[0]
        preparationStepOneHeading.text = "Step 1 | \(preperationStepOneHeadingString)"
        preparationStepOne.text = preparationStepOneDescriptionString
        cookTimeMinutes.text = String(format: "%02d", Int(allDescriptionData.defaultMinutes)!)
        cookTimeSeconds.text = String(format: "%02d", Int(allDescriptionData.defaultSeconds)!)
        thicknessArray = allDescriptionData.thicknessArray
        cookingDeepnessArray = allDescriptionData.cookingDeepnessArray
        recipeImage.image = allDescriptionData.recipeImage
    }
}


extension RecipeDescriptionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView.tag == 0) {
            return thicknessArray.count
        } else {
            return cookingDeepnessArray.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView.tag == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThinknessReusableCollectionViewCell.reusableCellIdentity, for: indexPath) as! ThinknessReusableCollectionViewCell
            let (text, _, _) = thicknessArray[indexPath.row]
            cell.setText(text)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CookingDeepnessReusableCollectionViewCell.reusableCellIdentity, for: indexPath) as! CookingDeepnessReusableCollectionViewCell
            let (text, _, _) = cookingDeepnessArray[indexPath.row]
            cell.setText(text)
            return cell
        }
    }
}
