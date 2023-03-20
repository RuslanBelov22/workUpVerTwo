//
//  OverviewNavBar.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 14/03/23.
//

import UIKit

final class OverviewNavBar: BaseView {

    private let titleLabel = UILabel()
    private let allWorkoutsButton = SecondaryButton()
    private let addButton = UIButton()


    private var weekView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue.withAlphaComponent(0.2)

        return view
    }()

    //это нужна для того что бы view загрузил frame и мы могли установить border
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(with: Resources.Colors.NavBarColors.secondary, height: 1)
    }

    func addAllWorkoutsAction(_ action: Selector, with target: Any?) {
        allWorkoutsButton.addTarget(target, action: action, for: .touchUpInside)
    }

    func addAditingAction(_ action: Selector, with target: Any?) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }

}

extension OverviewNavBar {
    override func addViews() {
        super.addViews()

        addView(titleLabel)
        addView(allWorkoutsButton)
        addView(addButton)
        addView(weekView)
    }

    override func layoutViews() {
        super.layoutViews()

        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),

            allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutsButton.widthAnchor.constraint(equalToConstant: 130),

            titleLabel.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkoutsButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),

            weekView.topAnchor.constraint(equalTo: allWorkoutsButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
        ])

    }

    override func configure() {
        super.configure()
        backgroundColor = .white

        //теперь везде можно убрать translatesAutoresizingMaskIntoConstraints так как эта функция есть а расширении UIview
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = Resources.Strings.TabBarStrings.overview
        titleLabel.textColor = Resources.Colors.NavBarColors.titleGray
        titleLabel.font = Resources.Fonts.helveticaRegular(with: 22)

//        allWorkoutsButton.translatesAutoresizingMaskIntoConstraints = false
        allWorkoutsButton.setTitle(Resources.Strings.OverView.allWorkoutsButton)
        //больше не нужно
//        allWorkoutsButton.addTarget(self,
//                                    action: #selector(allWorkoutsButtonAction),
//                                    for: .touchUpInside)


//        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setImage(Resources.Image.Common.add, for: .normal)
        
//        не забывает!!! translatesAutoresizingMaskIntoConstraints
//        weekView.translatesAutoresizingMaskIntoConstraints = false
    }
}

//нам она больше не нужна так как функцию будет вызываться из родительского контроллера 
//@objc extension OverviewNavBar { //фнкция чисто для проверки
//    func allWorkoutsButtonAction() {
//        print("All Workouts Button tapped")
//    func addButtonAction() {
//            print("Add Button tapped")
//        }
//    }
//}



//allWorkoutsButtom.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//allWorkoutsButtom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//allWorkoutsButtom.heightAnchor.constraint(equalToConstant: 28),
//allWorkoutsButtom.widthAnchor.constraint(equalToConstant: 130)
