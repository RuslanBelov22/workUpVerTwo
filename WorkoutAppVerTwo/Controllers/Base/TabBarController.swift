//
//  TabBarController.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 24/02/23.
//

import UIKit

enum Tabs: Int, CaseIterable{ //мы разаранее создаем enum с колличеством вкладок на tabBar
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        configure()
        swithTo(tab: .session) //функция запускает тот экран который нужен в данный момент
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Почему бы не использовать обычный viewDidLoad?     
//    override func viewDidLoad() {
//        configure()
//    }

    func swithTo(tab: Tabs) { //функция запускает тот экран который нужен в данный момент
        selectedIndex = tab.rawValue
    }

    private func configure() { //внешние настройки tabBar
        //MARK: Установка цвета активных/нет иконок и самого tabBar
        tabBar.tintColor = R.Colors.TabBarColors.active
        tabBar.barTintColor = R.Colors.TabBarColors.inactive
        tabBar.backgroundColor = .white

        //MARK: Полоска над tabBar при этом он отчерчивает все границы
        tabBar.layer.borderColor = R.Colors.TabBarColors.separator.cgColor // Тут мы должны добавить cgColor так как UIColor является частью NSObject но не является частью CF/ Core Foundation Library короче другая библиотека по этому так пишем 
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true

        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: R.Strings.TabBar.title(for: tab),
                                                 image: R.Image.TabBarImage.icon(for: tab),
                                                 tag: tab.rawValue)
            return controller
        }

//        //MARK: - VC для вкладок tabBar
//        let overviewController = OverViewController()
//        let sessionController = SessionViewController()
//        let progressController = ProgressViewController()
//        let settingsController = SettingsViewController()
//
//        //MARK: - NC для вкладок tabBa
//        let overviewNavigationController = NavBarController(rootViewController: overviewController)
//        let sessionNavigationController = NavBarController(rootViewController: sessionController)
//        let progressNavigationController = NavBarController(rootViewController: progressController)
//        let settingsNavigationController = NavBarController(rootViewController: settingsController)
//
//        overviewNavigationController.tabBarItem = UITabBarItem(
//            title:Resources.Strings.TabBarStrings.overview,
//            image: Resources.Image.TabBarImage.overview,
//            tag: Tabs.overriew.rawValue)
//        sessionNavigationController.tabBarItem = UITabBarItem(
//            title:Resources.Strings.TabBarStrings.session,
//            image: Resources.Image.TabBarImage.session,
//            tag: Tabs.session.rawValue)
//        progressNavigationController.tabBarItem = UITabBarItem(
//            title: Resources.Strings.TabBarStrings.progress,
//            image: Resources.Image.TabBarImage.progress,
//            tag: Tabs.progress.rawValue)
//        settingsNavigationController.tabBarItem = UITabBarItem(
//            title: Resources.Strings.TabBarStrings.settings,
//            image: Resources.Image.TabBarImage.settings,
//            tag: Tabs.settings.rawValue)


        setViewControllers(controllers, animated: false)
//        //MARK: - Количество вьюконтроллеров, которые отображаются в самом начале при загрузке
//        setViewControllers([
//            overviewNavigationController,
//            sessionNavigationController,
//            progressNavigationController,
//            settingsNavigationController
//        ],animated: false)

    }

    private func getController(for tab: Tabs) -> BaseController {
        switch tab {
        case .overview: return OverViewController()
        case .session: return SessionViewController()
        case .progress: return ProgressViewController()
        case .settings: return SettingsViewController()
        }
    }

}
