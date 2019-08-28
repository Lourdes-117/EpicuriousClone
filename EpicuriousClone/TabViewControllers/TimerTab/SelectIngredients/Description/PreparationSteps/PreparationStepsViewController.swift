//
//  PreparationStepsViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 27/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class PreparationStepsViewController: UIViewController {

    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var recipeNameString:String!
    var recipeProcedureArray:[(String, String)] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setDefaultValues()
        print("Preparation Steps View Loaded")
    }

    fileprivate func setDefaultValues() {
        recipeName.text = recipeNameString
    }

    @IBAction func onClickCancelButton(_ sender: Any) {
        print("Cancel Button Clicked")
        self.dismiss(animated: true, completion: nil)
    }

    deinit {
        print("Preparation Steps View Safe From Memory Leaks")
    }
}

extension PreparationStepsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PreparationStepsReusableCellTableViewCell.reusableIdentity) as! PreparationStepsReusableCellTableViewCell
        cell.setStepValue(number: indexPath.row, procedure: recipeProcedureArray[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeProcedureArray.count
    }
}
