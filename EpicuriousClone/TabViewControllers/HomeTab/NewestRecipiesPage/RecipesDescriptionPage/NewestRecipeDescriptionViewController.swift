//
//  RecipeDescriptionViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 30/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class NewestRecipeDescriptionViewController: UIViewController {
    @IBOutlet weak var recipeDescriptionTableView:UITableView!

    let allRecipies:[NewestRecipiesDecodableDataModel] = []
    let selectedIndex:Int! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Recipe Description View Loaded")
    }
}
