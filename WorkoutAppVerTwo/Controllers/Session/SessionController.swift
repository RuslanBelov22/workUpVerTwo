//
//  SessiinController.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 03/03/23.
//

import UIKit

class SessionViewController: BaseController {

    private let timerView: BaseInfoView = {
        let view = BaseInfoView(with: "Test",buttonTitle: "Test2e")

        return view
    }()
}

extension SessionViewController {
    override func setupViews() {
        super.setupViews()
        view.setupView(timerView)
    }
    override func constrainViews() {
        super.constrainViews()

        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])

    }
    override func configureAppearance() {
        super.configureAppearance()
        
        title = R.Strings.NavBar.session
        //описание в ProgressController
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: Tabs.session)

        //Добавляем кнопки на navBar
        addNavBarButton(at: .left, with: R.Strings.Session.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Session.navBarRight)
    }
}
