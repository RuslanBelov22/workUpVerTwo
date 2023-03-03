//
//  SettiongsController.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 03/03/23.
//

import UIKit

class SettingsViewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"
        //описание в ProgressController
        navigationController?.tabBarItem.title = Resources.Strings.TabBarStrings.settings

    }


}
