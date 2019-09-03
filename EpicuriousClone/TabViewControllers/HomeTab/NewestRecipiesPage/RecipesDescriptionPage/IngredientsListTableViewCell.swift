//
//  IngredientsListTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 03/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class IngredientsListTableViewCell: UITableViewCell {
    var ingredients:[String]!
    public static let reusableIdentity:String = "IngredientsListReusableIdentity"

    @IBOutlet weak var ingredientsTableView: UITableView!
    public func setValues(ingredients:[String]) {
        self.ingredients = ingredients
    }
}

extension IngredientsListTableViewCell: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Populating TableView with \(ingredients.count) elements")
        return ingredients.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("This is working")
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientInnerTableViewCell.reusableIdentity) as! IngredientInnerTableViewCell
        cell.setValues(ingredient: ingredients[indexPath.row])
        return cell
    }
}
