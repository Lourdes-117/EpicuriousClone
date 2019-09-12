//
//  TimerTabViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 26/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class TimerTabViewController: UIViewController {
    let segueIdentifier:String = "SelectIngredientSegueIdentifier"
    var categoriesArray:[CategoriesModel] = []
    var selectedIngredientsArray:[CategoriesModel] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        initializeData()
        self.navigationController?.isNavigationBarHidden = true
        print("Select Category View Loaded")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.setTabBarVisibility(true)
    }

    fileprivate func initializeData() {
        categoriesArray.append(CategoriesModel(title: "Steak", image: Constants.TimerTab.STEAK))
        categoriesArray.append(CategoriesModel(title: "Vegetables", image: Constants.TimerTab.VEGETABLES))
        categoriesArray.append(CategoriesModel(title: "Chicken & Pork", image: Constants.TimerTab.CHICKEN_AND_PORK))
        categoriesArray.append(CategoriesModel(title: "Seafood", image: Constants.TimerTab.SEAFOOD))
        categoriesArray.append(CategoriesModel(title: "Eggs", image: Constants.TimerTab.EGGS))
    }
    
    deinit {
        print("Select Category Page Safe From Memory Leaks")
    }
}

extension TimerTabViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TimerTabCategoryTableViewCell.reuseIdentity) as! TimerTabCategoryTableViewCell
        cell.setValues(ofModel: categoriesArray[indexPath.row])
        return cell
    }
}

extension TimerTabViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Did select Row called ", indexPath.row)
        setSelectedIngredients(selectedRow: indexPath.row)
        performSegue(withIdentifier: segueIdentifier, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectIngredientsViewController = segue.destination as? SelectIngredientsViewController else {return;}
        selectIngredientsViewController.ingredientsArray = self.selectedIngredientsArray
        self.selectedIngredientsArray.removeAll()
    }

    func setSelectedIngredients(selectedRow row:Int) {
        switch row {
        case 0:
            selectedIngredientsArray.append(CategoriesModel(title: "Flank Steak", image: Constants.TimerTab.FLANK_STEAK))
            selectedIngredientsArray.append(CategoriesModel(title: "N.Y Strip Steak", image: Constants.TimerTab.NY_FLANK_STEAK))
            selectedIngredientsArray.append(CategoriesModel(title: "Porterhouse", image: Constants.TimerTab.PORTERHOUSE))
            selectedIngredientsArray.append(CategoriesModel(title: "Ribeye Steak Boneless", image: Constants.TimerTab.RIBEYE_STEAK_BONELESS))
            selectedIngredientsArray.append(CategoriesModel(title: "Skirt Steak", image: Constants.TimerTab.SKIRT_STEAK))
        case 1:
            selectedIngredientsArray.append(CategoriesModel(title: "Acron Squash", image: Constants.TimerTab.ACRON_SQUASH))
            selectedIngredientsArray.append(CategoriesModel(title: "Beets", image: Constants.TimerTab.BEETS))
            selectedIngredientsArray.append(CategoriesModel(title: "Broccoli", image: Constants.TimerTab.BROCOLLI))
            selectedIngredientsArray.append(CategoriesModel(title: "Brussel Sprouts", image: Constants.TimerTab.BRUSSEL_SPROUTS))
            selectedIngredientsArray.append(CategoriesModel(title: "Butternut Squash", image: Constants.TimerTab.BUTTERNUT_SQUASH))
            selectedIngredientsArray.append(CategoriesModel(title: "Carrot Parsnips", image: Constants.TimerTab.CARROTS_OR_PARSNIPS))
            selectedIngredientsArray.append(CategoriesModel(title: "Cauliflower", image: Constants.TimerTab.CAULIFLOWER))
            selectedIngredientsArray.append(CategoriesModel(title: "Eggplant", image: Constants.TimerTab.EGGPLANT))
            selectedIngredientsArray.append(CategoriesModel(title: "Mushrooms", image: Constants.TimerTab.MUSHROOMS))
            selectedIngredientsArray.append(CategoriesModel(title: "Spaghetti Squash", image: Constants.TimerTab.SPAGETTI_SQUASH))
            selectedIngredientsArray.append(CategoriesModel(title: "Sweet Potatoes", image: Constants.TimerTab.SWEET_POTATOES))
            selectedIngredientsArray.append(CategoriesModel(title: "Tomatoes", image: Constants.TimerTab.TOMATOES))
            selectedIngredientsArray.append(CategoriesModel(title: "Zuchini or Summer Squash", image: Constants.TimerTab.ZUCHENNI_OR_SUMMER_SQUASH))
        case 2:
            selectedIngredientsArray.append(CategoriesModel(title: "Chicken Breast, Bone-In and Skin-On", image: Constants.TimerTab.CHICKEN_BREAST_BONE_IN_AND_SKIN_ON))
            selectedIngredientsArray.append(CategoriesModel(title: "Chicken Breast, Boneless and Skinless", image: Constants.TimerTab.CHICKEN_BREASTS_BONELESS_AND_SKINLESS))
            selectedIngredientsArray.append(CategoriesModel(title: "Chicken Cutlets", image: Constants.TimerTab.CHICKEN_CUTLETS))
            selectedIngredientsArray.append(CategoriesModel(title: "Chicken Drumsticks", image: Constants.TimerTab.CHICKEN_DRUMSTICKS))
            selectedIngredientsArray.append(CategoriesModel(title: "Chicken Thighs, Bone-In and Skin-On", image: Constants.TimerTab.CHICKEN_THIGHS_BONE_IN_AND_SKIN_ON))
            selectedIngredientsArray.append(CategoriesModel(title: "Chicken Thighs, Boneless and Skiless", image: Constants.TimerTab.CHICKEN_THIGHS_BONELESS_AND_SKINLESS))
            selectedIngredientsArray.append(CategoriesModel(title: "Whole Chicken", image: Constants.TimerTab.WHOLE_CHICKEN))
            selectedIngredientsArray.append(CategoriesModel(title: "Pork Chops, Bone In", image: Constants.TimerTab.PORK_CHOPS_BONE_IN))
            selectedIngredientsArray.append(CategoriesModel(title: "Pork Chops, Boneless", image: Constants.TimerTab.PORK_CHOPS_BONELESS))
            selectedIngredientsArray.append(CategoriesModel(title: "Pork Loin, Boneless and Tied", image: Constants.TimerTab.PORK_LOINS_BONELESS_AND_TIED))
            selectedIngredientsArray.append(CategoriesModel(title: "Pork Tenderloin", image: Constants.TimerTab.PORK_TENDERLOIN))

        case 3:
            selectedIngredientsArray.append(CategoriesModel(title: "Cod Filets", image: Constants.TimerTab.COD_FILLETS))
            selectedIngredientsArray.append(CategoriesModel(title: "Salmon Fillet", image: Constants.TimerTab.SALMON_FILLET))
            selectedIngredientsArray.append(CategoriesModel(title: "Salmon Steaks", image: Constants.TimerTab.SALMON_STEAKS))
            selectedIngredientsArray.append(CategoriesModel(title: "Shrimp", image: Constants.TimerTab.SHRIMP))
            selectedIngredientsArray.append(CategoriesModel(title: "Swordfish Steaks", image: Constants.TimerTab.SWORDFISH_STEAKS))
            selectedIngredientsArray.append(CategoriesModel(title: "Tilapia Filets", image: Constants.TimerTab.TILAPA_FILETS))

        case 4:
            selectedIngredientsArray.append(CategoriesModel(title: "Soft Boiled, Runny Yolks", image: Constants.TimerTab.SOFT_BOILED_RUNNY_YOLKS))
            selectedIngredientsArray.append(CategoriesModel(title: "Soft Boiled, Custardy Yolks", image: Constants.TimerTab.SOFT_BOILED_CUSTARD_YOLDS))
            selectedIngredientsArray.append(CategoriesModel(title: "Hard Boiled, Moist Yolks", image: Constants.TimerTab.HARD_BOILED_MOIST_YOLKS))
            selectedIngredientsArray.append(CategoriesModel(title: "Hard Boiled, Firm Yolks", image: Constants.TimerTab.HARD_BOILED_FIRM_YOLKS))

        default:
            print("internal Error")
        }
    }
}
