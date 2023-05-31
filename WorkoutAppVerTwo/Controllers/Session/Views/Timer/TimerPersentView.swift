//
//  TimerPersentView.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 30/05/23.
//

import UIKit

extension TimerView {
    final class TimerPersentView: WABaseView {

        private let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = 5
            return view
        }()

        private let percentLabel: UILabel = {
            let label = UILabel()
            label.font = R.Fonts.helveticaRegular(with: 23)
            label.textColor = R.Colors.NavBarColors.titleGray
            label.textAlignment = .center
            return label
        }()

        private let subTitleLabel: UILabel = {
            let label = UILabel()
            label.font = R.Fonts.helveticaRegular(with: 10)
            label.textColor = R.Colors.subTitleGray
            label.textAlignment = .center
            return label
        }()

        override func setupViews() {
            super.setupViews()

            setupView(stackView)
            stackView.addArrangedSubview(percentLabel)
            stackView.addArrangedSubview(subTitleLabel)
            
        }
        override func constrainViews() {
            super.constrainViews()
            
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
        }
        
        func configure(title: String, andWith value: Int) {
            subTitleLabel.text = title
            percentLabel.text = "\(value)%"
        }
    }
}




