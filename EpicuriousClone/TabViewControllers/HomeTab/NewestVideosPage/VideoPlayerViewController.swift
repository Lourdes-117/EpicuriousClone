//
//  VideoPlayerViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 03/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayerViewController: UIViewController {
    @IBOutlet weak var videoPlayerView: UIView!

    var urlString:String!
    override func viewDidLoad() {
        print("VideoPlayer View Controller Loaded")
        super.viewDidLoad()
        initializePlayer()
    }
    fileprivate func initializePlayer() {
        let url = URL(string: urlString)
        guard let urlObject = url
            else {
            print("Invalid URl")
            return
        }
        let player = AVPlayer(url: urlObject)
        let playerLayer = AVPlayerLayer(player: player)
        videoPlayerView.layer.addSublayer(playerLayer)
        playerLayer.frame = CGRect(x: 0, y: 0, width: videoPlayerView.frame.width, height: videoPlayerView.frame.height)
        player.play()
    }
    @IBAction func onClickCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
