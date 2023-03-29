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


        title = R.Strings.NavBar.progress
        //если не использовать данную контрукцию название в tabBar так же будет изменяться на то что выше
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: Tabs.progress)

        addNavBarButton(at: .left, with: R.Strings.Progress.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Progress.navBarRight)
    }


}
