//
//  SearchTabViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 11/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class SearchTabViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var data:[SearchTabDecodableDataModel] = []
    let dispatchGroup = DispatchGroup()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Search Tab View Loaded")
        setupTableView()
        initializeData()
        dispatchGroup.notify(queue: .main, execute: {
            self.refreshViewController()
        })
    }

    fileprivate func refreshViewController() {
        tableView.reloadData()
    }

    fileprivate func setupTableView() {
        tableView.dataSource = self
    }

    fileprivate func initializeData() {
        let fileName:String = "SearchTabJSON"
        let fileExtension:String = "json"
        let urlObject = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        GetDataFromApi.getJsonArrayFromFile(fromFile: urlObject!, dispatchGroup: dispatchGroup) { (entries: [SearchTabDecodableDataModel]) in
            self.data = entries
        }
    }

    deinit {
        print("Search Tab View Safe From Memory leaks")
    }
}

extension SearchTabViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reusableIdentity) as! SearchTableViewCell
        cell.setValues(parent: self, data: data[indexPath.row], displayingRow: indexPath.row)
        return cell
    }
}
