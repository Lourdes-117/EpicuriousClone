//
//  NewFeedsPageViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 10/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class NewFeedsPageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var allrecipies:[NewestRecipiesDecodableDataModel] = []
    var allVideos:[NewestVideosDecodableDataModel] = []
    var newFeedsTitle:[NewFeedsDecodableDataModel] = []
    let dispatchGroup = DispatchGroup()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("New Feeds Page View Loaded")
        initalizeData()
        tableView.dataSource = self
        tableView.delegate = self
        dispatchGroup.notify(queue: .main, execute: {
            self.refreshViewController()
        })
    }

    fileprivate func initalizeData() {
        initializeRecipesData()
        initalizeVideosData()
        initializeNewFeedsTitle()
    }

    fileprivate func initializeRecipesData() {
        let fileName:String = "HomeTabNewestRecipePageJSON"
        let fileExtension:String = "json"
        let urlObject = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        GetDataFromApi.getJsonArrayFromFile(fromFile: urlObject!, dispatchGroup: dispatchGroup) { (entries: [NewestRecipiesDecodableDataModel]) in
            self.allrecipies = entries
        }
    }

    fileprivate func initalizeVideosData() {
        let fileName:String = "HomeTabNewestVideosPageJSON"
        let fileExtension:String = "json"
        let urlObject = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        GetDataFromApi.getJsonArrayFromFile(fromFile: urlObject!, dispatchGroup: dispatchGroup) { (entries: [NewestVideosDecodableDataModel]) in
            self.allVideos = entries
        }
    }

    fileprivate func initializeNewFeedsTitle() {
        let fileName:String = "HomeTabNewFeedsPageJSON"
        let fileExtension:String = "json"
        let urlObject = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        GetDataFromApi.getJsonArrayFromFile(fromFile: urlObject!, dispatchGroup: dispatchGroup) { (entries: [NewFeedsDecodableDataModel]) in
            self.newFeedsTitle = entries
        }
    }

    fileprivate func refreshViewController() {
        tableView.reloadData()
    }
}

extension NewFeedsPageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return newFeedsTitle.count
        case 1:
            return allVideos.count
        case 2:
            return 1
        default:
            print("Internal Error: Unexpected Section")
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: NewFeedsHeadingTableViewCell.reusableIdentity) as! NewFeedsHeadingTableViewCell
            cell.setValues(titleDetails: newFeedsTitle[indexPath.row])
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: VideosTableViewCell.reusableIdentity) as! VideosTableViewCell
            cell.setValues(ofVideo: allVideos[indexPath.row])
            return cell
//        case 2:
//            print("fds")
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: NewFeedsHeadingTableViewCell.reusableIdentity) as! NewFeedsHeadingTableViewCell
            cell.setValues(titleDetails: newFeedsTitle[indexPath.row])
            print("Internal Error: Unexpected Section at CellForRowAt")
            return cell
        }
    }
}

extension NewFeedsPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("A cell got selected by the user")
    }
}
