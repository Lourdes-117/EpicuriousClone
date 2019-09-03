//
//  RecipeDescriptionViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 30/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class NewestRecipeDescriptionViewController: UIViewController {
    @IBOutlet weak var recipeDescriptionTableView: UITableView!
    var allRecipies:[NewestRecipiesDecodableDataModel] = []
    var selectedIndex:Int! = nil
    private let segueIdentifier:String = "ReviewsSegueIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        recipeDescriptionTableView.dataSource = self
        print("Recipe Description View Loaded")
    }
}

extension NewestRecipeDescriptionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if(tableView.tag == 0) {
            return 3
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView.tag == 0) {
            return 1
        } else {
            print("Works here also")
            return allRecipies[selectedIndex].ingredients.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(tableView.tag)
        if(tableView.tag == 0) {
            return getCellForDescriptionPage(forSection: indexPath.section, atIndex: indexPath.row)
        } else {
            return getCellForIngredientsTableView(atIndex: indexPath.row)
        }
    }

    fileprivate func getCellForDescriptionPage(forSection section:Int, atIndex row:Int) ->UITableViewCell {
        switch  section {
        case 0:
            let cell = recipeDescriptionTableView.dequeueReusableCell(withIdentifier: HeadingImageTableViewCell.reusableIdentity) as! HeadingImageTableViewCell
            cell.setValue(imageUrl: allRecipies[row].recipeImageUrl)
            return cell
        case 1:
            let cell = recipeDescriptionTableView.dequeueReusableCell(withIdentifier: RecipeReviewTableViewCell.reusableIdentity) as! RecipeReviewTableViewCell
            cell.setValue(data: allRecipies[selectedIndex])
            return cell
        case 2:
            let cell = recipeDescriptionTableView.dequeueReusableCell(withIdentifier: IngredientsListTableViewCell.reusableIdentity) as! IngredientsListTableViewCell
            cell.setValues(ingredients: allRecipies[selectedIndex].ingredients)
            return cell
        default:
            print("Internal Error In CollectionView")
            let cell = recipeDescriptionTableView.dequeueReusableCell(withIdentifier: HeadingImageTableViewCell.reusableIdentity) as! HeadingImageTableViewCell
            return cell
        }
    }

    fileprivate func getCellForIngredientsTableView(atIndex row:Int) -> UITableViewCell{
        print("CellForRowAt")
        let ingredientsCell = recipeDescriptionTableView.dequeueReusableCell(withIdentifier: IngredientsListTableViewCell.reusableIdentity) as! IngredientsListTableViewCell
        let cell = ingredientsCell.ingredientsTableView.dequeueReusableCell(withIdentifier: IngredientInnerTableViewCell.reusableIdentity) as! IngredientInnerTableViewCell
        cell.setValues(ingredient: allRecipies[selectedIndex].ingredients[row])
        return cell
    }

}
