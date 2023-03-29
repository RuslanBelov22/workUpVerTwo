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

//нужно настроить что бы в зависимости от есть ли label.text или нет по разному размещался контент внутри view

    init(with title: String? = nil, aligment: NSTextAlignment = .left){

        titleLabel.text = title?.uppercased()//делает надписи жирными
        titleLabel.textAlignment = aligment
        super.init(frame: .zero)

    }

    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }

}


extension BaseInfoView {
        override func setupViews() {
            super.setupViews()

            setupView(titleLabel)
            setupView(contentView)
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
