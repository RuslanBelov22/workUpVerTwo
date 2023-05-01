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

            //устраняет зависания при отрисовки слоев каждый раз при отрисоке рисуется новые слой данный метот удаляет предыдущий слой после отрисовки
            layer.sublayers?.removeAll()

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
            //7 / 6 - это начальная точка 8 / 6 а это максимальная точка
            let dotAngle = CGFloat.pi * (7 / 6 - (8 / 6 * percent))
            let dotPoint = CGPoint(x: cos(-dotAngle) * radius + center.x,
                                   y: sin(-dotAngle) * radius + center.y)

            let dotPath = UIBezierPath()
            //сделать точку
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

            let barsFrame = UIScreen.main.bounds.width - (15 + 40 + 25) * 2
            let barsRadius = barsFrame / 2

            let barsPath = UIBezierPath(arcCenter: center,
                                        radius: barsRadius,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true)

            let barsLayer = CAShapeLayer()
            barsLayer.path = barsPath.cgPath
            barsLayer.fillColor = UIColor.clear.cgColor
            barsLayer.strokeColor = UIColor.clear.cgColor
            //изменяя параметры мы можем поменять положение
            barsLayer.lineWidth = 6

            //производим вычисление черточек и где они будут отрисовываться

            let startBarRadius = barsRadius - barsLayer.lineWidth * 0.5
            let endBarRadius = startBarRadius + 6

            //угол начала
            var angle: CGFloat = 7/6
            //устанавливаем кол-во черточек
            (1...9) .forEach { _ in
                let barAngle = CGFloat.pi * angle
                let startBarPoint = CGPoint(
                    x: cos(-barAngle) * startBarRadius + center.x,
                    y: sin(-barAngle) * startBarRadius + center.y
                )

                let endBarPoint = CGPoint(
                    x: cos(-barAngle) * endBarRadius + center.x,
                    y: sin(-barAngle) * endBarRadius + center.y
                )

                let barPath = UIBezierPath()
                barPath.move(to: startBarPoint)
                barPath.addLine(to: endBarPoint)

                let barLayer = CAShapeLayer()
                barLayer.path = barPath.cgPath
                barLayer.fillColor = UIColor.clear.cgColor
                barLayer.strokeColor = angle >= (7 / 6 - (8 / 6 * percent))
                ? R.Colors.TabBarColors.active.cgColor : R.Colors.TabBarColors.separator.cgColor
                barLayer.lineCap = .round
                barLayer.lineWidth = 6

                barsLayer.addSublayer(barLayer)

                //поднимает каждый раз на деление
                angle -= 1 / 6
            }




            layer.addSublayer(defaultCircleLayer)
            layer.addSublayer(circleLayer)
            layer.addSublayer(bigDotlayer)
            layer.addSublayer(dotlayer)
            layer.addSublayer(barsLayer)
        }
    }
}
