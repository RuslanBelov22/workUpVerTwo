//
//  TabBarController.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 24/02/23.
//

import UIKit

enum Tabs: Int { //мы разаранее создаем enum с колличеством вкладок на tabBar
    case overriew
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Почему бы не использовать обычный viewDidLoad?     
//    override func viewDidLoad() {
//        configure()
//    }


    private func configure() { //внешние настройки tabBar
        //MARK: Установка цвета активных/нет иконок и самого tabBar
        tabBar.tintColor = Resources.Colors.TabBarColors.active
        tabBar.barTintColor = Resources.Colors.TabBarColors.inactive
        tabBar.backgroundColor = .white

        //MARK: Полоска над tabBar при этом он отчерчивает все границы
        tabBar.layer.borderColor = Resources.Colors.TabBarColors.separator.cgColor // Тут мы должны добавить cgColor так как UIColor является частью NSObject но не является частью CF/ Core Foundation Library короче другая библиотека по этому так пишем 
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true

        //MARK: - VC для вкладок tabBar
        let overviewController = OverViewController()
        let sessionController = SessionViewController()
        let progressController = ProgressViewController()
        let settingsController = SettingsViewController()

        //MARK: - NC для вкладок tabBa
        let overviewNavigationController = NavBarController(rootViewController: overviewController)
        let sessionNavigationController = NavBarController(rootViewController: sessionController)
        let progressNavigationController = NavBarController(rootViewController: progressController)
        let settingsNavigationController = NavBarController(rootViewController: settingsController)

        overviewNavigationController.tabBarItem = UITabBarItem(
            title:Resources.Strings.TabBarStrings.overview,
            image: Resources.Image.TabBarImage.overview,
            tag: Tabs.overriew.rawValue)
        sessionNavigationController.tabBarItem = UITabBarItem(
            title:Resources.Strings.TabBarStrings.session,
            image: Resources.Image.TabBarImage.session,
            tag: Tabs.session.rawValue)
        progressNavigationController.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBarStrings.progress,
            image: Resources.Image.TabBarImage.progress,
            tag: Tabs.progress.rawValue)
        settingsNavigationController.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBarStrings.settings,
            image: Resources.Image.TabBarImage.settings,
            tag: Tabs.settings.rawValue)

        //MARK: - Количество вьюконтроллеров, которые отображаются в самом начале при загрузке
        setViewControllers([
            overviewNavigationController,
            sessionNavigationController,
            progressNavigationController,
            settingsNavigationController
        ],animated: false)

    }

}
