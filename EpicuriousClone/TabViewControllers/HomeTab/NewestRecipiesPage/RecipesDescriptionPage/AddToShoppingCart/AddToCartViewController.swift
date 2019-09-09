//
//  AddToCartViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 09/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class AddToCartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var allIngredients:[String]!
    var selectedIngredients:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        initializeSeledtedIngredients()
    }

    fileprivate func initializeSeledtedIngredients() {
        selectedIngredients.append(contentsOf: allIngredients)
    }

    @IBAction func onClickCancelButton(_ sender: Any) {
        print("Cancel button is clicked")
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func onClickAddToCartButton(_ sender: Any) {
        print("Add To Cart Button is clicked")
        selectedIngredients.forEach { (entry) in
            let newTasks = ToDoCheckList(context: PersistentService.context)
            newTasks.checkListItemIsPurchased = false
            newTasks.checkListItemName = entry
            PersistentService.saveContext()
            self.dismiss(animated: true, completion: true)
        }
    }
}

extension AddToCartViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title:String = "ITEMS YOU NEED"
        return title
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allIngredients.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientTableViewCell.reusableIdentity) as! IngredientTableViewCell
        cell.setValues(itemName: allIngredients[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height:CGFloat = 50
        return height
    }
}

extension AddToCartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath) as! IngredientTableViewCell
        let ingredientInSelectedCell:String = selectedCell.itemName.text!
        if(selectedIngredients.contains(ingredientInSelectedCell)) {
            selectedIngredients.remove(at: selectedIngredients.firstIndex(of: ingredientInSelectedCell)!)
            selectedCell.buyingStatusImageView.image = UIImage(named: Constants.CheckListTab.UNPURCHASED)

        } else {
            selectedIngredients.append(ingredientInSelectedCell)
            selectedCell.buyingStatusImageView.image = UIImage(named: Constants.TimerTab.TASK_COMPLETED)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
