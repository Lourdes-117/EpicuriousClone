//
//  NewestRecipiesViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 03/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class NewestRecipiesViewController: UIViewController {
    var allVideos:[NewestVideosDecodableDataModel] = []
    @IBOutlet weak var tableView: UITableView!

    let dispatchGroup = DispatchGroup()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Newest Videos View Loaded")
        initalizeData()
        tableView.dataSource = self
        tableView.delegate = self
        dispatchGroup.notify(queue: .main, execute: {
            self.refreshViewController()
        })
    }

    fileprivate func initalizeData() {
        let fileName:String = "HomeTabNewestVideosPageJSON"
        let fileExtension:String = "json"
        let urlObject = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        GetDataFromApi.getJsonArrayFromFile(fromFile: urlObject!, dispatchGroup: dispatchGroup) { (entries: [NewestVideosDecodableDataModel]) in
            self.allVideos = entries
        }
    }

    fileprivate func refreshViewController() {
        tableView.reloadData()
    }

    deinit {
        print("Newest Videos View Safe From Memory Leaks")
    }
}

extension NewestRecipiesViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return allVideos.count
        default:
            print("Internal Error")
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: NewestVideosHeaderTableViewCell.reusableIdentity) as! NewestVideosHeaderTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: VideosTableViewCell.reusableIdentity) as! VideosTableViewCell
            cell.setValues(ofVideo: self.allVideos[indexPath.row])
            return cell;
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: NewestVideosHeaderTableViewCell.reusableIdentity) as! NewestVideosHeaderTableViewCell
            print("Internal Error")
            return cell
        }
    }
}

extension NewestRecipiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
