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
    private let unwindSegueIdentifier:String = "unwindToNewestRecipiesSegueIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        recipeDescriptionTableView.dataSource = self
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
}

extension NewestRecipeDescriptionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(tableView.tag)
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
            let cell = recipeDescriptionTableView.dequeueReusableCell(withIdentifier: IngredientsListTableViewCell.reusableIdentity) as! IngredientsListTableViewCell
            cell.setValues(ingredients: allRecipies[selectedIndex].ingredients)
            return cell
        default:
            print("Internal Error In CollectionView")
            let cell = recipeDescriptionTableView.dequeueReusableCell(withIdentifier: HeadingImageTableViewCell.reusableIdentity) as! HeadingImageTableViewCell
            return cell
        }
    }
}
