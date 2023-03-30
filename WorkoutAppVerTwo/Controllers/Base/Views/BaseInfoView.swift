//
//  BaseInfoView.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 28/03/23.
//

import UIKit

class BaseInfoView: BaseView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.BaseController.navBarButtonColorInactive
        return label
    }()
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = R.Colors.NavBarColors.separatorNav.cgColor //ставишь в конце .cgColor когда требует этот тип данных
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        return view
    }()

    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()

//нужно настроить что бы в зависимости от есть ли label.text или нет по разному размещался контент внутри view

    init(with title: String? = nil, buttonTitle: String? = nil){

        titleLabel.text = title?.uppercased()//делает надписи жирными
        titleLabel.textAlignment = buttonTitle == nil ? .center : .left

        button.setTitle(buttonTitle, for: .normal)
        button.isHidden = buttonTitle == nil ? true : false
 
        super.init(frame: .zero)

    }

    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }

    func addButtonTarget(target: Any?, action: Selector) {
        button.addTarget(action, action: action, for: .touchUpInside)
    }

}


extension BaseInfoView {
        override func setupViews() {
            super.setupViews()

            setupView(titleLabel)
            setupView(contentView)
            setupView(button)
        }
        override func constrainViews() {
            super.constrainViews()

            //нужно настроить что бы в зависимости от есть ли label.text или нет по разному размещался контент внутри view
            let contentTopAnchor: NSLayoutAnchor = titleLabel.text == nil ? topAnchor : titleLabel.bottomAnchor
            let contentTopOffset: CGFloat = titleLabel.text == nil ? 0 : 10


            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                titleLabel.topAnchor.constraint(equalTo: topAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

                button.trailingAnchor.constraint(equalTo: trailingAnchor),
                button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
                button.widthAnchor.constraint(equalToConstant: 130),
                button.heightAnchor.constraint(equalToConstant: 30),

                contentView.topAnchor.constraint(equalTo: contentTopAnchor, constant: contentTopOffset),
                contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
        override func configureAppearance() {
            //используем только для настройки родителя
            super.configureAppearance()
            backgroundColor = .clear
        }
}
