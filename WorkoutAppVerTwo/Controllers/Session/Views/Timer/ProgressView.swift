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

            //добавляем серый дефолтный слой
            let defaultCircleLayer = CAShapeLayer()
            defaultCircleLayer.path = circlePath.cgPath
            defaultCircleLayer.strokeColor = R.Colors.TabBarColors.separator.cgColor
            defaultCircleLayer.lineWidth = 20
            defaultCircleLayer.strokeEnd = 1
            defaultCircleLayer.fillColor = UIColor.clear.cgColor
            defaultCircleLayer.lineCap = .round

            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath
            circleLayer.strokeColor = R.Colors.TabBarColors.active.cgColor
            circleLayer.lineWidth = 20
            circleLayer.strokeEnd = percent
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round

            //добавляем точку на progressView
            let dotAngle = CGFloat.pi * (7 / 6 - (8 / 6 * percent))
            let dotPoint = CGPoint(x: cos(-dotAngle) * radius + center.x,
                                   y: sin(-dotAngle) * radius + center.y)

            let dotPath = UIBezierPath()
            dotPath.move(to: dotPoint)
            dotPath.addLine(to: dotPoint)


            //при нуле дорисовывается жирная точка с синей оконтовкой 
            let bigDotlayer = CAShapeLayer()
            bigDotlayer.path = dotPath.cgPath
            bigDotlayer.fillColor = UIColor.clear.cgColor
            bigDotlayer.strokeColor = R.Colors.TabBarColors.active.cgColor
            bigDotlayer.lineCap = .round
            bigDotlayer.lineWidth = 20

            //создаем слой для отрисовки точки
            let dotlayer = CAShapeLayer()
            dotlayer.path = dotPath.cgPath
            dotlayer.fillColor = UIColor.clear.cgColor
            dotlayer.strokeColor = UIColor.white.cgColor
            dotlayer.lineCap = .round
            dotlayer.lineWidth = 8


            layer.addSublayer(defaultCircleLayer)
            layer.addSublayer(circleLayer)
            layer.addSublayer(bigDotlayer)
            layer.addSublayer(dotlayer)
        }
    }
}
