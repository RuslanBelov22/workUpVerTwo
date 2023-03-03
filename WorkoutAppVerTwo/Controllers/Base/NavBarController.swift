//
//  NavBarController.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 02/03/23.
//

import UIKit


final class NavBarController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false // не заканчивался по границе статус бара
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resources.Colors.NavBarColors.titleGray,
            .font: Resources.Fonts.helveticaRegular(with: 17)
        ]

        navigationBar.addBottomBorder(with: Resources.Colors.NavBarColors.separatorNav,
                                      height: 1)
    }
}
