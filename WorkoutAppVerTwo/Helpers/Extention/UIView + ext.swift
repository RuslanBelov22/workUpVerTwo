//
//  UIView + ext.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 03/03/23.
//

import UIKit

extension UIView { //добавление сепаратора во вью 
    func addBottomBorder(with color: UIColor, height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        separator.frame = CGRect(x: 0,
                                 y: frame.height - height,
                                 width: frame.width,
                                 height: height)

        addSubview(separator)
    }

    //добавление маргания на кастомную кнопку
    func makeSystem(_ button: UIButton) {
        button.addTarget(self, action: #selector(handleIn), for: [
            .touchDown,
            .touchDragInside
        ])

        button.addTarget(self, action: #selector(handleOut), for: [
            .touchDragOutside,
            .touchUpInside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }

    @objc func handleIn() {
        UIView.animate(withDuration: 0.15) {self.alpha = 0.55}
    }
    @objc func handleOut() {
        UIView.animate(withDuration: 0.15) {self.alpha = 1}
    }
    //функция для автоматической расстановки view
    func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

