//
//  BaseController.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 02/03/23.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

//MARK: Создаем базовый контроллер для всех вью
class BaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        layoutViews()
        configure()
    }
}

@objc extension BaseController { //@objc позволяет переопределять в дочерних классах
    func addViews() {}
    func layoutViews() {}
    func configure() {
        view.backgroundColor = Resources.Colors.BaseController.baseBackgroundColor
    }
    func navBarLeftButtonHandler() {
        print("NavBarLeft buttom tapped")
    }
    func navBarRightButtonHandler() {
        print("NavBarRight buttom tapped")
    }
}



extension BaseController {
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Resources.Colors.BaseController.navBarButtonColorActiv,
                             for: .normal)
        button.setTitleColor(Resources.Colors.BaseController.navBarButtonColorInactive,
                             for: .normal)
        button.titleLabel?.font = Resources.Fonts.helveticaRegular(with: 17)

        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }

    }
}
