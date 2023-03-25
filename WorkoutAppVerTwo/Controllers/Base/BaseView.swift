//
//  BaseView.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 15/03/23.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super .init(frame: frame)

        addViews()
        layoutViews()
        configureVews()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    @objc extension BaseView {
        func addViews() {}
        func layoutViews() {}
        func configureVews() {}
    }

