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



    private func configure() { //внешние настройки tabBar
        //MARK: Установка цвета активных/нет иконок и самого tabBar
        tabBar.tintColor = Resources.Colors.TabBarColors.active
        tabBar.barTintColor = Resources.Colors.TabBarColors.inactive
        tabBar.backgroundColor = .white

        //MARK: Полоска над tabBar
        tabBar.layer.borderColor = Resources.Colors.TabBarColors.separator.cgColor // Тут мы должны добавить cgColor так как UIColor является частью NSObject но не является частью CF/ Core Foundation Library короче другая библиотека по этому так пишем 
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true

        //MARK: VC для вкладок tabBar
        let overviewController = UIViewController()
        let sessionController = UIViewController()
        let progressController = UIViewController()
        let settingsController = UIViewController()

        //MARK: NC для вкладок tabBa
        let overviewNavigationController = UINavigationController(rootViewController: overviewController)
        let sessionNavigationController = UINavigationController(rootViewController:
            sessionController)
        let progressNavigationController = UINavigationController(rootViewController: progressController)
        let settingsNavigationController = UINavigationController(rootViewController: settingsController)

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

        setViewControllers([
            overviewNavigationController,
            sessionNavigationController,
            progressNavigationController,
            settingsNavigationController
        ],animated: false)

    }

}
