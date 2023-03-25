//
//  weekView.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 22/03/23.
//

import UIKit

final class WeekView: BaseView{

    private let calendar = Calendar.current

    private var stackView = UIStackView()

}

extension WeekView {
    override func addViews() {
        super.addViews()

        addView(stackView)


    }
    override func layoutViews() {
        super.layoutViews()

        NSLayoutConstraint.activate([

            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),

        ])

    }
    override func configureVews() {
        super.configureVews()

        stackView.spacing = 7
        // distribution нужен для определение пропорциональности элементов
        stackView.distribution = .fillEqually

        // Возвращает короткие имена дней недели shortStandaloneWeekdaySymbols

        var weekdays = calendar.shortStandaloneWeekdaySymbols

        //конструкция что бы день недели начинался с понедельника 
        if calendar.firstWeekday == 2 {
           let sunday = weekdays.remove(at: 0)
            weekdays.append(sunday)
        }
        

        weekdays.enumerated().forEach { index ,name in
            let view = WeekdayView()
            view.configure(with: index, and: name)
            stackView.addArrangedSubview(view)
        }

    }
}
