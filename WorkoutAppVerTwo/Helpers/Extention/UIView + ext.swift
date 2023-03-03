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
}
