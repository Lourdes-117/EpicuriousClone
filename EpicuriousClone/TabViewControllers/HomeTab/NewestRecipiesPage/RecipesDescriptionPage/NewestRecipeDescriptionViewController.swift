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
    private let addToCartSegue:String = "addToShoppingListSegueIdentifier"
    private let reviewSegue:String = "ReviewsSegueIdentifier"
    private let unwindSegueIdentifier:String = "unwindToNewestRecipiesSegueIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        recipeDescriptionTableView.dataSource = self
        recipeDescriptionTableView.delegate = self
        print("Recipe Description View Loaded")
    }

    override func viewWillAppear(_ animated: Bool) {
        print("Recipe Description View Will Appear")
        super.viewWillAppear(animated)
        hideTabBarController()
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("Recipe Description View Will Disappear")
        super.viewWillDisappear(animated)
        showTabBarController()
    }

    fileprivate func hideTabBarController() {
        tabBarController?.tabBar.setTabBarVisibility(false)
    }

    fileprivate func showTabBarController() {
        tabBarController?.tabBar.setTabBarVisibility(true)
    }

    @IBAction func onClickBackButton(_ sender: Any) {
        performSegue(withIdentifier: unwindSegueIdentifier, sender: self)
    }

    deinit {
        print("Recipe Description View Safe From Memory Leaks")
    }

    @IBAction func onClickAddToShoppingListButton(_ sender: Any) {
        performSegue(withIdentifier: addToCartSegue, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addToCartViewController = segue.destination as? AddToCartViewController {
            addToCartViewController.allIngredients = allRecipies[selectedIndex].ingredients
        }
    }
}

extension NewestRecipeDescriptionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 2) {
            return allRecipies[selectedIndex].ingredients.count
        }
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return getCellForDescriptionPage(forSection: indexPath.section, atIndex: indexPath.row)
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
            let cell = recipeDescriptionTableView.dequeueReusableCell(withIdentifier: IngredientInnerTableViewCell.reusableIdentity) as! IngredientInnerTableViewCell
            cell.setValues(ingredient: allRecipies[selectedIndex].ingredients[row])
            return cell
        case 3:
            let cell = recipeDescriptionTableView.dequeueReusableCell(withIdentifier: AddToCartButtonTableViewCell.reusableIdentity) as! AddToCartButtonTableViewCell
            cell.setValues(ingredientArray: allRecipies[selectedIndex].ingredients)
            return cell
        case 4:
            let cell = recipeDescriptionTableView.dequeueReusableCell(withIdentifier: PreparationTextTableViewCell.reusableIdentity) as! PreparationTextTableViewCell
            cell.setValue(preparation: allRecipies[selectedIndex].preparation)
            return cell
        default:
            print("Internal Error In CollectionView")
            let cell = recipeDescriptionTableView.dequeueReusableCell(withIdentifier: HeadingImageTableViewCell.reusableIdentity) as! HeadingImageTableViewCell
            return cell
        }
    }
}

extension NewestRecipeDescriptionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        case 1:
            return 250
        case 2:
            return 50
        case 3:
            return 100
        case 4:
            return 550
        default:
            return 250
        }
    }
}
