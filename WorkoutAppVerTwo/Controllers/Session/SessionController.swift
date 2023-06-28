//
//  SessiinController.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 03/03/23.
//

import UIKit

class SessionViewController: WABaseController {

    private let timerView = TimerView()
    private let statsView = StatsView(with: R.Strings.Session.workoutStats)
    private let stepsView = StepsView(with: R.Strings.Session.stepsCounter)


    private let timerDuration = 3.0

    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer {progress in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) { //задержка перед выполнением
                        self.navBarRightButtonHandler()
                    }
//                print(progress)
            }
            }
            else {
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
        view.setupView(statsView)
        view.setupView(stepsView)
        
        
    }
    override func constrainViews() {
        super.constrainViews()

        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),

            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            stepsView.topAnchor.constraint(equalTo: statsView.topAnchor),
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor),
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

        timerView.callBack = { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) { //задержка перед выполнением
                self?.navBarRightButtonHandler()
            }
        }

        statsView.configure(with: [.heartRate(value: "155"),
                                   .averagePace(value: "08:20"),
                                   .totalSteps(value: "7.682"),
                                   .totalDistance(value: "8.25")
                                  ])

        stepsView.configure(with: [.init(value: "8k", heightMultiplier: 1, title:
                                            "2/14"),
                                   .init(value: "7k", heightMultiplier: 0.8, title:
                                            "2/15"),
                                   .init(value: "5k", heightMultiplier: 0.6, title:
                                            "2/16"),
                                   .init(value: "6k", heightMultiplier: 0.7, title:
                                            "2/17"),
                                    ])
    }
}
