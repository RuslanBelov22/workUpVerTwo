//
//  ViewController.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 24/02/23.
//

import UIKit

class OverViewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "OverView"
        //описание в ProgressController
        navigationController?.tabBarItem.title = Resources.Strings.TabBarStrings.overview
    }


}

