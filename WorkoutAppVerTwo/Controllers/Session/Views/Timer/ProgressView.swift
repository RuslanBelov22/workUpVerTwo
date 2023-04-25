//
//  ProgressView.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 12/04/23.
//

import UIKit


extension TimerView {
    final class ProgressView: UIView {
        //функция для отрисовки прогресса
        func drawProgress(with percent: CGFloat) {

            let circleFrame = UIScreen.main.bounds.width - (15 + 40) * 2 // определяем ширину круга где будет наш элемент прогресса
            let radius = circleFrame / 2
            let center = CGPoint(x: radius, y: radius)
            let startAngle = -CGFloat.pi * 7 / 6
            let endAngle = CGFloat.pi * 1 / 6


            let circlePath = UIBezierPath(arcCenter: center,
                                          radius: radius,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true)

            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath
            circleLayer.strokeColor = R.Colors.TabBarColors.active.cgColor
            circleLayer.lineWidth = 20
            circleLayer.strokeEnd = percent
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round

            layer.addSublayer(circleLayer)
        }
    }
}
