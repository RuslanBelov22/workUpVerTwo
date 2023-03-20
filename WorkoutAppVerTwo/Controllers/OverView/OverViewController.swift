//
//  ViewController.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 24/02/23.
//

import UIKit

class OverViewController: BaseController {

    private let navBAr = OverviewNavBar()

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

        navigationController?.setNavigationBarHidden(true, animated: false)// функция скрывает navBar 
        view.addView(navBAr)

    }
    override func layoutViews() {
        super.layoutViews()

        NSLayoutConstraint.activate([

            //растановка констрейнов для navBar
            navBAr.topAnchor.constraint(equalTo: view.topAnchor),
            navBAr.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBAr.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //установка высоты navbar при этом сейчас она нам не нужна так как высота будет задаваться содержащимся в ней контентом
//            navBAr.heightAnchor.constraint(equalToConstant: 113),
        ])

    }
    override func configure() {
        super.configure()

//        navBAr.translatesAutoresizingMaskIntoConstraints = false
    }
}

