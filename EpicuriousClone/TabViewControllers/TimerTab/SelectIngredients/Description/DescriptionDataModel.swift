//
//  DescriptionDataModel.swift
//  EpicuriousClone
//
//  Created by Tringapps on 26/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
import UIKit
protocol DescriptionDataModelProtocol {
    var recipeName:String{get}
    var recipeDescription:String{get}
    var thicknessArray:[(String,Int,Int)]{get}
    var cookingDeepnessArray:[(String,Int,Int)]{get}
    var steps:[(String, String)]{get}
    var defaultMinutes:String{get}
    var defaultSeconds:String{get}
    var recipeImage:UIImage{get}
}
class DescriptionDataModel {
    static let allrecipe:[DescriptionDataModelProtocol] = [FlankSteak(), StripSteak(), PorterHouse(), RibeyeSteakBoneLess(), SkirtSteak(), AcronSquash(), Beets(), Broccoli(), BrusselSprouts(), ButternutSquash(), CarrotParsnips(), Cauliflower(), Eggplant(), Mushrooms(), SpaghettiSquash(), SweetPotatoes(), Tomatoes(), ZuchiniorSummerSquash(),ChickenBreastsBoneInAndSkinOn(), ChickenBreastBonelessAndSkinless(), ChickenCutlets(), ChickenDrumsticks(), ChickenThighsBoneInAndSkinOn(), ChickenThighsBonelessAndSkiless(), WholeChicken(), PorkChopsBoneIn(), PorkChopsBoneless(), PorkLoinBonelessAndTied(), PorkTenderloin(), CodFilet(), SalmonFillet(), SalmonSteaks(), Shrimp(), Swordfish(), TilapiaFilet(), SoftBoiledRunnyYolks(), SoftBoiledCustardyYolks(), HardBoiledMoistYolks(), HardBoiledFirmYolks()]

    //Steak
    struct FlankSteak:DescriptionDataModelProtocol {
        var recipeName: String = ""
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.FLANK_STEAK)!
    }
    struct StripSteak:DescriptionDataModelProtocol {
        var recipeName: String = "N.Y Strip Steak"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.NY_FLANK_STEAK)!
    }

    struct PorterHouse:DescriptionDataModelProtocol {
        var recipeName: String = "PorterHouse"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.PORTERHOUSE)!
    }

    struct RibeyeSteakBoneLess:DescriptionDataModelProtocol {
        var recipeName: String = "Ribeye Steak Boneless"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.RIBEYE_STEAK_BONELESS)!
    }

    struct SkirtSteak:DescriptionDataModelProtocol {
        var recipeName: String = "Skirt Steak"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.SKIRT_STEAK)!
    }

    //Vegetables
    struct AcronSquash:DescriptionDataModelProtocol {
        var recipeName: String = "Acron Squash"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.ACRON_SQUASH)!
    }

    struct Beets:DescriptionDataModelProtocol {
        var recipeName: String = "Beets"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.BEETS)!
    }

    struct Broccoli:DescriptionDataModelProtocol {
        var recipeName: String = "Broccoli"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.BROCOLLI)!
    }

    struct BrusselSprouts:DescriptionDataModelProtocol {
        var recipeName: String = "Brussel Sprouts"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.BRUSSEL_SPROUTS)!
    }

    struct ButternutSquash:DescriptionDataModelProtocol {
        var recipeName: String = "Butternut Squash"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.BUTTERNUT_SQUASH)!
    }

    struct CarrotParsnips:DescriptionDataModelProtocol {
        var recipeName: String = "Carrot Parsnips"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.CARROTS_OR_PARSNIPS)!
    }

    struct Cauliflower:DescriptionDataModelProtocol {
        var recipeName: String = "Cauliflower"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.CAULIFLOWER)!
    }

    struct Eggplant:DescriptionDataModelProtocol {
        var recipeName: String = "Eggplant"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.EGGPLANT)!
    }

    struct Mushrooms:DescriptionDataModelProtocol {
        var recipeName: String = "Mushrooms"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.MUSHROOMS)!
    }

    struct SpaghettiSquash:DescriptionDataModelProtocol {
        var recipeName: String = "Spaghetti Squash"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.SPAGETTI_SQUASH)!
    }

    struct SweetPotatoes:DescriptionDataModelProtocol {
        var recipeName: String = "Sweet Potatoes"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.SWEET_POTATOES)!
    }

    struct Tomatoes:DescriptionDataModelProtocol {
        var recipeName: String = "Tomatoes"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.TOMATOES)!
    }

    struct ZuchiniorSummerSquash:DescriptionDataModelProtocol {
        var recipeName: String = "Zuchini or Summer Squash"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.ZUCHENNI_OR_SUMMER_SQUASH)!
    }

    //ChickenAndPork
    struct ChickenBreastsBoneInAndSkinOn:DescriptionDataModelProtocol {
        var recipeName: String = "Chicken Breast, Bone-In and Skin-On"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.CHICKEN_BREAST_BONE_IN_AND_SKIN_ON)!
    }
    struct ChickenBreastBonelessAndSkinless:DescriptionDataModelProtocol {
        var recipeName: String = "Chicken Breast, Boneless and Skinless"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.CHICKEN_BREASTS_BONELESS_AND_SKINLESS)!
    }
    struct ChickenCutlets:DescriptionDataModelProtocol {
        var recipeName: String = "Chicken Cutlets"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.CHICKEN_CUTLETS)!
    }
    struct ChickenDrumsticks:DescriptionDataModelProtocol {
        var recipeName: String = "Chicken Drumsticks"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.CHICKEN_DRUMSTICKS)!
    }
    struct ChickenThighsBoneInAndSkinOn:DescriptionDataModelProtocol {
        var recipeName: String = "Chicken Thighs, Bone-In and Skin-On"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.CHICKEN_THIGH_BONE_IN_AND_SKIN_ON)!
    }
    struct ChickenThighsBonelessAndSkiless:DescriptionDataModelProtocol {
        var recipeName: String = "Chicken Thighs, Boneless and Skiless"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.CHICKEN_THIGHS_BONELESS_AND_SKINLESS)!
    }
    struct WholeChicken:DescriptionDataModelProtocol {
        var recipeName: String = "Whole Chicken"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.WHOLE_CHICKEN)!
    }
    struct PorkChopsBoneIn:DescriptionDataModelProtocol {
        var recipeName: String = "Pork Chops, Bone In"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.PORK_CHOPS_BONE_IN)!
    }
    struct PorkChopsBoneless:DescriptionDataModelProtocol {
        var recipeName: String = "Pork Chops, Boneless"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.PORK_CHOPS_BONELESS)!
    }
    struct PorkLoinBonelessAndTied:DescriptionDataModelProtocol {
        var recipeName: String = "Pork Loin, Boneless and Tied"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.PORK_LOINS_BONELESS_AND_TIED)!
    }
    struct PorkTenderloin:DescriptionDataModelProtocol {
        var recipeName: String = "Pork Tenderloin"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.PORK_TENDERLOIN)!
    }

    //Seafood
    struct CodFilet:DescriptionDataModelProtocol {
        var recipeName: String = "Cod Filets"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.COD_FILLETS)!
    }
    struct SalmonFillet:DescriptionDataModelProtocol {
        var recipeName: String = "Salmon Fillet"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.SALMON_FILLET)!
    }
    struct SalmonSteaks:DescriptionDataModelProtocol {
        var recipeName: String = "Salmon Steaks"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.SALMON_STEAKS)!
    }
    struct Shrimp:DescriptionDataModelProtocol {
        var recipeName: String = "Shrimp"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.SHRIMP)!
    }
    struct Swordfish:DescriptionDataModelProtocol {
        var recipeName: String = "Swordfish Steaks"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.SWORDFISH_STEAKS)!
    }
    struct TilapiaFilet:DescriptionDataModelProtocol {
        var recipeName: String = "Tilapia Filets"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.TILAPA_FILETS)!
    }

    //Eggs
    struct SoftBoiledRunnyYolks:DescriptionDataModelProtocol {
        var recipeName: String = "Soft Boiled, Runny Yolks"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.SOFT_BOILED_RUNNY_YOLKS)!
    }
    struct SoftBoiledCustardyYolks:DescriptionDataModelProtocol {
        var recipeName: String = "Soft Boiled, Custardy Yolks"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.SOFT_BOILED_CUSTARD_YOLDS)!
    }
    struct HardBoiledMoistYolks:DescriptionDataModelProtocol {
        var recipeName: String = "Hard Boiled, Moist Yolks"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.HARD_BOILED_MOIST_YOLKS)!
    }
    struct HardBoiledFirmYolks:DescriptionDataModelProtocol {
        var recipeName: String = "Hard Boiled, Firm Yolks"
        var recipeDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        var thicknessArray: [(String, Int, Int)] = [("1 pound", 0, 0), ("11/4 pound", 1, 0), ("11/2 pound", 1, 30)]
        var cookingDeepnessArray: [(String, Int, Int)] = [("Rare", 0, 0), ("Medium-Rare", 1, 0), ("Medium", 1, 0), ("Medium-Well", 1, 0)]
        var steps: [(String, String)] = [("Text1", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."), ("Text2","The point of using Lorem Ipsum is that it has a more-or-less normal distribution o letters"), ("Text3","As opposed to using 'Content here, content here', making it look like readable English.")]
        var defaultMinutes: String = "6"
        var defaultSeconds: String = "30"
        var recipeImage: UIImage = UIImage(named: Constants.TimerTab.HARD_BOILED_FIRM_YOLKS)!
    }


    public static func getDescription(ofRecipe name:String) -> DescriptionDataModelProtocol {
        for recipe in DescriptionDataModel.allrecipe {
            if(recipe.recipeName == name) {
                return recipe
            }
        }
        return RibeyeSteakBoneLess()
    }
}
