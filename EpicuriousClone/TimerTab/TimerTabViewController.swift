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
        print("Select Category View Loaded")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.setTabBarVisibility(true)
    }

    fileprivate func initializeData() {
        categoriesArray.append(CategoriesModel(title: "Steak", image: Constants.Images.STEAK))
        categoriesArray.append(CategoriesModel(title: "Vegetables", image: Constants.Images.VEGETABLES))
        categoriesArray.append(CategoriesModel(title: "Chicken & Pork", image: Constants.Images.CHICKEN_AND_PORK))
        categoriesArray.append(CategoriesModel(title: "Seafood", image: Constants.Images.SEAFOOD))
        categoriesArray.append(CategoriesModel(title: "Eggs", image: Constants.Images.EGGS))
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
            selectedIngredientsArray.append(CategoriesModel(title: "Flank Steak", image: Constants.Images.FLANK_STEAK))
            selectedIngredientsArray.append(CategoriesModel(title: "N.Y Strip Steak", image: Constants.Images.NY_FLANK_STEAK))
            selectedIngredientsArray.append(CategoriesModel(title: "Porterhouse", image: Constants.Images.PORTERHOUSE))
            selectedIngredientsArray.append(CategoriesModel(title: "Ribeye Steak Boneless", image: Constants.Images.RIBEYE_STEAK_BONELESS))
            selectedIngredientsArray.append(CategoriesModel(title: "Skirt Steak", image: Constants.Images.SKIRT_STEAK))
        case 1:
            selectedIngredientsArray.append(CategoriesModel(title: "Acron Squash", image: Constants.Images.ACRON_SQUASH))
            selectedIngredientsArray.append(CategoriesModel(title: "Beets", image: Constants.Images.BEETS))
            selectedIngredientsArray.append(CategoriesModel(title: "Broccoli", image: Constants.Images.BROCOLLI))
            selectedIngredientsArray.append(CategoriesModel(title: "Brussel Sprouts", image: Constants.Images.BRUSSEL_SPROUTS))
            selectedIngredientsArray.append(CategoriesModel(title: "Butternut Squash", image: Constants.Images.BUTTERNUT_SQUASH))
            selectedIngredientsArray.append(CategoriesModel(title: "Carrot Parsnips", image: Constants.Images.CARROTS_OR_PARSNIPS))
            selectedIngredientsArray.append(CategoriesModel(title: "Cauliflower", image: Constants.Images.CAULIFLOWER))
            selectedIngredientsArray.append(CategoriesModel(title: "Eggplant", image: Constants.Images.EGGPLANT))
            selectedIngredientsArray.append(CategoriesModel(title: "Mushrooms", image: Constants.Images.MUSHROOMS))
            selectedIngredientsArray.append(CategoriesModel(title: "Spaghetti Squash", image: Constants.Images.SPAGETTI_SQUASH))
            selectedIngredientsArray.append(CategoriesModel(title: "Sweet Potatoes", image: Constants.Images.SWEET_POTATOES))
            selectedIngredientsArray.append(CategoriesModel(title: "Tomatoes", image: Constants.Images.TOMATOES))
            selectedIngredientsArray.append(CategoriesModel(title: "Zuchini or Summer Squash", image: Constants.Images.ZUCHENNI_OR_SUMMER_SQUASH))
        case 2:
            selectedIngredientsArray.append(CategoriesModel(title: "Chicken Breast, Bone-In and Skin-On", image: Constants.Images.CHICKEN_BREAST_BONE_IN_AND_SKIN_ON))
            selectedIngredientsArray.append(CategoriesModel(title: "Chicken Breast, Boneless and Skinless", image: Constants.Images.CHICKEN_BREASTS_BONELESS_AND_SKINLESS))
            selectedIngredientsArray.append(CategoriesModel(title: "Chicken Cutlets", image: Constants.Images.CHICKEN_CUTLETS))
            selectedIngredientsArray.append(CategoriesModel(title: "Chicken Drumsticks", image: Constants.Images.CHICKEN_DRUMSTICKS))
            selectedIngredientsArray.append(CategoriesModel(title: "Chicken Thighs, Bone-In and Skin-On", image: Constants.Images.CHICKEN_THIGHS_BONE_IN_AND_SKIN_ON))
            selectedIngredientsArray.append(CategoriesModel(title: "Chicken Thighs, Boneless and Skiless", image: Constants.Images.CHICKEN_THIGHS_BONELESS_AND_SKINLESS))
            selectedIngredientsArray.append(CategoriesModel(title: "Whole Chicken", image: Constants.Images.WHOLE_CHICKEN))
            selectedIngredientsArray.append(CategoriesModel(title: "Pork Chops, Bone In", image: Constants.Images.PORK_CHOPS_BONE_IN))
            selectedIngredientsArray.append(CategoriesModel(title: "Pork Chops, Boneless", image: Constants.Images.PORK_CHOPS_BONELESS))
            selectedIngredientsArray.append(CategoriesModel(title: "Pork Loin, Boneless and Tied", image: Constants.Images.PORK_LOINS_BONELESS_AND_TIED))
            selectedIngredientsArray.append(CategoriesModel(title: "Pork Tenderloin", image: Constants.Images.PORK_TENDERLOIN))

        case 3:
            selectedIngredientsArray.append(CategoriesModel(title: "Cod Filets", image: Constants.Images.COD_FILLETS))
            selectedIngredientsArray.append(CategoriesModel(title: "Salmon Fillet", image: Constants.Images.SALMON_FILLET))
            selectedIngredientsArray.append(CategoriesModel(title: "Salmon Steaks", image: Constants.Images.SALMON_STEAKS))
            selectedIngredientsArray.append(CategoriesModel(title: "Shrimp", image: Constants.Images.SHRIMP))
            selectedIngredientsArray.append(CategoriesModel(title: "Swordfish Steaks", image: Constants.Images.SWORDFISH_STEAKS))
            selectedIngredientsArray.append(CategoriesModel(title: "Tilapia Filets", image: Constants.Images.TILAPA_FILETS))

        case 4:
            selectedIngredientsArray.append(CategoriesModel(title: "Soft Boiled, Runny Yolks", image: Constants.Images.SOFT_BOILED_RUNNY_YOLKS))
            selectedIngredientsArray.append(CategoriesModel(title: "Soft Boiled, Custardy Yolks", image: Constants.Images.SOFT_BOILED_CUSTARD_YOLDS))
            selectedIngredientsArray.append(CategoriesModel(title: "Hard Boiled, Moist Yolks", image: Constants.Images.HARD_BOILED_MOIST_YOLKS))
            selectedIngredientsArray.append(CategoriesModel(title: "Hard Boiled, Firm Yolks", image: Constants.Images.HARD_BOILED_FIRM_YOLKS))

        default:
            print("internal Error")
        }
    }
}
