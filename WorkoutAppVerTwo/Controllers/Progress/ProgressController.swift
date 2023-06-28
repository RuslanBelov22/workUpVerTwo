//
//  ProgressController.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 03/03/23.
//

import UIKit

class ProgressViewController: WABaseController {

    private let dayliPerfomance = DailyPerfomanceView(with: R.Strings.Progress.dailyPerfomanse, buttonTitle: R.Strings.Progress.last7Days)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProgressViewController {
    override func setupViews() {
        super.setupViews()
        view.setupView(dayliPerfomance)
    }
    override func constrainViews() {
        super.constrainViews()

        NSLayoutConstraint.activate([
            dayliPerfomance.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            dayliPerfomance.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dayliPerfomance.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dayliPerfomance.heightAnchor.constraint(equalTo: dayliPerfomance.widthAnchor, multiplier: 0.68)
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()

        title = R.Strings.NavBar.progress
        //если не использовать данную контрукцию название в tabBar так же будет изменяться на то что выше
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: Tabs.progress)
        addNavBarButton(at: .left, with: R.Strings.Progress.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Progress.navBarRight)

        dayliPerfomance.configure(with:
                                    [.init(value: "1", heightMultiplier: 0.2, title:
                                            "Mon"),
                                     .init(value: "2", heightMultiplier: 0.4, title:
                                            "Tue"),
                                     .init(value: "3", heightMultiplier: 0.6, title:
                                            "Wed"),
                                     .init(value: "4", heightMultiplier: 0.8, title:
                                            "Thu"),
                                     .init(value: "5", heightMultiplier: 1, title:
                                            "Fri"),
                                     .init(value: "3", heightMultiplier: 0.6, title:
                                            "Sat"),
                                     .init(value: "2", heightMultiplier: 0.4, title:
                                            "Sun"), 
                                    ])
    }
}

