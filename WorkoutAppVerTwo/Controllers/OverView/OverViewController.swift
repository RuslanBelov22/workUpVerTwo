//
//  ViewController.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 24/02/23.
//

import UIKit

class OverViewController: WABaseController {

    private let navBAr = OverviewNavBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        constrainViews()
        configureAppearance()

    }


}

extension OverViewController {
    override func setupViews() {
        super.setupViews()

        navigationController?.setNavigationBarHidden(true, animated: false)// функция скрывает navBar 
        view.setupView(navBAr)

    }
    override func constrainViews() {
        super.constrainViews()

        NSLayoutConstraint.activate([

            //растановка констрейнов для navBar
            navBAr.topAnchor.constraint(equalTo: view.topAnchor),
            navBAr.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBAr.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //установка высоты navbar при этом сейчас она нам не нужна так как высота будет задаваться содержащимся в ней контентом
//            navBAr.heightAnchor.constraint(equalToConstant: 113),
        ])

    }
    override func configureAppearance() {
        super.configureAppearance()

//        navBAr.translatesAutoresizingMaskIntoConstraints = false
    }
}

