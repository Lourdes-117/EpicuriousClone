//
//  NewFeedsDataModel.swift
//  EpicuriousClone
//
//  Created by Tringapps on 10/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

enum section {
    case firstSection
    case secondSection
    case thirdSection
}
let sectionEnumAray = [section.firstSection, section.secondSection, section.thirdSection]

import Foundation
class NewFeedsDecodableDataModel:Decodable {
    var headingTitle:String!
    var headingDescription:String!
}

class NewsFeed {
    var items : [NewFeedsDecodableDataModel]
    var type : section

    init(items:[NewFeedsDecodableDataModel], type: section) {
        self.items = items
        self.type = type
    }
}


var obj1 = NewsFeed(items: [], type: .firstSection)
var obj2 = NewsFeed(items: [], type: .secondSection)
var obj3 = NewsFeed(items: [], type: .thirdSection)
let result = [obj1, obj2, obj3]
