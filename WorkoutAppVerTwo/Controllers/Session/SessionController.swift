//
//  SessiinController.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 03/03/23.
//

import UIKit

class SessionViewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "High Intensity Cardio"
        //описание в ProgressController
        navigationController?.tabBarItem.title = Resources.Strings.TabBarStrings.session

        //Добавляем кнопки на navBar
        addNavBarButton(at: .left, with: Resources.Strings.Session.navBarLeft)
        addNavBarButton(at: .right, with: Resources.Strings.Session.navBarRight)
    }

    override func navBarLeftButtonHandler() { //как раз @objc позволяет нам переопределять функцию в других классах
        print("Session NavBar left button tapped") //Смысловой нагрузки эта функция не несет просто для демонстрации 
    }

}
