//
//  NewestRecipiesDecodableDataModel.swift
//  EpicuriousClone
//
//  Created by Tringapps on 29/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
struct NewestRecipiesDecodableDataModel: Decodable {
    var recipeName:String!
    var pictureCourtesy:String!
    var recipeImageUrl:String!
    var rating:String!
    var makeItAgain:String!
    var reviews:[NewestRecipieReviewDecodableDataModel]!
    var yeild:String!
    var activeTime:String!
    var totalTime:String!
    var yeildDesctiption:String!
    var ingredients:[String]!
    var preparation:String!
    var doAhead:String!
    var keyWords:[String]!
}
