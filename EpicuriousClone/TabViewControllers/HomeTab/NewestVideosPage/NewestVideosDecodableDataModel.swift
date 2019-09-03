//
//  NewestVideosDataModel.swift
//  EpicuriousClone
//
//  Created by Tringapps on 03/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
struct NewestVideosDecodableDataModel: Decodable{
    var imageUrl:String!
    var videoUrl:String!
    var description:String!
    var videoDurationMinutes:String!
    var videoDurationSeconds:String!
}
