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
    @IBOutlet weak var videoDescription: UILabel!

    var videoIsPlaying:Bool = true
    var player:AVPlayer!
    var urlString:String!
    let controlsContainerView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
        return view
    }()

    lazy var pauseOrPlayButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: Constants.HomeTab.PAUSE_ICON)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor.white
        button.isHidden = true
        button.addTarget(self, action: #selector(handlePause), for: .touchUpInside)
        return button
    }()

    lazy var videoLengthLabel:UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var videoSlider:UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = UIColor.red
        slider.maximumTrackTintColor = UIColor.white
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        return slider
    }()

    override func viewDidLoad() {
        print("VideoPlayer View Controller Loaded")
        super.viewDidLoad()
        initializePlayer()
        initializeControlLayer()
        initalizePlayerControls()
        initializeLabels()
        initializeSlider()
    }

    fileprivate func initializePlayer() {
        let url = URL(string: urlString)
        guard let urlObject = url
            else {
            print("Invalid URl")
            return
        }
        player = AVPlayer(url: urlObject)
        let playerLayer = AVPlayerLayer(player: player)
        videoPlayerView.layer.addSublayer(playerLayer)
        playerLayer.frame = CGRect(x: 0, y: 0, width: videoPlayerView.frame.width, height: videoPlayerView.frame.height)
        player.play()
        player.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "currentItem.loadedTimeRanges" {
            controlsContainerView.backgroundColor = .clear
            pauseOrPlayButton.isHidden = false
            videoIsPlaying = true

            guard let duration = player.currentItem?.duration else{return}
            let seconds = CMTimeGetSeconds(duration)
            let reminingMinutes:Int = Int(seconds/60)
            let reminingSeconds = Int(seconds)%60
            videoLengthLabel.text = "\(reminingMinutes):\(reminingSeconds)"
        }
    }

    fileprivate func initializeControlLayer() {
        controlsContainerView.frame = CGRect(x: 0, y: 0, width: videoPlayerView.frame.width, height: videoPlayerView.frame.height)
        videoPlayerView.addSubview(controlsContainerView)
    }

    fileprivate func initalizePlayerControls() {
        controlsContainerView.addSubview(pauseOrPlayButton)
        pauseOrPlayButton.centerXAnchor.constraint(equalTo: controlsContainerView.centerXAnchor).isActive = true
        pauseOrPlayButton.centerYAnchor.constraint(equalTo: controlsContainerView.centerYAnchor).isActive = true
        pauseOrPlayButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pauseOrPlayButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    fileprivate func initializeLabels() {
        controlsContainerView.addSubview(videoLengthLabel)
        videoLengthLabel.rightAnchor.constraint(equalTo: controlsContainerView.rightAnchor).isActive = true
        videoLengthLabel.bottomAnchor.constraint(equalTo: controlsContainerView.bottomAnchor).isActive = true
        videoLengthLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        videoLengthLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }

    fileprivate func initializeSlider() {
        controlsContainerView.addSubview(videoSlider)
        videoSlider.rightAnchor.constraint(equalTo: videoLengthLabel.leftAnchor).isActive = true
        videoSlider.bottomAnchor.constraint(equalTo: controlsContainerView.bottomAnchor).isActive = true
        videoSlider.leftAnchor.constraint(equalTo: controlsContainerView.leftAnchor).isActive = true
        videoSlider.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    @objc fileprivate func handlePause() {
        print("Play/Pause Button Pressed")
        if videoIsPlaying {
            player.pause()
            pauseOrPlayButton.setImage(UIImage(named: Constants.HomeTab.PLAY_ICON), for: .normal)
        } else {
            player.play()
            pauseOrPlayButton.setImage(UIImage(named: Constants.HomeTab.PAUSE_ICON), for: .normal)
        }
        videoIsPlaying = !videoIsPlaying
    }

    @objc fileprivate func handleSliderChange() {
        guard  let duration = player.currentItem?.duration else {return}
        let totalSeconds =  CMTimeGetSeconds(duration)
        let value = totalSeconds * Float64(videoSlider.value)
        let seekTime = CMTime(value: Int64(value), timescale: 1)
        player.seek(to: seekTime)
    }

    @IBAction func onClickCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
