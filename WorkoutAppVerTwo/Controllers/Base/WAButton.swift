//
//  WAButton.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 11/03/23.
//

import UIKit

public enum WAButtonType {
    case primary
    case secondary
}


final class WAButton: UIButton {

    private var type: WAButtonType = .primary

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    private let iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.image = R.Image.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        //withRenderingMode(.alwaysTemplate) с помощью RenderingMode мы можем изменять цвета
        return iconView
    }()

    init(with type: WAButtonType) {
        super.init(frame: .zero)
        self.type = type

        addViews()
        layoutViews()
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        addViews()
        layoutViews()
        configure()
    }

    func setTitle(_ title: String?) {
        label.text = title
    }
}

private extension WAButton {
    func addViews() {
        setupView(label)
        setupView(iconView)
    }
    func layoutViews() {
        var offsetHorisontal: CGFloat {
            switch type {
            case .primary:
                return 0
            case .secondary:
                return 10
            }
        }
        //установка констрейнов
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offsetHorisontal),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),


            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offsetHorisontal * 2)
        ])
    }
    func configure() {
        switch type {

        case .primary:
            label.textColor = R.Colors.TabBarColors.inactive
            iconView.tintColor = R.Colors.TabBarColors.inactive
            label.font = R.Fonts.helveticaRegular(with: 13)
        case .secondary:
            backgroundColor = R.Colors.NavBarColors.secondary
            layer.cornerRadius = 14
            label.textColor = R.Colors.TabBarColors.active
            label.font = R.Fonts.helveticaRegular(with: 15)
            iconView.tintColor = R.Colors.TabBarColors.active
        }

        makeSystem(self) // добавляет нашу анимацию из расширения UIView + ext

    }
}
