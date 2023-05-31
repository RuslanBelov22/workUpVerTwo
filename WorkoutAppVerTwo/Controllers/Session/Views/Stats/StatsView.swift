//
//  StatsView.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 31/05/23.
//

import UIKit

final class StatsView: WABaseInfoView {

    private let itemView = StatsItemView()

    override func setupViews() {
        super.setupViews()

        setupView(itemView)
        itemView.configure(with: StatsItemView.StatsItem.init(image: R.Image.Session.Stats.heartRate,
                                                              value: "155 bpm",
                                                              title: R.Strings.Session.heartRate.uppercased()))

        NSLayoutConstraint.activate([
            itemView.topAnchor.constraint(equalTo: topAnchor,constant: 45),
            itemView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
        ])
    }

}
