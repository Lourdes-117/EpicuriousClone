//
//  CheckListReusableCellTableViewHeader.swift
//  EpicuriousClone
//
//  Created by Tringapps on 28/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class CheckListReusableCellTableViewHeader: UITableViewCell {

    @IBOutlet weak var numberOfItems: UIButton!
    @IBOutlet weak var headerTitle: UILabel!

    fileprivate weak var checkListViewController: CheckListViewController!
    static let reusableIdentity:String = "CheckListHeaderReusableIdentity"
    public func setContext(ofParent parent:CheckListViewController) {
        self.checkListViewController = parent
    }

    @IBAction func onClickClearButton(_ sender: Any) {
    }
}
