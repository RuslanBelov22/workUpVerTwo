//
//  WABarsView.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 14/06/23.
//

import UIKit

extension WABarView {
    struct Data {
        let  value: String
        let heightMultiplier: Double
        let title: String

    }
}

final class WABarView: WABaseView {

    private let heightMultiplier: Double

    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.TabBarColors.active
        return label
    }()

    private let barView: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.TabBarColors.active
        view.layer.cornerRadius = 2.5
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 9)
        label.textColor = R.Colors.TabBarColors.inactive
        return label
    }()

    init(data: Data) {
        self.heightMultiplier = data.heightMultiplier
        super.init(frame: .zero)

        valueLabel.text = data.value
        titleLabel.text = data.title


    }

    required init?(coder: NSCoder) {
        self.heightMultiplier = 0
        super.init(frame: .zero)
    }

}

extension WABarView {
    override func setupViews() {
        super.setupViews()
        setupView(valueLabel)
        setupView(barView)
        setupView(titleLabel)

    }
    override func constrainViews() {
        super.constrainViews()

        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            barView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor,constant: 5),
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplier, constant: -40),

            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    
    }
    override func configureAppearance() {
        super.configureAppearance()

        backgroundColor = .clear

    }
}
