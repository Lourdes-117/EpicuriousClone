//
//  SelectIngredientsViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 26/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class SelectIngredientsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var ingredientsArray:[CategoriesModel] = []
    let segueIdentifier:String = "CookingStepsSegueIdentifier"

    override func viewDidLoad() {
        tabBarController?.tabBar.setTabBarVisibility(false)
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        print("Select Ingredients View Loaded")
    }
    
    deinit {
        print("Select Ingredients Page Safe From Memory Leaks")
    }
}

extension SelectIngredientsViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SelectIngredientCell.reuseIdentity) as! SelectIngredientCell
        cell.setValues(ofModel: ingredientsArray[indexPath.row])
        return cell
    }
}

extension SelectIngredientsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
}
