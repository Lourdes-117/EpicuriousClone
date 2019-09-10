//
//  VideosTableViewCell.swift
//  EpicuriousClone
//
//  Created by Tringapps on 03/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class VideosTableViewCell: UITableViewCell {
    public static let reusableIdentity:String = "videoCellIdentity"
    @IBOutlet weak var videoThumbnail: UIImageView!
    @IBOutlet weak var videoDescription: UILabel!

    var videoUrl:String!
    public func setValues(ofVideo data:NewestVideosDecodableDataModel) {
        videoThumbnail.loadImageFromURLString(data.imageUrl)
        videoDescription.text = data.description
        videoUrl = data.videoUrl
    }
}
