//
//  NewestRecipiesPageViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 29/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class NewestRecipiesPageViewController: UIViewController {
    @IBOutlet weak var recipiesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Newest Recipies Page View Loaded")
        recipiesTableView.dataSource = self
    }
}

extension NewestRecipiesPageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipiesTableView.dequeueReusableCell(withIdentifier: NewestRecipiesTableViewCell.reusableIdentity) as! NewestRecipiesTableViewCell
        return cell
    }


}
