//
//  WABaseView.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 15/03/23.
//

import UIKit

class WABaseView: UIView {
    override init(frame: CGRect) {
        super .init(frame: frame)

        setupViews()
        constrainViews()
        configureAppearance()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    @objc extension WABaseView {
        func setupViews() {}
        func constrainViews() {}
        func configureAppearance() {
            backgroundColor = .white
        }
    }

