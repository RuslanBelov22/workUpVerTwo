//
//  WABarView.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 14/06/23.
//

import UIKit

final class WABarsView: WABaseView {

    private var stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        return view
    }()

    func configure(with data: [WABarView.Data]) {
        data.forEach {
            let barView = WABarView(data: $0)
            stackView.addArrangedSubview(barView)
        }
    }
}

extension WABarsView {
    override func setupViews() {
        super.setupViews()
        setupView(stackView)

    }
    override func constrainViews() {
        super.constrainViews()

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear

    }
}
