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
class WABaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        constrainViews()
        configureAppearance()
    }
}

@objc extension WABaseController { //@objc позволяет переопределять в дочерних классах
    func setupViews() {}
    func constrainViews() {}
    func configureAppearance() {
        view.backgroundColor = R.Colors.BaseController.baseBackgroundColor
    }
    func navBarLeftButtonHandler() {
        print("NavBarLeft buttom tapped")
    }
    func navBarRightButtonHandler() {
        print("NavBarRight buttom tapped")
    }
}



extension WABaseController {
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(R.Colors.BaseController.navBarButtonColorActiv,
                             for: .normal)
        button.setTitleColor(R.Colors.BaseController.navBarButtonColorInactive,
                             for: .normal)
        button.titleLabel?.font = R.Fonts.helveticaRegular(with: 17)

        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }

    }

    func setNavBarButton(_ title: String, at position: NavBarPosition) {
        switch position {
        case .left:
            (navigationItem.leftBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        case .right:
            (navigationItem.rightBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        }
    }
}
