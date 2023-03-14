//
//  SecondaryButton.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 11/03/23.
//

import UIKit


final class SecondaryButton: UIButton {

    private let label = UILabel()
    private let iconView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
        layoutViews()
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setTitle(_ title: String) {
        label.text = title
    }

}

private extension SecondaryButton {
    func addViews() {
        addSubview(label)
        addSubview(iconView)
    }
    func layoutViews() {
        //установка констрейнов
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),


            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    func configure() {
        backgroundColor = Resources.Colors.NavBarColors.secondary
        layer.cornerRadius = 14
        makeSystem(self) // добавляет нашу анимацию из расширения UIView + ext
        
        label.translatesAutoresizingMaskIntoConstraints = false //обязательный элемент для настраиваемых констрейнов
        label.textColor = Resources.Colors.TabBarColors.active
        label.textAlignment = .center
        label.font = Resources.Fonts.helveticaRegular(with: 15)

        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = Resources.Image.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        //withRenderingMode(.alwaysTemplate) с помощью RenderingMode мы можем изменять цвета ц
        iconView.tintColor = Resources.Colors.TabBarColors.active
    }
}
