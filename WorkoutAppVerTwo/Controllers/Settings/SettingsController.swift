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
        
        title = R.Strings.NavBar.settings
        //описание в ProgressController
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: Tabs.settings)

    }


}


