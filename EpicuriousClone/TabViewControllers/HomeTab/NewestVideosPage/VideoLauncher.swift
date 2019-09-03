//
//  VideoLauncher.swift
//  EpicuriousClone
//
//  Created by Tringapps on 03/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class VideoPlayer:UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class VideoLauncher:NSObject {
    func showVideoPlayer() {
        print("Launching Video Player")
        guard let keyWindow = UIApplication.shared.keyWindow else {return}
        let view = UIView(frame: keyWindow.frame)
        view.frame = CGRect(x: 0, y: keyWindow.frame.height, width: keyWindow.frame.width, height: 0)
        view.backgroundColor = UIColor.black
        keyWindow.addSubview(view)

        let videoPlayerHeight = keyWindow.frame.width * 9/16
        let videoPlayerFrame = CGRect(x: 0, y: videoPlayerHeight/2, width: keyWindow.frame.width, height: videoPlayerHeight)
        let videoPlayer = VideoPlayer(frame:  videoPlayerFrame)
        view.addSubview(videoPlayer)
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            view.frame = keyWindow.frame
        }, completion: nil)
    }
}
