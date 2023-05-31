//
//  TimerView.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 12/04/23.
//

import UIKit

enum TimerState {
    case isRunning
    case isPaused
    case isStopped

}

final class TimerView: WABaseInfoView {

    private let elapsedTimeLabel: UILabel = {
        let label = UILabel()
        label.text = R.Strings.Session.elapsedTime
        label.font = R.Fonts.helveticaRegular(with: 14)
        label.textColor = R.Colors.BaseController.navBarButtonColorInactive
        label.textAlignment = .center
        return label
    }()

    private let elapsedTimeValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 46)
        label.textColor = R.Colors.NavBarColors.titleGray
        label.textAlignment = .center
        return label
    }()

    private let remainingTimeLabel: UILabel = {
        let label = UILabel()
        label.text = R.Strings.Session.remainingTime
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.BaseController.navBarButtonColorInactive
        label.textAlignment = .center
        return label
    }()

    private let remainingTimeValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.NavBarColors.titleGray
        label.textAlignment = .center
        return label
    }()

    private let timerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        //метод отвечает за пропорциональное расположение всех элементов
        view.distribution = .fillProportionally
        view.spacing = 10
        return view 
    }()

    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.spacing = 25
        return view
    }()

    private let completedPercentView = TimerPersentView()
    private let remainingPercentView = TimerPersentView()

    private let bottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.TabBarColors.separator
        return view
    }()

    private let progressView = ProgressView()

    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0

    var state: TimerState = .isStopped
    var callBack: (() -> Void)? //сбрасывает timer в конце это функциональный тип

    //анимируем progressView
    func configure(with duration: Double, progress: Double) {
        timerDuration = duration

        let tempCurrentValue = progress > duration ? duration : progress

        let gotValuewDevider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / gotValuewDevider
        let roundedPercent = Int(round(percent * 100))

        elapsedTimeValueLabel.text = getDisplayedString(from: Int(tempCurrentValue))
        remainingTimeValueLabel.text = getDisplayedString(from: Int(duration) - Int(tempCurrentValue))
        completedPercentView.configure(title: R.Strings.Session.completed, andWith: roundedPercent)
        remainingPercentView.configure(title: R.Strings.Session.remaining, andWith: 100 - roundedPercent)
        progressView.drawProgress(with: CGFloat(percent))

    }

    //отрисовка анимации таймера!!!
//    func startTimer() { //оригинальный
//        timer.invalidate()
//        timer = Timer.scheduledTimer(withTimeInterval: 0.01,//интервал обновления
//                                     repeats: true,
//                                     block: { [weak self] timer in
//            guard let self = self else { return }
//            self.timerProgress += 0.01
//
//            if self.timerProgress > self.timerDuration {
//                self.timerProgress = self.timerDuration
//                timer.invalidate()
//            }
//
//
//            self.configure(with: self.timerDuration, progress: self.timerProgress)
//        })
//    }

//    func startTimer() { // с callBack
//        timer.invalidate()
//        timer = Timer.scheduledTimer(withTimeInterval: 0.01,//интервал обновления
//                                     repeats: true,
//                                     block: { [weak self] timer in
//            guard let self = self else { return }
//            self.timerProgress += 0.01
//
//            if self.timerProgress > self.timerDuration {
//                self.timerProgress = self.timerDuration
//                timer.invalidate()
//                self.callBack?() //в данном месте у нас должно будет выполниться действие
//            }
//
//
//            self.configure(with: self.timerDuration, progress: self.timerProgress)
//        })
//    }
    func startTimer(completion: @escaping (CGFloat) -> Void) { // с @escaping - позволяет захватить ссылочный тип и не потерять его из памяти
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,//интервал обновления
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress += 0.01

            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
                completion(self.timerProgress)
            }
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }

    func pauseTimer() {
        timer.invalidate()
    }

    func stopTimer() {
        guard self.timerProgress > 0 else {return}
        timer.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 0.01,//интервал обновления
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress -= self.timerDuration * 0.02

            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }

            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
}

    extension TimerView {
        override func setupViews() {
            super.setupViews()
            setupView(progressView)
            setupView(timerStackView)
            setupView(bottomStackView)

            //писание массива в таком виде более приемлемо
            //в конструкции ниже мы используем forEach что ты програнать каждый элемент массива через функцию
            [
                elapsedTimeLabel,
                elapsedTimeValueLabel,
                remainingTimeLabel,
                remainingTimeValueLabel
            ].forEach (timerStackView.addArrangedSubview)

            [
                completedPercentView,
                bottomSeparatorView,
                remainingPercentView,
            ].forEach (bottomStackView.addArrangedSubview)

        }
        override func constrainViews() {
            super.constrainViews()

            NSLayoutConstraint.activate([
                progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
                progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
                progressView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40),
                progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
                progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
                
                timerStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
                timerStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),

                bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
                bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
                bottomStackView.heightAnchor.constraint(equalToConstant: 35),
                bottomStackView.widthAnchor.constraint(equalToConstant: 175),

                bottomSeparatorView.widthAnchor.constraint(equalToConstant: 1)

            ])
        }
        override func configureAppearance() {
            super.configureAppearance()
        }
    }

private extension TimerView {
    func getDisplayedString (from value: Int) -> String { //функция для отображения сколько секунд прошло
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600

        let secondsStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minutesStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"

        return hours == 0
        ? [minutesStr, secondsStr].joined(separator: ":")
        : [hoursStr, minutesStr, secondsStr].joined(separator: ":")
    }
}
