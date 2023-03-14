//
//  ViewController.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 24/02/23.
//

import UIKit

class OverViewController: BaseController {

    private let allWorkoutsButtom = SecondaryButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        layoutViews()
        configure()
//        title = "OverView"
//        //описание в ProgressController
//        navigationController?.tabBarItem.title = Resources.Strings.TabBarStrings.overview
    }


}

extension OverViewController {
    override func addViews() {
        super.addViews()

        view.addSubview(allWorkoutsButtom)

    }
    override func layoutViews() {
        super.layoutViews()

        NSLayoutConstraint.activate([
            allWorkoutsButtom.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            allWorkoutsButtom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            allWorkoutsButtom.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutsButtom.widthAnchor.constraint(equalToConstant: 130)
        ])

    }
    override func configure() {
        super.configure()
        allWorkoutsButtom.translatesAutoresizingMaskIntoConstraints = false
        allWorkoutsButtom.setTitle(Resources.Strings.OverView.allWorkoutsButton)
        allWorkoutsButtom.addTarget(self,
                                    action: #selector(allWorkoutsButtonAction),
                                    for: .touchUpInside)
    }
}

@objc extension OverViewController {
    func allWorkoutsButtonAction() {
        print("All Workouts Button tapped")
    }
}
