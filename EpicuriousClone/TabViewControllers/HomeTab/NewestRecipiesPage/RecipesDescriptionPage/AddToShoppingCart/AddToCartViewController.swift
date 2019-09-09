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
    }

    fileprivate func initializeSeledtedIngredients() {
        selectedIngredients.append(contentsOf: allIngredients)
    }

    @IBAction func onClickCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func onClickAddToCartButton(_ sender: Any) {
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
}

extension AddToCartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath) as! IngredientTableViewCell
        selectedCell.buyingStatusImageView.image = UIImage(named: Constants.CheckListTab.UNPURCHASED)
    }
}
