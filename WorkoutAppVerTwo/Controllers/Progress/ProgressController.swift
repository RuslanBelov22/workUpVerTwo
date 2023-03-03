//
//  ProgressController.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 03/03/23.
//

import UIKit

class ProgressViewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Workout Progress"
        //если не использовать данную контрукцию название в tabBar так же будет изменяться на то что выше
        navigationController?.tabBarItem.title = Resources.Strings.TabBarStrings.progress

        addNavBarButton(at: .left, with: "Export")
        addNavBarButton(at: .right, with: "Details")
    }


}
