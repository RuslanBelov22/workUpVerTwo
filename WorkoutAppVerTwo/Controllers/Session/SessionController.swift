//
//  SessiinController.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 03/03/23.
//

import UIKit

class SessionViewController: WABaseController {

    private let timerView = TimerView()

    private let timerDuration = 3.0

    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }

        timerView.state = timerView.state == .isRunning ? .isStopped : .isRunning
        setNavBarButton(timerView.state == .isRunning
                        ? R.Strings.Session.navBarLeftPause
                        : R.Strings.Session.navBarLeftStart,
                        at: .left)

    }
    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .isStopped

        setNavBarButton(R.Strings.Session.navBarLeftStart, at: .left)
        
    }
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
        addNavBarButton(at: .left, with: R.Strings.Session.navBarLeftStart)
        addNavBarButton(at: .right, with: R.Strings.Session.navBarRightFinish)

        timerView.configure(with: timerDuration, progress: 1.5)
    }
}
