//
//  NewFeedsPageViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 10/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class NewFeedsPageViewController: UIViewController, scrollablePageView {

    @IBOutlet weak var tableView: UITableView!
    var allrecipies:[NewestRecipiesDecodableDataModel] = []
    var allVideos:[NewestVideosDecodableDataModel] = []
    var newFeedsTitle:[NewFeedsDecodableDataModel] = []

    let dispatchGroup = DispatchGroup()
    lazy var refresher:UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.white
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return refreshControl
    }()

    override func viewDidLoad() {
        hideNavigationBar()
        super.viewDidLoad()
        print("New Feeds Page View Loaded")
        tableView.dataSource = self
        tableView.delegate = self
        refreshData()
        setupRefreshControl()
    }

    fileprivate func hideNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }

    fileprivate func setupRefreshControl() {
        tableView.refreshControl = refresher
    }

    @objc fileprivate func refreshData() {
        initalizeData()
        dispatchGroup.notify(queue: .main, execute: { [weak self] in
            self?.refreshViewController()
            self?.refresher.endRefreshing()
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
        GetDataFromApi.getJsonArrayFromFile(fromFile: urlObject!, dispatchGroup: dispatchGroup) { [weak self] (entries: [NewestRecipiesDecodableDataModel]) in
            self?.allrecipies = entries
        }
    }

    fileprivate func initalizeVideosData() {
        let fileName:String = "HomeTabNewestVideosPageJSON"
        let fileExtension:String = "json"
        let urlObject = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        GetDataFromApi.getJsonArrayFromFile(fromFile: urlObject!, dispatchGroup: dispatchGroup) {[weak self] (entries: [NewestVideosDecodableDataModel]) in
            self?.allVideos = entries
        }
    }

    fileprivate func initializeNewFeedsTitle() {
        let fileName:String = "HomeTabNewFeedsPageJSON"
        let fileExtension:String = "json"
        let urlObject = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        GetDataFromApi.getJsonArrayFromFile(fromFile: urlObject!, dispatchGroup: dispatchGroup) { [weak self] (entries: [NewFeedsDecodableDataModel]) in
            self?.newFeedsTitle = entries
        }
    }

    fileprivate func refreshViewController() {
        tableView.reloadData()
    }

    enum section {
        case firstSection
        case secondSection
        case thirdSection
    }
    let sectionEnumAray = [section.firstSection, section.secondSection, section.thirdSection]

    deinit {
        print("NewFeeds Page Safe From Memory Leaks")
    }
}

extension NewFeedsPageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        let numberOfSections:Int = 3
        return numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionToPopulate = sectionEnumAray[section]
        switch sectionToPopulate {
        case .firstSection:
            return newFeedsTitle.count
        case .secondSection:
            return allVideos.count
        case .thirdSection:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionToPopulate = sectionEnumAray[indexPath.section]
        switch sectionToPopulate {
        case .firstSection:
            let cell = tableView.dequeueReusableCell(withIdentifier: NewFeedsHeadingTableViewCell.reusableIdentity) as! NewFeedsHeadingTableViewCell
            cell.setValues(titleDetails: newFeedsTitle[indexPath.row])
            return cell
        case .secondSection:
            let cell = tableView.dequeueReusableCell(withIdentifier: VideosTableViewCell.reusableIdentity) as! VideosTableViewCell
            cell.setValues(ofVideo: allVideos[indexPath.row])
            return cell
        case .thirdSection:
            let cell  = tableView.dequeueReusableCell(withIdentifier: MoreRecipiesCollectionViewTableViewCell.reusableIdentity) as! MoreRecipiesCollectionViewTableViewCell
            cell.setValues(recipies: allrecipies, parent: self)
            return cell
        }
    }
}

extension NewFeedsPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCell = tableView.cellForRow(at: indexPath)
        if let cell = selectedCell as? VideosTableViewCell {
            let videoPlayerViewController = UIStoryboard.init(name: "HomeTab", bundle: Bundle.main).instantiateViewController(withIdentifier: Constants.ViewControllers.VIDEO_PLAYER) as! VideoPlayerViewController
            videoPlayerViewController.urlString = cell.videoUrl
            videoPlayerViewController.descriptionString = cell.description
            self.present(videoPlayerViewController, animated: true, completion: nil)
        }
    }
}
