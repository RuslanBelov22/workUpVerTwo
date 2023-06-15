//
//  StepsView.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 14/06/23.
//

import UIKit

final class StepsView: WABaseInfoView {

    private let barsView = WABarsView()

    func configure(with items: [WABarView.Data]) {
        barsView.configure(with: items)
    }
}

extension StepsView {
    override func setupViews() {
        super.setupViews()

        setupView(barsView)

    }
    override func constrainViews() {
        super.constrainViews()

        NSLayoutConstraint.activate([
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                           constant: 10),
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                           constant: 10),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                           constant: -10),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                           constant: -10),

        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white
    }
}





