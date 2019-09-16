//
//  IngredientsPageViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 16/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class IngredientsPageViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var ingredients:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setRoundCancelButton()
        print("Ingredients Page View Loaded")
    }

    fileprivate func setRoundCancelButton() {
        cancelButton.layer.cornerRadius = cancelButton.frame.height/2
    }

    @IBAction func onClickCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    deinit {
        print("Ingredients Page Safe From Memory Leaks")
    }
}

extension IngredientsPageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return self.ingredients.count
        default:
            print("Internal Error")
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientsViewHeaderCellTableViewCell.reusableIdentity) as! IngredientsViewHeaderCellTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientNameTableViewCell.reusableIdentity) as! IngredientNameTableViewCell
            cell.setValue(name: self.ingredients[indexPath.row])
            return cell
        default:
            print("Internal Error")
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientsViewHeaderCellTableViewCell.reusableIdentity) as! IngredientsViewHeaderCellTableViewCell
            return cell
        }
    }
}
